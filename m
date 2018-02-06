From: Sricharan R <sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 09/15] ARM: dts: ipq4019: Add qcom-ipq4019-ap.dk04.1-c3
 board file
Date: Tue, 6 Feb 2018 11:57:16 +0530
Message-ID: <a9f6233b-0dc2-d729-b7e7-09e228794529@codeaurora.org>
References: <1517202689-14212-1-git-send-email-sricharan@codeaurora.org>
 <1517202689-14212-10-git-send-email-sricharan@codeaurora.org>
 <4a173ff2a74ed7d1555d52674cf64ddd@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4a173ff2a74ed7d1555d52674cf64ddd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-msm-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Abhishek,

On 2/3/2018 5:07 PM, Abhishek Sahu wrote:
> On 2018-01-29 10:41, Sricharan R wrote:
>> Signed-off-by: Sricharan R <sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/Makefile                      |  1 +
>>  arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c3.dts | 14 ++++++++++++++
>>  2 files changed, 15 insertions(+)
>>  create mode 100644 arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c3.dts
>>
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index 68e4b15..0104ba2 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -727,6 +727,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
>>      qcom-ipq4019-ap.dk01.1-c2.dtb \
>>      qcom-ipq4019-ap.dk04.1-c1.dtb \
>>      qcom-ipq4019-ap.dk04.1-c5.dtb \
>> +    qcom-ipq4019-ap.dk04.1-c3.dtb \
>>      qcom-ipq8064-ap148.dtb \
>>      qcom-msm8660-surf.dtb \
>>      qcom-msm8960-cdp.dtb \
>> diff --git a/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c3.dts
>> b/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c3.dts
>> new file mode 100644
>> index 0000000..7a93fc4
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c3.dts
>> @@ -0,0 +1,14 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +// Copyright (c) 2017, The Linux Foundation. All rights reserved.
>> +
>> +#include "qcom-ipq4019-ap.dk04.1.dtsi"
>> +
>> +/ {
>> +    model = "Qualcomm Technologies, Inc. IPQ4019/AP-DK04.1-C3";
>> +
>> +    soc {
>> +        nand: qpic-nand@79b0000 {
>> +            status = "disabled";
>> +        };
> 
>  Normally we need to disable in base dtsi and enable in
>  board dtsi so that base dtsi will always work in all the
>  boards. Now If We load the base dtsi in any DK04 board
>  other than C1, then nand failure will come.

 Hmm, qpic nand is not there only on C3 and available in rest
 of dk04-c* variants. So it should work, downstream also
 does it in same way. Anyways, from a readability point, feel that
 better to make these uncommon configurations in each board file
 specifically rather than putting in common file and changing like this.

Regards,
 Sricharan


-- 
"QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
