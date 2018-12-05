From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Subject: Re: Moving ARM dts files
Date: Wed, 5 Dec 2018 06:02:39 +0000
Message-ID: <20181205135726.70badac7@xhacker.debian>
References: <20181204183649.GA5716@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181204183649.GA5716@bogus>
Content-Language: en-US
Content-ID: <0749FD24A27D70418492C967C58C578D@namprd03.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Thierry Reding <thierry.reding@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, Michal Simek <michal.simek@xilinx.com>, Krzysztof Kozlowski <krzk@kernel.org>, "arm@kernel.org" <arm@kernel.org>, Joel Stanley <joel@jms.id.au>, Andy Gross <andy.gross@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Simon Horman <horms@verge.net.au>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>, =?iso
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Tue, 4 Dec 2018 12:36:49 -0600
Rob Herring <robh@kernel.org> wrote:

> Olof, Arnd,
> 
> I've put together a script to move the dts files and update the 
> makefiles. It doesn't handle files not following a common prefix which 
> isn't many and some includes within the dts files will need some fixups 
> by hand.
> 
> MAINTAINERS will also need updating.
> 
> A few questions:
> 
> Do we want to move absolutely everything to subdirs? There's quite a 
> few platforms with only 1-2 platforms. I haven't added these to the 
> list yet, but can.
> 
> Do any vendors need another level of directories? davinci, omap, nspire, 
> etc. for TI for example.
> 
> What to do with armv7m.dtsi? I guess it should remain and we just fixup 
> the include. There may be a few other cross vendor things.
> 
> 
> Sub-arch maintainers, 
> 'vendor_map' below is the mapping of file prefix to new subdirectory 
> (the SoC vendor prefix). Please comment if there are any issues.
> 
> Rob
> 
> 8<-----------------------------------------------------------
> #!/usr/bin/env python3
> 
> import os
> import re
> from git import Git
> import glob
> 
> vendor_map = {
>     'imx': 'fsl',
>     'ls': 'fsl',
>     'vf': 'fsl',
>     'qcom': 'qcom',
>     'am3' : 'ti',
>     'am4' : 'ti',
>     'am5' : 'ti',
>     'da' : 'ti',
>     'dm' : 'ti',
>     'dra' : 'ti',
>     'keystone' : 'ti',
>     'omap' : 'ti',
>     'nspire' : 'ti',
>     'armada' : 'marvell',
>     'berlin' : 'marvell',

Now, berlin SoC is synaptics' SoC ;)

Thanks
