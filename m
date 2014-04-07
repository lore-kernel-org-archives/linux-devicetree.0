From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCH v2] clk: qcom: Add support for IPQ8064's global clock controller (GCC)
Date: Mon, 7 Apr 2014 10:10:02 -0500
Message-ID: <AF6AA9C9-6A47-4394-91FD-F7F0C264C530@codeaurora.org>
References: <1396642749-12979-1-git-send-email-galak@codeaurora.org> <1396882918.28420.37.camel@iivanov-dev>
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1396882918.28420.37.camel@iivanov-dev>
Sender: linux-kernel-owner@vger.kernel.org
To: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Cc: Mike Turquette <mturquette@linaro.org>, devicetree@vger.kernel.org, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Apr 7, 2014, at 10:01 AM, Ivan T. Ivanov <iivanov@mm-sol.com> wrote:

> Hi Kumar,
>=20
> On Fri, 2014-04-04 at 15:19 -0500, Kumar Gala wrote:
>> Add a driver for the global clock controller found on IPQ8064 based
>> platforms. This should allow most non-multimedia device drivers to p=
robe
>> and control their clocks.
>>=20
>> This is currently missing clocks for SATA, USB, and networking devic=
es.
>>=20
>> Signed-off-by: Kumar Gala <galak@codeaurora.org>
>> ---
>> v2:
>> * dropped audio clock from commit message
>> * changed Kconfig symbol to IPQ_GCC_806X
>> * Fixed PXO/CXO clk freq to 25Mhz
>>=20
>=20
> <snip>
>=20
>> --- /dev/null
>> +++ b/drivers/clk/qcom/gcc-ipq806x.c
>> @@ -0,0 +1,1957 @@
>> +/*
>> + * Copyright (c) 2014, The Linux Foundation. All rights reserved.
>> + *
>> + * This software is licensed under the terms of the GNU General Pub=
lic
>> + * License version 2, as published by the Free Software Foundation,=
 and
>> + * may be copied, distributed, and modified under those terms.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + */
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/bitops.h>
>> +#include <linux/err.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_device.h>
>> +#include <linux/clk-provider.h>
>> +#include <linux/regmap.h>
>> +#include <linux/reset-controller.h>
>> +
>> +#include <dt-bindings/clock/qcom,gcc-ipq806x.h>
>> +#include <dt-bindings/reset/qcom,gcc-ipq806x.h>
>> +
>> +#include "common.h"
>=20
> Do I miss something or this file is not available?

Its based on Stephen=92s refactoring patch:

https://patchwork.kernel.org/patch/3876761/

- k

--=20
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, host=
ed by The Linux Foundation
