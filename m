From: Boris BREZILLON <b.brezillon.dev@gmail.com>
Subject: Re: [PATCH 00/11] ARM: at91: rework main and slow clk implementation
Date: Wed, 19 Mar 2014 10:48:20 +0100
Message-ID: <532967E4.8090001@gmail.com>
References: <1395173924-3648-1-git-send-email-b.brezillon.dev@gmail.com> <3485B87A-1832-4EE3-8613-B5165C282397@jcrosoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <3485B87A-1832-4EE3-8613-B5165C282397@jcrosoft.com>
Sender: linux-doc-owner@vger.kernel.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>, Mike Turquette <mturquette@linaro.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Jean-Jacques Hiblot <jjhiblot@traphandler.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hello Jean-Christophe,

Le 19/03/2014 07:06, Jean-Christophe PLAGNIOL-VILLARD a =E9crit :
> You must keep me in Cc

I always did, this is an oversight.

>
> first and last warning

Now, this is my turn.

I don't like to be threatened, especially when this message is only sen=
t=20
to me.
BTW, last warning, then what ?

Now let's talk about your attitude.

Regarding this specific series: I sent you several versions of the at91=
=20
CCF based
clk implementation and you never fully reviewed those series (despite=20
the fact you
told me you would do it), why are you so interested in the at91 CCF=20
implementation
now ?

Moreover, most of the time when you review a patchset your remarks are=20
far from
constructive, and we always have to ask you several times to get a real=
=20
explanation.

I'm not telling you're wrong when you "NACK" something, but explaining=20
the reasons
are part of your maintainer's job.

This being said, I'll take care to keep you in Cc of all at91 related=20
patches.

Best Regards,

Boris

>
> On Mar 19, 2014, at 4:18 AM, Boris BREZILLON <brezillonboris@gmail.co=
m> wrote:
>
>> Hello,
>>
>> This series introduce the real clock model (as described in atmel da=
tasheets)
>> for slow and main clocks.
>>
>> The modifications introduced by this series break the DT compat, but=
, as the
>> at91 CCF based implementation is pretty new (introduced in 3.14 only=
 for sama5
>> eval boards) I think it won't impact a lot of users.
>>
>> I tested it on sama5d3.
>> Alexandre, Jean-Jacques, could you test this series on your eval boa=
rds
>> (sam9261ek and sam9rlek) so that we can move to this new model and h=
opefully
>> consider the at91 clk DT binding as (almost :-)) stable.
>>
>> Jean-Jacques, as you can see I reworked my first implementation as y=
ou
>> suggested, do you want me to add your Signed-off-by in the next vers=
ion ?
>>
>> Mike, if this series is accepted, I'd like to get it merged as soon =
as possible
>> to prevent other developpers from using a deprecated DT binding.
>>
>> Best Regards,
>>
>> Boris
>>
>> Boris BREZILLON (11):
>>   clk: at91: rework main clk implementation
>>   clk: at91: update main clk documentation
>>   clk: at91: add slow clks driver
>>   clk: at91: add slow clk documentation
>>   ARM: at91/dt: move sama5d3 SoC to the new main/slow clk model
>>   ARM: at91/dt: add xtal frequencies to sama5d3xcm boards
>>   ARM: at91/dt: add xtal frequencies to sama5d3 xplained board
>>   ARM: at91/dt: move at91sam9261 SoC to the new main clock model
>>   ARM: at91/dt: define main xtal frequency of the at91sam9261ek boar=
d
>>   ARM: at91/dt: move at91sam9rl SoC to the new slow/main clock model=
s
>>   ARM: at91/dt: define sam9rlek crystal frequencies
>>
>> .../devicetree/bindings/clock/at91-clock.txt       |  128 ++++-
>> arch/arm/boot/dts/at91-sama5d3_xplained.dts        |   10 +
>> arch/arm/boot/dts/at91sam9261.dtsi                 |   10 +-
>> arch/arm/boot/dts/at91sam9261ek.dts                |    4 +
>> arch/arm/boot/dts/at91sam9rl.dtsi                  |   45 +-
>> arch/arm/boot/dts/at91sam9rlek.dts                 |    8 +
>> arch/arm/boot/dts/sama5d3.dtsi                     |   61 +-
>> arch/arm/boot/dts/sama5d3xcm.dtsi                  |   10 +
>> drivers/clk/at91/Makefile                          |    4 +-
>> drivers/clk/at91/clk-main.c                        |  581 ++++++++++=
+++++++---
>> drivers/clk/at91/clk-slow.c                        |  467 ++++++++++=
++++++
>> drivers/clk/at91/pmc.c                             |   12 +
>> drivers/clk/at91/pmc.h                             |    9 +
>> drivers/clk/at91/sckc.c                            |   57 ++
>> drivers/clk/at91/sckc.h                            |   22 +
>> include/linux/clk/at91_pmc.h                       |    1 +
>> 16 files changed, 1342 insertions(+), 87 deletions(-)
>> create mode 100644 drivers/clk/at91/clk-slow.c
>> create mode 100644 drivers/clk/at91/sckc.c
>> create mode 100644 drivers/clk/at91/sckc.h
>>
>> --=20
>> 1.7.9.5
>>
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

