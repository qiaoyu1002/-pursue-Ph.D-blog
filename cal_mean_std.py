import argparse
import os
import numpy as np
import torchvision
import torchvision.transforms as transforms

dataset_names = ('cifar10','cifar100','mnist','fashion_mnist')

parser = argparse.ArgumentParser(description='PyTorchLab')
parser.add_argument('-d', '--dataset', metavar='DATA', default='fashion_mnist', choices=dataset_names,
                    help='dataset to be used: ' + ' | '.join(dataset_names) + ' (default: cifar10)')

args = parser.parse_args()

data_dir = os.path.join('.\Datasets', args.dataset)

print(args.dataset)
if args.dataset == "cifar10":
    train_transform = transforms.Compose([transforms.ToTensor()])
    train_set = torchvision.datasets.CIFAR10(root=data_dir, train=True, download=True, transform=train_transform)

    if (1):
        #print(vars(train_set))
        #####-----method1----#####
        print(train_set.data.min(), train_set.data.max())  # 求最大值，最小值
        print(train_set.data.shape)#(50000, 32, 32, 3) 50000张图片，每张图片是32*32的3通道照片
        print(train_set.data.mean(axis=(0,1,2))/255)
        print(train_set.data.std(axis=(0,1,2))/255)
    else:
        #####----common-method2  from tensor flow https://discuss.pytorch.org/t/normalization-in-the-mnist-example/457/30----#####
        # Note: data type must be numpy.ndarray
        # example of data shape: (50000, 32, 32, 3). Channel is last dimension
        data = train_set.data
        mean = np.round(data.mean(axis=(0, 1, 2)) / 255, 4)
        std = np.round(data.std(axis=(0, 1, 2)) / 255, 4)
        print(f"mean: {mean}\nstd: {std}")

elif args.dataset == "cifar100":
    train_transform = transforms.Compose([transforms.ToTensor()])
    train_set = torchvision.datasets.CIFAR100(root=data_dir, train=True, download=True, transform=train_transform)
    #print(vars(train_set))
    print(train_set.data.min(), train_set.data.max())  # 求最大值，最小值
    print(train_set.data.shape) #(50000, 32, 32, 3)  50000张图片，每张图片是32*32的3通道照片
    print(np.mean(train_set.data, axis=(0,1,2))/255)
    print(np.std(train_set.data, axis=(0,1,2))/255)

elif args.dataset == "mnist":
    train_transform = transforms.Compose([transforms.ToTensor()])
    train_set = torchvision.datasets.MNIST(root=data_dir, train=True, download=True, transform=train_transform)
    #print(vars(train_set))
    print(train_set.data.shape) #[60000, 28, 28]
    print(train_set.data.min(), train_set.data.max()) #求最大值，最小值
    print(train_set.data.float().mean()/255)
    print(train_set.data.float().std()/255)

elif args.dataset == "fashion_mnist":
    train_transform = transforms.Compose([transforms.ToTensor()])
    train_set = torchvision.datasets.FashionMNIST(root=data_dir, train=True, download=True, transform=train_transform)
    print(train_set.data.shape)
    print(train_set.data.min(), train_set.data.max()) #求最大值，最小值
    print(train_set.data.float().mean()/255)
    print(train_set.data.float().std()/255)