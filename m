From: Salil Mehta <salil.mehta-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V3 net-next 3/5] net:hns: Add Hip06 "TSO(TCP Segment Offload)"
 support HNS Driver
Date: Thu, 26 Nov 2015 08:19:26 +0000
Message-ID: <5656C08E.2010105__48410.3718809367$1448526102$gmane$org@huawei.com>
References: <1447966706-16219-1-git-send-email-salil.mehta@huawei.com> <1447966706-16219-4-git-send-email-salil.mehta@huawei.com> <CO2PR11MB00885067453FB6462178765497180@CO2PR11MB0088.namprd11.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CO2PR11MB00885067453FB6462178765497180-aWXWhCNu7Z/c7AgKY82GyJPPoyLQLiKMvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuval Mintz <Yuval.Mintz-h88ZbnxC6KDQT0dZR+AlfA@public.gmane.org>, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org" <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "catalin.marinas-5wv7dgnIgG8@public.gmane.org" <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, "will.deacon-5wv7dgnIgG8@public.gmane.org" <will.deacon-5wv7dgnIgG8@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "liguozhu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org" <liguozhu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, "yisen.zhuang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org" <yisen.zhuang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, "dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org" <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, "zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "huangdaode-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org" <huangdaode-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, "kenneth-lee-2012-H32Fclmsjq1BDgjK7y7TUQ@public.gmane.org" <kenneth-lee-2012-H32Fclmsjq1BDgjK7y7TUQ@public.gmane.org>, "mehta.salil.lnk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <mehta.sal>
List-Id: devicetree@vger.kernel.org


On 11/22/2015 8:49 AM, Yuval Mintz wrote:
>> +static void hns_ae_set_tso_stats(struct hnae_handle *handle, int
>> +enable) {
>> +	struct hns_ppe_cb *ppe_cb = hns_get_ppe_cb(handle);
>> +
>> +	hns_ppe_set_tso_enable(ppe_cb, enable); }
> Style issues?
I could not see the code style issue menioned above in earlier submitted 
patch. Looks like I am misssing something here!

+static void hns_ae_set_tso_stats(struct hnae_handle *handle, int enable)
+{
+	struct hns_ppe_cb *ppe_cb = hns_get_ppe_cb(handle);
+
+	hns_ppe_set_tso_enable(ppe_cb, enable);
+}
+

>
>> +void hns_ppe_set_tso_enable(struct hns_ppe_cb *ppe_cb, u32 value) {
>> +	dsaf_set_dev_bit(ppe_cb, PPEV2_CFG_TSO_EN_REG, 0, !!value); }
>> +
> Likewise
Same in above case. Hope I am not missing anything.

  #include "hns_dsaf_ppe.h"
  
+void hns_ppe_set_tso_enable(struct hns_ppe_cb *ppe_cb, u32 value)
+{
+	dsaf_set_dev_bit(ppe_cb, PPEV2_CFG_TSO_EN_REG, 0, !!value);
+}
+




--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
