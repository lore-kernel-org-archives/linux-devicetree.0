From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH v2 2/6] clk: mvebu: Add the xtal clock for Armada 3700 SoC
Date: Tue, 12 Jul 2016 12:43:38 +0200
Message-ID: <87vb0brvad.fsf@free-electrons.com>
References: <1467931071-31004-1-git-send-email-gregory.clement@free-electrons.com>
	<1467931071-31004-3-git-send-email-gregory.clement@free-electrons.com>
	<CAP=VYLoZdyqP7vLa_pCx3mNpFuYCRaNgkT-STtk571U0KAgdLw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAP=VYLoZdyqP7vLa_pCx3mNpFuYCRaNgkT-STtk571U0KAgdLw@mail.gmail.com>
	(Paul Gortmaker's message of "Sat, 9 Jul 2016 19:34:59 -0400")
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Nadav Haklai <nadavh@marvell.com>, Victor Gu <xigu@marvell.com>, Romain Perier <romain.perier@free-electrons.com>, Omri Itach <omrii@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Wilson Ding <dingwei@marvell.com>, Hua Jing <jinghua@marvell.com>, Terry Zhou <bjzhou@marvell.com>
List-Id: devicetree@vger.kernel.org

Hi Paul,
 
 On dim., juil. 10 2016, Paul Gortmaker <paul.gortmaker@windriver.com> wrote:

> On Thu, Jul 7, 2016 at 6:37 PM, Gregory CLEMENT
> <gregory.clement@free-electrons.com> wrote:
>> This clock is the parent of all the Armada 3700 clocks. It is a fixed
>> rate clock which depends on the gpio configuration read when resetting
>> the SoC.
>>
>> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
>> ---
>>  drivers/clk/mvebu/Kconfig            |  3 ++
>>  drivers/clk/mvebu/Makefile           |  1 +
>>  drivers/clk/mvebu/armada-37xx-xtal.c | 98 ++++++++++++++++++++++++++++++++++++
>>  3 files changed, 102 insertions(+)
>>  create mode 100644 drivers/clk/mvebu/armada-37xx-xtal.c
>>
>> diff --git a/drivers/clk/mvebu/Kconfig b/drivers/clk/mvebu/Kconfig
>> index 3165da77d525..fddc8ac5faff 100644
>> --- a/drivers/clk/mvebu/Kconfig
>> +++ b/drivers/clk/mvebu/Kconfig
>> @@ -24,6 +24,9 @@ config ARMADA_39X_CLK
>>         bool
>>         select MVEBU_CLK_COMMON
>>
>> +config ARMADA_37XX_CLK
>> +       bool
>> +
>
> Since the driver is not tristate, can you please remove all modular
> references from it?   With the author and license etc. at the top you
> can just delete the last three lines, the DEVICE_TABLE and register
> with builtin_platform_driver, and then no need for module.h either.
>
> Either that, or change it to a tristate, if that use case makes sense.

Indeed having these clock drivers as module is not very useful. Let's
remove the modular reference.

Thanks,

Gregory


>
> Thanks,
> Paul.
> --
>
>
>>  config ARMADA_XP_CLK
>>         bool
>>         select MVEBU_CLK_COMMON
>> diff --git a/drivers/clk/mvebu/Makefile b/drivers/clk/mvebu/Makefile
>> index 7172ef65693d..4257a36d0219 100644
>> --- a/drivers/clk/mvebu/Makefile
>> +++ b/drivers/clk/mvebu/Makefile
>> @@ -6,6 +6,7 @@ obj-$(CONFIG_ARMADA_370_CLK)    += armada-370.o
>>  obj-$(CONFIG_ARMADA_375_CLK)   += armada-375.o
>>  obj-$(CONFIG_ARMADA_38X_CLK)   += armada-38x.o
>>  obj-$(CONFIG_ARMADA_39X_CLK)   += armada-39x.o
>> +obj-$(CONFIG_ARMADA_37XX_CLK)  += armada-37xx-xtal.o
>>  obj-$(CONFIG_ARMADA_XP_
>
> [...]

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
