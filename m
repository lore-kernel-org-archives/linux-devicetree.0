From: Kevin Hilman <khilman@linaro.org>
Subject: Re: [PATCH 0/2] IO voltage domain support for rk3188 and rk3288
Date: Wed, 10 Sep 2014 16:12:55 -0700
Message-ID: <7hlhprqdc8.fsf@linaro.org>
References: <1409254565-10677-1-git-send-email-dianders@chromium.org>
	<53FF9E93.3040601@ti.com>
	<CAD=FV=Vcj+tAno92c38Prviyi-v2CmuGSzak1ppETL033KAF4w@mail.gmail.com>
	<1450179.xJuMFg9Vvn@diego>
	<CACRpkda-XS0XLSkAZ-16=JvD8FbRJNuN4UVL4dMyV71bfU5T2A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkda-XS0XLSkAZ-16=JvD8FbRJNuN4UVL4dMyV71bfU5T2A@mail.gmail.com>
	(Linus Walleij's message of "Thu, 4 Sep 2014 18:51:47 +0200")
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Ulf Hansson <ulf.hansson@linaro.org>, Doug Anderson <dianders@chromium.org>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Mark Brown <broonie@kernel.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Addy Ke <addy.ke@rock-chips.com>, Sonny Rao <sonnyrao@chromium.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Stephen Warren <swarren@nvidia.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Peter De Schrijver <pdeschrijver@nvidia.com>, Andy Gross <agross@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-k>
List-Id: devicetree@vger.kernel.org

Linus Walleij <linus.walleij@linaro.org> writes:

> On Sat, Aug 30, 2014 at 1:27 PM, Heiko St=C3=BCbner <heiko@sntech.de>=
 wrote:
>> Am Freitag, 29. August 2014, 21:51:46 schrieb Doug Anderson:
>>> On Thu, Aug 28, 2014 at 2:26 PM, Santosh Shilimkar
>>>
>>> <santosh.shilimkar@ti.com> wrote:
>>> > On Thursday 28 August 2014 03:36 PM, Doug Anderson wrote:
>>> >> These two patches add support for automatically configuring the =
IO
>>> >> voltage domains on rk3188 and rk3288 SoCs.  The first patch adds=
 some
>>> >> new notification types to the regulator code.  It's used by the =
second
>>> >> patch which actually implements the IO voltage domain driver.
>>> >>
>>> >> These two patches were co-developed by Heiko St=C3=BCbner and Do=
ug Anderson
>>> >> (proof of concept patches were written by Heiko).  They were tes=
ted in
>>> >> a private branch on an rk3288 board using rk808 instead of mainl=
ine
>>> >> since rk808 support isn't finalized in mainline yet.
>>> >>
>>> >> (sorry if you got this series twice; my mailer seems unhappy wit=
h me)
>>> >>
>>> >> Heiko St=C3=BCbner (2):
>>> >>   regulator: core: Add REGULATOR_EVENT_PRE_VOLTAGE_CHANGE (and A=
BORT)
>>> >>   soc/rockchip: io-domain: add driver handling io domains
>>> >
>>> > Sorry to shot down but your IO domains are nothing but voltage do=
mains
>>> > and you should really build something in the drivers/power/*
>>>
>>> If everyone agrees that this belongs in drivers/power that's totall=
y
>>> OK.  Neither Heiko nor I was confident that it should be in
>>> drivers/soc.  I had even though that the code wouldn't be totally o=
ut
>>> of place in the Rockchip pinctrl driver (adding Linus W since I thi=
nk
>>> some SoCs did add code to handle 3.3V vs. 1.8V in pinctrl).
>>
>> a bit of context for Linus ...
>>
>> This is essentially the continuation of  the thread "io-domain volta=
ges as
>> regulators?" from the beginning of august. After more discussions we=
 found out
>> that the io voltage selection I asked about is not an independent su=
pply, but
>> instead has to reflect the voltage of the real supplying regulator.
>>
>> And setting the io-voltage setting to 1.8V while the regulator is su=
pplying
>> 3.3V for example may actually damage the chip.
>>
>>
>> So in our current approach here, we added a driver that tracks volta=
ge changes
>> of the supplying regulator via a notifier and sets the register bits
>> accordingly.
>
> I feel I'm not smart enough for this. You need the PM people to look
> at this stuff, like Rafael Wysocki, Kevin Hilman and Ulf Hansson.

I think the best fit for this is along with the Adaptive Voltage Scalin=
g
(AVS) stuff we currently have in drivers/power/avs.  It's not exactly
adaptive in the same sense as the TI/SmartReflex is because there's no
hardware being configured to dynamically make micro-adjustments to the
regulators.  But, it is adaptive in the sense that there's SoC-specific
"stuff" to do right around the same time the voltage is scaled.

So I would suggest drivers/power/avs.

Kevin
