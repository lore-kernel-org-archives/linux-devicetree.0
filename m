From: Sricharan R <sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 07/15] ARM: dts: ipq4019: Add ipq4019-ap.dk04.1-c1 board
 file
Date: Tue, 6 Feb 2018 11:48:49 +0530
Message-ID: <4df81f9e-a018-822c-066b-e9735ed9908b@codeaurora.org>
References: <1517202689-14212-1-git-send-email-sricharan@codeaurora.org>
 <1517202689-14212-8-git-send-email-sricharan@codeaurora.org>
 <6821d93c282c8337b2a58c5c9337a008@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6821d93c282c8337b2a58c5c9337a008-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-msm-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Abhishek,

On 2/3/2018 5:00 PM, Abhishek Sahu wrote:
> On 2018-01-29 10:41, Sricharan R wrote:
>> Signed-off-by: Sricharan R <sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/Makefile                      | 1 +
>>  arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c1.dts | 8 ++++++++
>>  2 files changed, 9 insertions(+)
>>  create mode 100644 arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c1.dts
>>
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index 21ed56d..1a8ab050 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -725,6 +725,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
>>      qcom-apq8084-mtp.dtb \
>>      qcom-ipq4019-ap.dk01.1-c1.dtb \
>>      qcom-ipq4019-ap.dk01.1-c2.dtb \
>> +    qcom-ipq4019-ap.dk04.1-c1.dtb \
>>      qcom-ipq8064-ap148.dtb \
>>      qcom-msm8660-surf.dtb \
>>      qcom-msm8960-cdp.dtb \
>> diff --git a/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c1.dts
>> b/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c1.dts
>> new file mode 100644
>> index 0000000..41123be
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c1.dts
>> @@ -0,0 +1,8 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +// Copyright (c) 2017, The Linux Foundation. All rights reserved.
>> +
>> +#include "qcom-ipq4019-ap.dk04.1.dtsi"
>> +
>> +/ {
>> +    model = "Qualcomm Technologies, Inc. IPQ4019/AP-DK04.1-C1";
>> +};
> 
>  It seems major diff between DK01 C1 and other variants is
>  qpic nand. qpic nand is only available in C1 so do we need
>  to disable the nand is base dk04 dtsi and enable it in this
>  C1 dts only. same for qpic bam.

 C1 - Has QPIC NAND, spi 78b5000-> cs0 -> spi_nor
 C5 - Has QPIC NAND, spi 78b5000-> cs0 -> spi_nor, cs1 -> spi_nand
 C2 - Has QPIC NAND, spi 78b5000-> cs0 -> spi_nor ( Audio board, yet to be posted for pending audio drivers)
 C3 - spi 78b5000-> cs0 -> spi_nor

 So C3 is the board where it is disabled and enabled in the rest. But from a
 readability point, feels better to touch this only in each board specific file.
 So will remove this from the common 04.dtsi and move it to each board file.

Regards,
 Sricharan

-- 
"QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
