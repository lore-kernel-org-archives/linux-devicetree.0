From: Rob Herring <robh@kernel.org>
Subject: Re: Moving ARM dts files
Date: Tue, 4 Dec 2018 13:09:07 -0600
Message-ID: <CAL_JsqJUt2igJ+42N82J4hh8u=Ai_ez6cyWwNvreU71dTHa4hA@mail.gmail.com>
References: <20181204183649.GA5716@bogus> <20181204184745.GS8952@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181204184745.GS8952@piout.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Thierry Reding <thierry.reding@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@kernel.org>, Gregory CLEMENT <gregory.clement@bootlin.com>, Michal Simek <michal.simek@xilinx.com>, Krzysztof Kozlowski <krzk@kernel.org>, ARM-SoC Maintainers <arm@kernel.org>, Joel Stanley <joel@jms.id.au>, Andy Gross <andy.gross@linaro.org>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Simon Horman <horms@verge.net.au>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>Daniel Mack <d>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 4, 2018 at 12:47 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello Rob,
>
> On 04/12/2018 12:36:49-0600, Rob Herring wrote:
> > Olof, Arnd,
> >
> > I've put together a script to move the dts files and update the
> > makefiles. It doesn't handle files not following a common prefix which
> > isn't many and some includes within the dts files will need some fixups
> > by hand.
> >
> > MAINTAINERS will also need updating.
> >
> > A few questions:
> >
> > Do we want to move absolutely everything to subdirs? There's quite a
> > few platforms with only 1-2 platforms. I haven't added these to the
> > list yet, but can.
> >
> > Do any vendors need another level of directories? davinci, omap, nspire,
> > etc. for TI for example.
> >
> > What to do with armv7m.dtsi? I guess it should remain and we just fixup
> > the include. There may be a few other cross vendor things.
> >
> >
> > Sub-arch maintainers,
> > 'vendor_map' below is the mapping of file prefix to new subdirectory
> > (the SoC vendor prefix). Please comment if there are any issues.
> >
> > Rob
> >
> > 8<-----------------------------------------------------------
> > #!/usr/bin/env python3
> >
> > import os
> > import re
> > from git import Git
> > import glob
> >
> > vendor_map = {
> >     'imx': 'fsl',
> >     'ls': 'fsl',
> >     'vf': 'fsl',
> >     'qcom': 'qcom',
> >     'am3' : 'ti',
> >     'am4' : 'ti',
> >     'am5' : 'ti',
> >     'da' : 'ti',
> >     'dm' : 'ti',
> >     'dra' : 'ti',
> >     'keystone' : 'ti',
> >     'omap' : 'ti',
> >     'nspire' : 'ti',
> >     'armada' : 'marvell',
> >     'berlin' : 'marvell',
> >     'dove' : 'marvell',
> >     'kirkwood' : 'marvell',
> >     'orion' : 'marvell',
> >     'pxa' : 'marvell',
> >     'mvebu' : 'marvell',
> >     'mmp2' : 'marvell',
> >     'arm-' : 'arm',
> >     'integ' : 'arm',
> >     've' : 'arm',
> >     'aspeed' : 'aspeed',
> >     'at91' : 'atmel',
> >     'sama' : 'atmel',
>
> Unfortunately, we have many boards without a proper prefix. Wouldn't it
> be better to use arch/arm/boot/dts/Makefile and map dtb-$(CONFIG_*) to a
> vendor directory?

Only 13 boards by my count Atmel. And 2 boards each for omap3 and
Renesas. That's manageable to do by hand or just add to the map.

Though in hindsight I probably would have used the config.

> This way you would be sure to not miss any. This would also ease the
> creation of subdirs if we decide to do that.
