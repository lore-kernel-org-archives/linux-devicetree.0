From: Yuval Mintz <Yuval.Mintz-h88ZbnxC6KDQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH V4 net-next 4/5] net:hns: Add support of ethtool TSO set
 option for Hip06 in HNS
Date: Sun, 6 Dec 2015 06:43:12 +0000
Message-ID: <CO2PR11MB008864AFF3D819EFE7A7622B970A0__48113.0098262385$1449384269$gmane$org@CO2PR11MB0088.namprd11.prod.outlook.com>
References: <1448048952-146714-1-git-send-email-salil.mehta@huawei.com>
 <1448048952-146714-5-git-send-email-salil.mehta@huawei.com>
 <CO2PR11MB00885531F54375191E6F015597180@CO2PR11MB0088.namprd11.prod.outlook.com>
 <565DA6F5.7040804@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <565DA6F5.7040804-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Salil Mehta <mehta.salil.lnk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Salil Mehta <salil.mehta-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org" <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "catalin.marinas-5wv7dgnIgG8@public.gmane.org" <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, "will.deacon-5wv7dgnIgG8@public.gmane.org" <will.deacon-5wv7dgnIgG8@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "liguozhu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org" <liguozhu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, "yisen.zhuang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org" <yisen.zhuang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, "dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org" <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, "zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "huangdaode-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org" <huangdaode-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, "kenneth-lee-2012-H32Fclmsjq1BDgjK7y7TUQ@public.gmane.org" <kenneth-lee-2012-H32Fclmsjq1BDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> > Isn't AE_VERSION_1 something fixed once you publish your features?
> > If it can't be changed, why not simply remove the features from
> > `hw_features' instead of having to implement this ndo?
> There could be a case where the feature is supported by the SoC
> and therefore it is already part of the 'hw_features' but it has been
> say DISABLED or ENABLED by ethtool. In such a case, we need to
> make sure we strike off that feature from the 'features' flag.
> 
> Therefore, we need this leg I suppose. Let me know If I am missing
> something here or there is a gap in my understanding.

Look at ethtool_set_features() - if something isn't listed in hw_features,
you're not support to be able to change it.

If you can make a one-time decision when registering the netdevice
whether this feature is supported by HW or not [assuming AE_VERSION_1
is available at that point and can't later change] than it's the better alternative.

Cheers,
Yuval 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
