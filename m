From: Salil Mehta <salil.mehta-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V3 net-next 2/5] net:hns: Add Hip06 "RSS(Receive Side
 Scaling)" support to HNS Driver
Date: Thu, 26 Nov 2015 07:31:07 +0000
Message-ID: <5656B53B.3080205@huawei.com>
References: <1447966706-16219-1-git-send-email-salil.mehta@huawei.com> <1447966706-16219-3-git-send-email-salil.mehta@huawei.com> <CO2PR11MB0088B852596B9F86F7BDCF6F97180@CO2PR11MB0088.namprd11.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CO2PR11MB0088B852596B9F86F7BDCF6F97180-aWXWhCNu7Z/c7AgKY82GyJPPoyLQLiKMvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuval Mintz <Yuval.Mintz-h88ZbnxC6KDQT0dZR+AlfA@public.gmane.org>, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org" <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "catalin.marinas-5wv7dgnIgG8@public.gmane.org" <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, "will.deacon-5wv7dgnIgG8@public.gmane.org" <will.deacon-5wv7dgnIgG8@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "liguozhu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org" <liguozhu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, "yisen.zhuang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org" <yisen.zhuang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, "dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org" <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, "zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "huangdaode-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org" <huangdaode-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, "kenneth-lee-2012-H32Fclmsjq1BDgjK7y7TUQ@public.gmane.org" <kenneth-lee-2012-H32Fclmsjq1BDgjK7y7TUQ@public.gmane.org>, "mehta.salil.lnk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <mehta.sal>
List-Id: devicetree@vger.kernel.org


On 11/22/2015 9:30 AM, Yuval Mintz wrote:
>>   static void hns_ppe_init_hw(struct hns_ppe_cb *ppe_cb)  {
> ...
>> +	/* Set default RSS key and indrection table*/
>> +	const u32 rss_key[HNS_PPEV2_RSS_KEY_NUM] = {
>> +		0x6d5a56da, 0x255b0ec2,
>> +		0x4167253d, 0x43a38fb0,
>> +		0xd0ca2bcb, 0xae7b30b4,
>> +		0x77cb2da3, 0x8030f20c,
>> +		0x6a42b73b, 0xbeac01fa,
>> +	};
>> +
>> +	/* set default RSS key and remember it */
>> +	for (i = 0; i < HNS_PPEV2_RSS_KEY_NUM; i++)
>> +		ppe_cb->rss_key[i]  = rss_key[i];
>>
> Is there any reason for the special default key?
> Why not use netdev_rss_key_fill()?
Thanks for pointing out this. I have incorported this change in latest 
PATCH V5
>


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
