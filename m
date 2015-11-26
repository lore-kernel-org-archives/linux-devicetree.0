Return-Path: <salil.mehta@huawei.com>
Message-ID: <5656C08E.2010105@huawei.com>
Date: Thu, 26 Nov 2015 08:19:26 +0000
From: Salil Mehta <salil.mehta@huawei.com>
MIME-Version: 1.0
Subject: Re: [PATCH V3 net-next 3/5] net:hns: Add Hip06 "TSO(TCP Segment Offload)"
 support HNS Driver
References: <1447966706-16219-1-git-send-email-salil.mehta@huawei.com> <1447966706-16219-4-git-send-email-salil.mehta@huawei.com> <CO2PR11MB00885067453FB6462178765497180@CO2PR11MB0088.namprd11.prod.outlook.com>
In-Reply-To: <CO2PR11MB00885067453FB6462178765497180@CO2PR11MB0088.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
To: Yuval Mintz <Yuval.Mintz@qlogic.com>, David Miller <davem@davemloft.net>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "paul.gortmaker@windriver.com" <paul.gortmaker@windriver.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "arnd@arndb.de" <arnd@arndb.de>, "liguozhu@hisilicon.com" <liguozhu@hisilicon.com>, "yisen.zhuang@huawei.com" <yisen.zhuang@huawei.com>, "dingtianhong@huawei.com" <dingtianhong@huawei.com>, "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>, "huangdaode@hisilicon.com" <huangdaode@hisilicon.com>, "kenneth-lee-2012@foxmail.com" <kenneth-lee-2012@foxmail.com>, "mehta.salil.lnk@gmail.com" <mehta.salil.lnk@gmail.com>, "xuwei5@hisilicon.com" <xuwei5@hisilicon.com>, "lisheng011@huawei.com" <lisheng011@huawei.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, netdev <netdev@vger.kernel.org>, "linuxarm@huawei.com" <linuxarm@huawei.com>
List-ID: <devicetree@vger.kernel.org>


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
