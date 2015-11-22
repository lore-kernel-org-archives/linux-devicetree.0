Return-Path: <Yuval.Mintz@qlogic.com>
From: Yuval Mintz <Yuval.Mintz@qlogic.com>
Subject: RE: [PATCH V4 net-next 4/5] net:hns: Add support of ethtool TSO set
 option for Hip06 in HNS
Date: Sun, 22 Nov 2015 11:17:13 +0000
Message-ID: <CO2PR11MB00885531F54375191E6F015597180@CO2PR11MB0088.namprd11.prod.outlook.com>
References: <1448048952-146714-1-git-send-email-salil.mehta@huawei.com>
 <1448048952-146714-5-git-send-email-salil.mehta@huawei.com>
In-Reply-To: <1448048952-146714-5-git-send-email-salil.mehta@huawei.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Salil Mehta <salil.mehta@huawei.com>, David Miller <davem@davemloft.net>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "paul.gortmaker@windriver.com" <paul.gortmaker@windriver.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "arnd@arndb.de" <arnd@arndb.de>, "liguozhu@hisilicon.com" <liguozhu@hisilicon.com>, "yisen.zhuang@huawei.com" <yisen.zhuang@huawei.com>, "dingtianhong@huawei.com" <dingtianhong@huawei.com>, "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>, "huangdaode@hisilicon.com" <huangdaode@hisilicon.com>, "kenneth-lee-2012@foxmail.com" <kenneth-lee-2012@foxmail.com>, "mehta.salil.lnk@gmail.com" <mehta.salil.lnk@gmail.com>, "xuwei5@hisilicon.com" <xuwei5@hisilicon.com>, "lisheng011@huawei.com" <lisheng011@huawei.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, netdev <netdev@vger.kernel.org>, "linuxarm@huawei.com" <linuxarm@huawei.com>
List-ID: <devicetree@vger.kernel.org>

> +static netdev_features_t hns_nic_fix_features(
> +		struct net_device *netdev, netdev_features_t features) {
> +	struct hns_nic_priv *priv =3D netdev_priv(netdev);
> +
> +	switch (priv->enet_ver) {
> +	case AE_VERSION_1:
> +		features &=3D ~(NETIF_F_TSO | NETIF_F_TSO6 |
> +				NETIF_F_HW_VLAN_CTAG_FILTER);
> +		break;
> +	default:
> +		break;
> +	}
> +	return features;
> +}
> +

Isn't AE_VERSION_1 something fixed once you publish your features?
If it can't be changed, why not simply remove the features from
`hw_features' instead of having to implement this ndo?
