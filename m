From: Salil Mehta <mehta.salil.lnk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V4 net-next 4/5] net:hns: Add support of ethtool TSO set
 option for Hip06 in HNS
Date: Tue, 1 Dec 2015 13:56:05 +0000
Message-ID: <565DA6F5.7040804__15509.2290290215$1448978309$gmane$org@gmail.com>
References: <1448048952-146714-1-git-send-email-salil.mehta@huawei.com>
 <1448048952-146714-5-git-send-email-salil.mehta@huawei.com>
 <CO2PR11MB00885531F54375191E6F015597180@CO2PR11MB0088.namprd11.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CO2PR11MB00885531F54375191E6F015597180-aWXWhCNu7Z/c7AgKY82GyJPPoyLQLiKMvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuval Mintz <Yuval.Mintz-h88ZbnxC6KDQT0dZR+AlfA@public.gmane.org>, Salil Mehta <salil.mehta-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org" <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "catalin.marinas-5wv7dgnIgG8@public.gmane.org" <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, "will.deacon-5wv7dgnIgG8@public.gmane.org" <will.deacon-5wv7dgnIgG8@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "liguozhu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org" <liguozhu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, "yisen.zhuang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org" <yisen.zhuang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, "dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org" <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, "zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "huangdaode-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org" <huangdaode-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, "kenneth-lee-2012-H32Fclmsjq1BDgjK7y7TUQ@public.gmane.org" <kenneth-lee-2012-H32Fclmsjq1BDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 22/11/15 11:17, Yuval Mintz wrote:
>> +static netdev_features_t hns_nic_fix_features(
>> +		struct net_device *netdev, netdev_features_t features) {
>> +	struct hns_nic_priv *priv = netdev_priv(netdev);
>> +
>> +	switch (priv->enet_ver) {
>> +	case AE_VERSION_1:
>> +		features &= ~(NETIF_F_TSO | NETIF_F_TSO6 |
>> +				NETIF_F_HW_VLAN_CTAG_FILTER);
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +	return features;
>> +}
>> +
> Isn't AE_VERSION_1 something fixed once you publish your features?
> If it can't be changed, why not simply remove the features from
> `hw_features' instead of having to implement this ndo?
Hi Yuval,
I some how missed to reply this, though I worked on your suggestions
in the already floated V5 patch earlier. Sorry for this!
There could be a case where the feature is supported by the SoC
and therefore it is already part of the 'hw_features' but it has been
say DISABLED or ENABLED by ethtool. In such a case, we need to
make sure we strike off that feature from the 'features' flag.

Therefore, we need this leg I suppose. Let me know If I am missing
something here or there is a gap in my understanding.

Thanks
Salil


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
