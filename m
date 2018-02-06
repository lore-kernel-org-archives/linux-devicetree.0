From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 2/2] arm64: dts: sdm845: Add serial console support
Date: Tue, 6 Feb 2018 10:37:12 -0800
Message-ID: <CAD=FV=WcCnQJc25=sKWtOi=ZWi=ium6DVsexuQnsLDL=aJE6-Q@mail.gmail.com>
References: <20180125163216.29018-1-rnayak@codeaurora.org> <20180125163216.29018-3-rnayak@codeaurora.org>
 <20180126221808.GE28313@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20180126221808.GE28313@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Rajendra Nayak <rnayak@codeaurora.org>, Andy Gross <andy.gross@linaro.org>, LKML <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, Jan 26, 2018 at 2:18 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 01/25, Rajendra Nayak wrote:
>> diff --git a/arch/arm64/boot/dts/qcom/sdm845-pins.dtsi b/arch/arm64/boot/dts/qcom/sdm845-pins.dtsi
>> new file mode 100644
>> index 000000000000..b97f99e6f4b4
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/sdm845-pins.dtsi
>> @@ -0,0 +1,32 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2018, The Linux Foundation. All rights reserved.
>> + */
>> +
>> +&tlmm {
>
> I'm not the maintainer, but I find this approach to the pins
> really annoying. I have to flip to another file to figure out how
> a board has configured the pins. And we may bring in a bunch of
> settings that we don't ever use on some board too. Why can't we
> put the settings in the board file directly?

I'm not so familiar with how things work with Qualcomm, but in general
I think putting this in the "board" file is a bad idea.  I'd be OK
with putting this directly in the SoC file (though it might get
unwieldy?), but not moving things to the board file as was done with
v2 of this patch.

Said another way: nearly board that uses SDM845 that uses UART2 will
have the same definitions for these pins so we shouldn't be
duplicating it across every board, right?

I'll also respond to the v2 patch so it's obvious there is feedback there...

-Doug
