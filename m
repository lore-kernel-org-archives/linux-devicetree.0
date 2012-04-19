From: "Turquette, Mike" <mturquette@ti.com>
Subject: Re: [PATCH 1/4] clk: select CLKDEV_LOOKUP for COMMON_CLK
Date: Thu, 19 Apr 2012 13:01:15 -0700
Message-ID: <CAJOA=zNwueCeSjT2F-M1+Ffu49t5tMBow=8baGrvZdGjrUCMrA@mail.gmail.com>
References: <1334003101-17274-1-git-send-email-robherring2@gmail.com>
 <1334003101-17274-2-git-send-email-robherring2@gmail.com> <CAJOA=zMPqiH2fQJ5JWJ=COnju7Cmur6J2ATYUTcx41C4WMjFQQ@mail.gmail.com>
 <20120418070721.GL3852@pengutronix.de> <4F902858.9040905@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4F902858.9040905@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Thierry Reding <thierry.reding@avionic-design.de>, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, Sascha Hauer <kernel@pengutronix.de>, shawn.guo@linaro.org
List-Id: devicetree@vger.kernel.org

On Thu, Apr 19, 2012 at 7:59 AM, Rob Herring <robherring2@gmail.com> wr=
ote:
> On 04/18/2012 02:07 AM, Sascha Hauer wrote:
>> On Tue, Apr 17, 2012 at 03:13:49PM -0700, Turquette, Mike wrote:
>>> On Mon, Apr 9, 2012 at 1:24 PM, Rob Herring <robherring2@gmail.com>=
 wrote:
>>>> From: Rob Herring <rob.herring@calxeda.com>
>>>>
>>>> Using the common clock infrastructure without the common clkdev co=
de makes
>>>> little sense, so select CLKDEV_LOOKUP for COMMON_CLK.
>>>>
>>>> Signed-off-by: Rob Herring <rob.herring@calxeda.com>
>>>> ---
>>>> =A0drivers/clk/Kconfig | =A0 =A01 +
>>>> =A01 files changed, 1 insertions(+), 0 deletions(-)
>>>>
>>>> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
>>>> index 165e1fe..f05a60d 100644
>>>> --- a/drivers/clk/Kconfig
>>>> +++ b/drivers/clk/Kconfig
>>>> @@ -12,6 +12,7 @@ config HAVE_MACH_CLKDEV
>>>> =A0config COMMON_CLK
>>>> =A0 =A0 =A0 =A0bool
>>>> =A0 =A0 =A0 =A0select HAVE_CLK_PREPARE
>>>> + =A0 =A0 =A0 select CLKDEV_LOOKUP
>>>> =A0 =A0 =A0 =A0---help---
>>>> =A0 =A0 =A0 =A0 =A0The common clock framework is a single definiti=
on of struct
>>>> =A0 =A0 =A0 =A0 =A0clk, useful across many platforms, as well as a=
n
>>>
>>> Hi Rob,
>>>
>>> I agree that the common clk framework is not particularly useful
>>> without clkdev. =A0However the core code has no dependency on clkde=
v.
>>> Why not just select it from an arch Kconfig, or even make it a
>>> dependency based on your own platform clock data/code?
>>
>> Selecting it from COMMON_CLK means that the compiler/linker will poi=
nt
>> everybody trying to implement it without CLKDEV into the right
>> direction.
>
> Right. That was part of my rationale as well.
>
> The DT clock support is dependent on both options, so without this pa=
tch
> we'll have to add an otherwise unneeded OF_CLOCK option to select bot=
h.

Ok.  I'll take this into my -next branch.

Thanks,
Mike
