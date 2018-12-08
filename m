From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: Moving ARM dts files
Date: Sat, 8 Dec 2018 10:25:03 +0100
Message-ID: <CAJKOXPcUsQYuet3guXaujhG_HSsW56tg6zmE8SaqXi9DjtA0AA@mail.gmail.com>
References: <20181204183649.GA5716@bogus>
 <CAL_JsqKK4F7QX=B-CcQkMsgN--r3xv6PS4JabzOb4kqfATwtsQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL_JsqKK4F7QX=B-CcQkMsgN--r3xv6PS4JabzOb4kqfATwtsQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh@kernel.org
Cc: andrew@lunn.ch, alexandre.belloni@bootlin.com, tony@atomide.com, linus.walleij@linaro.org, liviu.dudau@arm.com, yamada.masahiro@socionext.com, thierry.reding@gmail.com, f.fainelli@gmail.com, khilman@kernel.org, gregory.clement@bootlin.com, michal.simek@xilinx.com, arm@kernel.org, joel@jms.id.au, andy.gross@linaro.org, devicetree@vger.kernel.org, jason@lakedaemon.net, horms@verge.net.au, linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com, shawnguo@kernel.org, afaerber@suse.de, daniel@zonque.org
List-Id: devicetree@vger.kernel.org

On Fri, 7 Dec 2018 at 23:33, Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Dec 4, 2018 at 12:36 PM Rob Herring <robh@kernel.org> wrote:
> >
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
>
> Here's an updated mapping filled out with the rest of the platforms
> and using SoC family names in some cases as discussed. The move is
> completely scripted now including include fixups (though any new
> includes could break things). So mainly just need to bikeshed the
> directory mapping. Not sure if marvell should be split up more or not.
> I split out pxa2xx and pxa3xx, but then there's other pxa chips I
> think aren't really related. TI is still all one directory except
> nspire. I was going to split out davinci too, but it's only a couple
> of files. Sub-arch maintainers need to chime in with what they want.
>
> A branch is here including a fix to dtbs_install:
> git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git arm-dts-move
>
> vendor_map = {
>     'alphascale' : 'alphascale',
>     'alpine' : 'alpine',
>     'artpec' : 'axis',
>     'atlas' : 'sirf',
>     'prima' : 'sirf',
>     'axm' : 'lsi',
>     'cx9' : 'cnxt',
>     'ecx' : 'calxeda',
>     'highbank' : 'calxeda',
>     'efm' : 'efm32',
>     'ep7' : 'cirrus',
>     'mxs': 'mxs',
>     'imx23': 'mxs',
>     'imx28': 'mxs',
>     'imx': 'imx',
>     'ls': 'fsl',
>     'vf': 'fsl',
>     'qcom': 'qcom',
>     'am3' : 'ti',
>     'am4' : 'ti',
>     'am5' : 'ti',
>     'dra' : 'ti',
>     'keystone' : 'ti',
>     'omap' : 'ti',
>     'compulab' : 'ti',
>     'logicpd' : 'ti',
>     'elpida' : 'ti',
>     'motorola-cpcap' : 'ti',
>     'twl' : 'ti',
>     'da' : 'ti',
>     'dm' : 'ti',
>     'nspire' : 'nspire',
>     'armada' : 'marvell',
>     'dove' : 'marvell',
>     'kirkwood' : 'marvell',
>     'orion' : 'marvell',
>     'mvebu' : 'marvell',
>     'mmp2' : 'marvell',
>     'berlin' : 'berlin',
>     'pxa2' : 'pxa',
>     'pxa3' : 'pxa',
>     'pxa' : 'marvell',
>     'arm-' : 'arm',
>     'integ' : 'arm',
>     'mps' : 'arm',
>     've' : 'arm',
>     'aspeed' : 'aspeed',
>     'at91' : 'at91',
>     'sama' : 'at91',
>     'usb_' : 'at91',
>     'tny_' : 'at91',
>     'mpa1600' : 'at91',
>     'animeo_ip' : 'at91',
>     'aks-cdu' : 'at91',
>     'ethernut5' : 'at91',
>     'evk-pro3' : 'at91',
>     'pm9g45' : 'at91',
>     'ge86' : 'at91',
>     'bcm' : 'brcm',
>     'exynos' : 'exynos',
>     's3c' : 'samsung',
>     's5p' : 'samsung',

Since Exynos is Samsung, I would prefer consistency here so let's put
everything under vendor - samsung. I understand that It will be
different than arm64 but that's the problem of choosing non-vendor
name for arm64 at first place. So let's go with:
     'exynos' : 'samsung',
     's3c' : 'samsung',
     's5p' : 'samsung',

Best regards,
Krzysztof

>     'gemini' : 'gemini',
>     'hi3' : 'hisilicon',
>     'hip' : 'hisilicon',
>     'hisi' : 'hisilicon',
>     'mt' : 'mediatek',
>     'meson' : 'meson',
>     'moxa' : 'moxa',
>     'nuvo' : 'nuvoton',
>     'lpc' : 'lpc',
>     'owl' : 'actions',
>     'ox8' : 'oxsemi',
>     'picox' : 'picoxcell',
>     'r7' : 'renesas',
>     'r8' : 'renesas',
>     'r9' : 'renesas',
>     'emev2' : 'renesas',
>     'sh73a' : 'renesas',
>     'gr-' : 'renesas',
>     'iwg' : 'renesas',
>     'rk' : 'rockchip',
>     'rv11' : 'rockchip',
>     'socfpga' : 'socfpga',
>     'stm' : 'stm32',
>     'sti' : 'sti',
>     'st-pin' : 'sti',
>     'ste' : 'st-ericsson',
>     'spear' : 'spear',
>     'sun' : 'allwinner',
>     'axp' : 'allwinner',
>     'tango' : 'sigma',
>     'tegra' : 'nvidia',
>     'uniph' : 'socionext',
>     'vt8500' : 'vt8500',
>     'wm8' : 'vt8500',
>     'xen' : 'xen',
>     'zx' : 'zte',
>     'zynq' : 'xilinx',
> }
