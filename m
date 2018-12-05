From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: Moving ARM dts files
Date: Wed, 5 Dec 2018 13:18:46 +0900
Message-ID: <CAK7LNAQ-O0Xnkb3egp-B8+0hFaeBM_pzn0f0XQJ3+FLgBwNCaQ@mail.gmail.com>
References: <20181204183649.GA5716@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181204183649.GA5716@bogus>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>, Thierry Reding <thierry.reding@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@kernel.org>, gregory.clement@bootlin.com, Michal Simek <michal.simek@xilinx.com>, Krzysztof Kozlowski <krzk@kernel.org>, arm-soc <arm@kernel.org>, Joel Stanley <joel@jms.id.au>, Andy Gross <andy.gross@linaro.org>, DTML <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Simon Horman <horms@verge.net.au>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Daniel Mack <daniel@zonque.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 5, 2018 at 3:37 AM Rob Herring <robh@kernel.org> wrote:
>
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
>     'dove' : 'marvell',
>     'kirkwood' : 'marvell',
>     'orion' : 'marvell',
>     'pxa' : 'marvell',
>     'mvebu' : 'marvell',
>     'mmp2' : 'marvell',
>     'arm-' : 'arm',
>     'integ' : 'arm',
>     've' : 'arm',
>     'aspeed' : 'aspeed',
>     'at91' : 'atmel',
>     'sama' : 'atmel',
>     'bcm' : 'brcm',
>     'exynos' : 'samsung',
>     's3c' : 'samsung',
>     's5p' : 'samsung',
>     'gemini' : 'cortina',
>     'hi3' : 'hisilicon',
>     'hip' : 'hisilicon',
>     'hisi' : 'hisilicon',
>     'mt' : 'mediatek',
>     'meson' : 'amlogic',
>     'owl' : 'actions',
>     'r7' : 'renesas',
>     'r8' : 'renesas',
>     'r9' : 'renesas',
>     'rk' : 'rockchip',
>     'socfpga' : 'altera',
>     'st' : 'st',
>     'spear' : 'st',
>     'sun' : 'allwinner',
>     'tegra' : 'nvidia',
>     'zynq' : 'xilinx',
>     'wm' : 'wm',
>     'uniph' : 'socionext',


I tested this script, and
I confirmed all of my DT files were moved to the socionext subdirectory.

However, this would break arm64 build
because some of my arm64 DT files include arm32 ones.

I think it is common to share base platform boards between arm and arm64.

Of course, It will be pretty easy to fix it up by hand later, though.





>     'zx' : 'zte',
> }
>
> if __name__ == "__main__":
>     g = Git('.')
>
>     g.checkout("HEAD", "arch/arm/boot/dts/Makefile")
>     dts_make = open("arch/arm/boot/dts/Makefile", "r").read()
>
>     # make entries 1 line
>     make2 = re.sub(r'\\\n', '', dts_make)
>
>     for k,v in vendor_map.items():
>         for f in glob.iglob("arch/arm/boot/dts/" + k + "*.*"):
>             new_dir = "arch/arm/boot/dts/" + v + "/"
>             base = os.path.splitext(os.path.basename(f))[0]
>
>             os.makedirs(new_dir, exist_ok=True)
>             g.mv(f, new_dir)
>
>             # Remove the file from the makefile
>             dts_make = re.sub('.*' + base + r'\.dtb.*\\\n', '', dts_make)
>             dts_make = re.sub('.*' + base + r'\.dtb', '', dts_make)
>
>             # extract the matching makefile entry
>             reg = re.search(r'.*' + base + r'.*', make2)
>             if not reg:
>                 continue
>
>             entry = reg.group(0)
>             make2 = re.sub(r'.*' + base + r'.*', '', make2)
>             if entry:
>                 makefile = open(new_dir + 'Makefile', 'a+')
>                 print(entry, file=makefile)
>                 makefile.close()
>
>
>     for d in sorted(glob.iglob("arch/arm/boot/dts/*/")):
>         dts_make += 'subdir-y += ' + d.split(os.path.sep)[-2] + '\n'
>
>         # Add license and sort entries of sub-dir makefile
>         vendor_make = '# SPDX-License-Identifier: GPL-2.0\n'
>         make_lines = open(d + 'Makefile', 'r').readlines()
>         for l in sorted(make_lines):
>             vendor_make += l
>
>         vendor_make = re.sub(r'\t', r'\\\n\t', vendor_make)
>
>         f = open(d + 'Makefile', 'w')
>         f.write(vendor_make)
>         f.close()
>         g.add(d + 'Makefile')
>
>     # Remove entries with no dtbs left
>     dts_make = re.sub(r'.*\+= \\\n\n', '', dts_make)
>
>     open("arch/arm/boot/dts/Makefile", "w").write(dts_make)
>     g.add("arch/arm/boot/dts/Makefile")



-- 
Best Regards
Masahiro Yamada
