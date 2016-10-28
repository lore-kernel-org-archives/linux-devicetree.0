From: Jeremy McNicoll <jmcnicol@redhat.com>
Subject: Re: [PATCH 5/6] arm64: dts: msm8994 SoC and Huawei Angler (Nexus 6P)
 support
Date: Thu, 27 Oct 2016 17:54:01 -0700
Message-ID: <822ebad4-4fdf-574a-12cb-75b0165f4746@redhat.com>
References: <1477394221-30963-1-git-send-email-jeremymc@redhat.com>
 <1477394221-30963-6-git-send-email-jeremymc@redhat.com>
 <20161028000656.GH26139@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20161028000656.GH26139@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Jeremy McNicoll <jeremymc@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, andy.gross@linaro.org, arnd@arndb.de, bjorn.andersson@linaro.org, mark.rutland@arm.com, michael.scott@linaro.org, =?UTF-8?Q?Bastian_K=c3=b6cher?= <mail@kchr.de>
List-Id: devicetree@vger.kernel.org

On 2016-10-27 5:06 PM, Stephen Boyd wrote:
> On 10/25, Jeremy McNicoll wrote:
>> diff --git a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
>> new file mode 100644
>> index 0000000..2fc68c4
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
>> @@ -0,0 +1,40 @@
>> +/* Copyright (c) 2015, Huawei Inc. All rights reserved.
>> + * Copyright (c) 2016, The Linux Foundation. All rights reserved.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 and
>> + * only version 2 as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include "msm8994-v2.0.dtsi"
>> +
>> +/ {
>> +	model = "HUAWEI MSM8994 ANGLER rev-1.01";
>> +	compatible = "qcom,msm8994";
>
> Please replace this with something more specific for the actual
> board. Preferably with the board manufacturer vendor prefix and
> some sort of string for the board.
>


Not really sure what to put here, I would like to use my 'ask the 
audience lifeline' on this one.

-jeremy
