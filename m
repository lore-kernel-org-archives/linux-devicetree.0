Return-Path: <SRS0=BZkx=C4=gmail.com=mathieu.malaterre@kernel.org>
MIME-Version: 1.0
Sender: mathieu.malaterre@gmail.com
In-Reply-To: <c7200904-f016-8789-ee5e-fe5a281be215@caviumnetworks.com>
References: <20171129205515.9009-1-malat@debian.org> <c7200904-f016-8789-ee5e-fe5a281be215@caviumnetworks.com>
From: Mathieu Malaterre <malat@debian.org>
Date: Thu, 30 Nov 2017 08:52:42 +0100
Message-ID: <CA+7wUsxtKiQRWv_2w2TCqV=29mAb=sJn0G=kKQtF=2Ydedw=3A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Remove leading 0x from bindings notation
Content-Type: multipart/alternative; boundary="001a1144bceca0b46b055f2e8abb"
To: David Daney <ddaney@caviumnetworks.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Marco Franchi <marco.franchi@nxp.com>, linux-mips@linux-mips.org
List-ID: <devicetree@vger.kernel.org>

--001a1144bceca0b46b055f2e8abb
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Thu, Nov 30, 2017 at 12:21 AM, David Daney <ddaney@caviumnetworks.com>
wrote:
>
> On 11/29/2017 12:55 PM, Mathieu Malaterre wrote:
>>
>> Improve the binding example by removing all the leading 0x to fix the
>> following dtc warnings:
>>
>> Warning (unit_address_format): Node /XXX unit name should not have
leading "0x"
>
>
> How does it fix the warnings?  You are not changing the .dts files that
are compiled.

I originally only wanted to fix [...]watchdog/ingenic,jz4740-wdt.txt, but
when I lookup git log, I eventually found out about the commit I refer to
in my commit message: https://github.com/torvalds/linux/commit/48c926cd3414
and I simply followed suggestion from Rob:

https://lkml.org/lkml/2017/11/1/965

> This may also cause the binding documentation to differ from the reality
of what the actual device trees contain.

Chicken or the egg dilemma, but you understand that linux master tree still
has the original warning:

$ perl -p -i -e 's/\@0+([0-9a-f])/\@$1/g' `find ./ -type f \( -iname
\*.dtsi -o -iname \*.dts \)`
$ git diff | diffstat
[...]
 40 files changed, 160 insertions(+), 160 deletions(-)

And those are real W=1 actual warnings. Do you want me to re-submit it as
patch series instead which fix both the documentation side and the dts*
files ?

>>
>> Converted using the following command:
>>
>> find Documentation/devicetree/bindings -name "*.txt" -exec sed -i -e
's/([^ ])\@0x([0-9a-f])/$1\@$2/g' {} +
>>
>> This is a follow up to commit 48c926cd3414
>>
>> Signed-off-by: Mathieu Malaterre <malat@debian.org>
>> ---
>> I've also checked using the original perl command that I did not
introduce:
>>
>> Warning (unit_address_format): Node /XXX unit name should not have
leading 0s
>>
>>   Documentation/devicetree/bindings/arm/ccn.txt                |  2 +-
>>   Documentation/devicetree/bindings/arm/omap/crossbar.txt      |  2 +-
>>   .../devicetree/bindings/arm/tegra/nvidia,tegra20-mc.txt      |  2 +-
>>   Documentation/devicetree/bindings/clock/axi-clkgen.txt       |  2 +-
>>   .../devicetree/bindings/clock/brcm,bcm2835-aux-clock.txt     |  2 +-
>>   Documentation/devicetree/bindings/clock/exynos4-clock.txt    |  2 +-
>>   Documentation/devicetree/bindings/clock/exynos5250-clock.txt |  2 +-
>>   Documentation/devicetree/bindings/clock/exynos5410-clock.txt |  2 +-
>>   Documentation/devicetree/bindings/clock/exynos5420-clock.txt |  2 +-
>>   Documentation/devicetree/bindings/clock/exynos5440-clock.txt |  2 +-
>>   .../devicetree/bindings/clock/ti-keystone-pllctrl.txt        |  2 +-
>>   Documentation/devicetree/bindings/clock/zx296702-clk.txt     |  4 ++--
>>   Documentation/devicetree/bindings/crypto/fsl-sec4.txt        |  4 ++--
>>   .../devicetree/bindings/devfreq/event/rockchip-dfi.txt       |  2 +-
>>   Documentation/devicetree/bindings/display/atmel,lcdc.txt     |  4 ++--
>>   Documentation/devicetree/bindings/dma/qcom_hidma_mgmt.txt    |  4 ++--
>>   Documentation/devicetree/bindings/dma/zxdma.txt              |  2 +-
>>   Documentation/devicetree/bindings/gpio/gpio-altera.txt       |  2 +-
>>   Documentation/devicetree/bindings/i2c/i2c-jz4780.txt         |  2 +-
>>   Documentation/devicetree/bindings/iio/pressure/hp03.txt      |  2 +-
>>   .../devicetree/bindings/input/touchscreen/bu21013.txt        |  2 +-
>>   .../devicetree/bindings/interrupt-controller/arm,gic.txt     |  4 ++--
>>   .../bindings/interrupt-controller/img,meta-intc.txt          |  2 +-
>>   .../bindings/interrupt-controller/img,pdc-intc.txt           |  2 +-
>>   .../bindings/interrupt-controller/st,spear3xx-shirq.txt      |  2 +-
>>   Documentation/devicetree/bindings/mailbox/altera-mailbox.txt |  6
+++---
>>   .../devicetree/bindings/mailbox/brcm,iproc-pdc-mbox.txt      |  2 +-
>>   Documentation/devicetree/bindings/media/exynos5-gsc.txt      |  2 +-
>>   Documentation/devicetree/bindings/media/mediatek-vcodec.txt  |  2 +-
>>   Documentation/devicetree/bindings/media/rcar_vin.txt         |  2 +-
>>   Documentation/devicetree/bindings/media/samsung-fimc.txt     |  2 +-
>>   Documentation/devicetree/bindings/media/sh_mobile_ceu.txt    |  2 +-
>>   Documentation/devicetree/bindings/media/video-interfaces.txt | 10
+++++-----
>>   .../devicetree/bindings/memory-controllers/ti/emif.txt       |  2 +-
>>   .../devicetree/bindings/mfd/ti-keystone-devctrl.txt          |  2 +-
>>   Documentation/devicetree/bindings/misc/brcm,kona-smc.txt     |  2 +-
>>   Documentation/devicetree/bindings/mmc/brcm,kona-sdhci.txt    |  2 +-
>>   Documentation/devicetree/bindings/mmc/brcm,sdhci-iproc.txt   |  2 +-
>>   Documentation/devicetree/bindings/mmc/ti-omap-hsmmc.txt      |  4 ++--
>>   Documentation/devicetree/bindings/mtd/gpmc-nor.txt           |  6
+++---
>>   Documentation/devicetree/bindings/mtd/mtk-nand.txt           |  2 +-
>>   Documentation/devicetree/bindings/net/altera_tse.txt         |  4 ++--
>>   Documentation/devicetree/bindings/net/mdio.txt               |  2 +-
>>   Documentation/devicetree/bindings/net/socfpga-dwmac.txt      |  2 +-
>>   Documentation/devicetree/bindings/nios2/nios2.txt            |  2 +-
>>   Documentation/devicetree/bindings/pci/altera-pcie.txt        |  2 +-
>>   Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt     |  2 +-
>>   Documentation/devicetree/bindings/pci/hisilicon-pcie.txt     |  2 +-
>>   Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt      |  2 +-
>>   .../devicetree/bindings/pinctrl/brcm,cygnus-pinmux.txt       |  2 +-
>>   Documentation/devicetree/bindings/pinctrl/pinctrl-atlas7.txt |  4 ++--
>>   Documentation/devicetree/bindings/pinctrl/pinctrl-sirf.txt   |  2 +-
>>   .../devicetree/bindings/pinctrl/rockchip,pinctrl.txt         |  4 ++--
>>   Documentation/devicetree/bindings/regulator/regulator.txt    |  2 +-
>>   Documentation/devicetree/bindings/serial/efm32-uart.txt      |  2 +-
>>   .../devicetree/bindings/serio/allwinner,sun4i-ps2.txt        |  2 +-
>>   .../devicetree/bindings/soc/ti/keystone-navigator-qmss.txt   |  2 +-
>>   Documentation/devicetree/bindings/sound/adi,axi-i2s.txt      |  2 +-
>>   Documentation/devicetree/bindings/sound/adi,axi-spdif-tx.txt |  2 +-
>>   Documentation/devicetree/bindings/sound/ak4613.txt           |  2 +-
>>   Documentation/devicetree/bindings/sound/ak4642.txt           |  2 +-
>>   Documentation/devicetree/bindings/sound/max98371.txt         |  2 +-
>>   Documentation/devicetree/bindings/sound/max9867.txt          |  2 +-
>>   Documentation/devicetree/bindings/sound/renesas,fsi.txt      |  2 +-
>>   Documentation/devicetree/bindings/sound/rockchip-spdif.txt   |  2 +-
>>   Documentation/devicetree/bindings/sound/st,sti-asoc-card.txt |  8
++++----
>>   Documentation/devicetree/bindings/spi/efm32-spi.txt          |  2 +-
>>   Documentation/devicetree/bindings/thermal/thermal.txt        | 12
++++++------
>>   Documentation/devicetree/bindings/ufs/ufs-qcom.txt           |  4 ++--
>>   Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt      |  2 +-
>>   Documentation/devicetree/bindings/usb/ehci-st.txt            |  2 +-
>>   Documentation/devicetree/bindings/usb/ohci-st.txt            |  2 +-
>>   .../devicetree/bindings/watchdog/ingenic,jz4740-wdt.txt      |  2 +-
>>   73 files changed, 99 insertions(+), 99 deletions(-)
>>

--001a1144bceca0b46b055f2e8abb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi David,<br><br>On Thu, Nov 30, 2017 at 12:21 AM, David D=
aney &lt;<a href=3D"mailto:ddaney@caviumnetworks.com">ddaney@caviumnetworks=
.com</a>&gt; wrote:<br>&gt;<br>&gt; On 11/29/2017 12:55 PM, Mathieu Malater=
re wrote:<br>&gt;&gt;<br>&gt;&gt; Improve the binding example by removing a=
ll the leading 0x to fix the<br>&gt;&gt; following dtc warnings:<br>&gt;&gt=
;<br>&gt;&gt; Warning (unit_address_format): Node /XXX unit name should not=
 have leading &quot;0x&quot;<br>&gt;<br>&gt;<br>&gt; How does it fix the wa=
rnings?=C2=A0 You are not changing the .dts files that are compiled.<br><br=
>I originally only wanted to fix [...]watchdog/ingenic,jz4740-wdt.txt, but =
when I lookup git log, I eventually found out about the commit I refer to i=
n my commit message: <a href=3D"https://github.com/torvalds/linux/commit/48=
c926cd3414">https://github.com/torvalds/linux/commit/48c926cd3414</a><br>an=
d I simply followed suggestion from Rob:<br><br><a href=3D"https://lkml.org=
/lkml/2017/11/1/965">https://lkml.org/lkml/2017/11/1/965</a><br><br>&gt; Th=
is may also cause the binding documentation to differ from the reality of w=
hat the actual device trees contain.<br><br>Chicken or the egg dilemma, but=
 you understand that linux master tree still has the original warning:<div>=
<br></div><div><div>$ perl -p -i -e &#39;s/\@0+([0-9a-f])/\@$1/g&#39; `find=
 ./ -type f \( -iname \*.dtsi -o -iname \*.dts \)`</div></div><div>$ git di=
ff | diffstat<br></div><div>[...]</div><div><div>=C2=A040 files changed, 16=
0 insertions(+), 160 deletions(-)</div></div><div><br></div><div>And those =
are real W=3D1 actual warnings. Do you want me to re-submit it as patch ser=
ies instead which fix both the documentation side and the dts* files ?</div=
><div><br></div><div>&gt;&gt;<br>&gt;&gt; Converted using the following com=
mand:<br>&gt;&gt;<br>&gt;&gt; find Documentation/devicetree/bindings -name =
&quot;*.txt&quot; -exec sed -i -e &#39;s/([^ ])\@0x([0-9a-f])/$1\@$2/g&#39;=
 {} +<br>&gt;&gt;<br>&gt;&gt; This is a follow up to commit 48c926cd3414<br=
>&gt;&gt;<br>&gt;&gt; Signed-off-by: Mathieu Malaterre &lt;<a href=3D"mailt=
o:malat@debian.org">malat@debian.org</a>&gt;<br>&gt;&gt; ---<br>&gt;&gt; I&=
#39;ve also checked using the original perl command that I did not introduc=
e:<br>&gt;&gt;<br>&gt;&gt; Warning (unit_address_format): Node /XXX unit na=
me should not have leading 0s<br>&gt;&gt;<br>&gt;&gt; =C2=A0 Documentation/=
devicetree/bindings/arm/ccn.txt =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| =C2=A02 +-<br>&gt;&gt; =C2=A0 Documentation/devicetree/bindi=
ngs/arm/omap/crossbar.txt =C2=A0 =C2=A0 =C2=A0| =C2=A02 +-<br>&gt;&gt; =C2=
=A0 .../devicetree/bindings/arm/tegra/nvidia,tegra20-mc.txt =C2=A0 =C2=A0 =
=C2=A0| =C2=A02 +-<br>&gt;&gt; =C2=A0 Documentation/devicetree/bindings/clo=
ck/axi-clkgen.txt =C2=A0 =C2=A0 =C2=A0 | =C2=A02 +-<br>&gt;&gt; =C2=A0 .../=
devicetree/bindings/clock/brcm,bcm2835-aux-clock.txt =C2=A0 =C2=A0 | =C2=A0=
2 +-<br>&gt;&gt; =C2=A0 Documentation/devicetree/bindings/clock/exynos4-clo=
ck.txt =C2=A0 =C2=A0| =C2=A02 +-<br>&gt;&gt; =C2=A0 Documentation/devicetre=
e/bindings/clock/exynos5250-clock.txt | =C2=A02 +-<br>&gt;&gt; =C2=A0 Docum=
entation/devicetree/bindings/clock/exynos5410-clock.txt | =C2=A02 +-<br>&gt=
;&gt; =C2=A0 Documentation/devicetree/bindings/clock/exynos5420-clock.txt |=
 =C2=A02 +-<br>&gt;&gt; =C2=A0 Documentation/devicetree/bindings/clock/exyn=
os5440-clock.txt | =C2=A02 +-<br>&gt;&gt; =C2=A0 .../devicetree/bindings/cl=
ock/ti-keystone-pllctrl.txt =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A02 +-<br>&gt;=
&gt; =C2=A0 Documentation/devicetree/bindings/clock/zx296702-clk.txt =C2=A0=
 =C2=A0 | =C2=A04 ++--<br>&gt;&gt; =C2=A0 Documentation/devicetree/bindings=
/crypto/fsl-sec4.txt =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A04 ++--<br>&gt;&gt; =
=C2=A0 .../devicetree/bindings/devfreq/event/rockchip-dfi.txt =C2=A0 =C2=A0=
 =C2=A0 | =C2=A02 +-<br>&gt;&gt; =C2=A0 Documentation/devicetree/bindings/d=
isplay/atmel,lcdc.txt =C2=A0 =C2=A0 | =C2=A04 ++--<br>&gt;&gt; =C2=A0 Docum=
entation/devicetree/bindings/dma/qcom_hidma_mgmt.txt =C2=A0 =C2=A0| =C2=A04=
 ++--<br>&gt;&gt; =C2=A0 Documentation/devicetree/bindings/dma/zxdma.txt =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A02 +-<br>&gt;&gt; =
=C2=A0 Documentation/devicetree/bindings/gpio/gpio-altera.txt =C2=A0 =C2=A0=
 =C2=A0 | =C2=A02 +-<br>&gt;&gt; =C2=A0 Documentation/devicetree/bindings/i=
2c/i2c-jz4780.txt =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A02 +-<br>&gt;&gt; =C2=
=A0 Documentation/devicetree/bindings/iio/pressure/hp03.txt =C2=A0 =C2=A0 =
=C2=A0| =C2=A02 +-<br>&gt;&gt; =C2=A0 .../devicetree/bindings/input/touchsc=
reen/bu21013.txt =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A02 +-<br>&gt;&gt; =C2=A0=
 .../devicetree/bindings/interrupt-controller/arm,gic.txt =C2=A0 =C2=A0 | =
=C2=A04 ++--<br>&gt;&gt; =C2=A0 .../bindings/interrupt-controller/img,meta-=
intc.txt =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A02 +-<br>&gt;&gt; =C2=A0 =
.../bindings/interrupt-controller/img,pdc-intc.txt =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A02 +-<br>&gt;&gt; =C2=A0 .../bindings/interrupt-controlle=
r/st,spear3xx-shirq.txt =C2=A0 =C2=A0 =C2=A0| =C2=A02 +-<br>&gt;&gt; =C2=A0=
 Documentation/devicetree/bindings/mailbox/altera-mailbox.txt | =C2=A06 +++=
---<br>&gt;&gt; =C2=A0 .../devicetree/bindings/mailbox/brcm,iproc-pdc-mbox.=
txt =C2=A0 =C2=A0 =C2=A0| =C2=A02 +-<br>&gt;&gt; =C2=A0 Documentation/devic=
etree/bindings/media/exynos5-gsc.txt =C2=A0 =C2=A0 =C2=A0| =C2=A02 +-<br>&g=
t;&gt; =C2=A0 Documentation/devicetree/bindings/media/mediatek-vcodec.txt =
=C2=A0| =C2=A02 +-<br>&gt;&gt; =C2=A0 Documentation/devicetree/bindings/med=
ia/rcar_vin.txt =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A02 +-<br>&gt;&gt; =C2=A0=
 Documentation/devicetree/bindings/media/samsung-fimc.txt =C2=A0 =C2=A0 | =
=C2=A02 +-<br>&gt;&gt; =C2=A0 Documentation/devicetree/bindings/media/sh_mo=
bile_ceu.txt =C2=A0 =C2=A0| =C2=A02 +-<br>&gt;&gt; =C2=A0 Documentation/dev=
icetree/bindings/media/video-interfaces.txt | 10 +++++-----<br>&gt;&gt; =C2=
=A0 .../devicetree/bindings/memory-controllers/ti/emif.txt =C2=A0 =C2=A0 =
=C2=A0 | =C2=A02 +-<br>&gt;&gt; =C2=A0 .../devicetree/bindings/mfd/ti-keyst=
one-devctrl.txt =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A02 +-<br>&gt;&gt; =
=C2=A0 Documentation/devicetree/bindings/misc/brcm,kona-smc.txt =C2=A0 =C2=
=A0 | =C2=A02 +-<br>&gt;&gt; =C2=A0 Documentation/devicetree/bindings/mmc/b=
rcm,kona-sdhci.txt =C2=A0 =C2=A0| =C2=A02 +-<br>&gt;&gt; =C2=A0 Documentati=
on/devicetree/bindings/mmc/brcm,sdhci-iproc.txt =C2=A0 | =C2=A02 +-<br>&gt;=
&gt; =C2=A0 Documentation/devicetree/bindings/mmc/ti-omap-hsmmc.txt =C2=A0 =
=C2=A0 =C2=A0| =C2=A04 ++--<br>&gt;&gt; =C2=A0 Documentation/devicetree/bin=
dings/mtd/gpmc-nor.txt =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A06 +++---<=
br>&gt;&gt; =C2=A0 Documentation/devicetree/bindings/mtd/mtk-nand.txt =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A02 +-<br>&gt;&gt; =C2=A0 Documentati=
on/devicetree/bindings/net/altera_tse.txt =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=
=A04 ++--<br>&gt;&gt; =C2=A0 Documentation/devicetree/bindings/net/mdio.txt=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A02 +-<br>&gt;&gt; =
=C2=A0 Documentation/devicetree/bindings/net/socfpga-dwmac.txt =C2=A0 =C2=
=A0 =C2=A0| =C2=A02 +-<br>&gt;&gt; =C2=A0 Documentation/devicetree/bindings=
/nios2/nios2.txt =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A02 +-<br>&=
gt;&gt; =C2=A0 Documentation/devicetree/bindings/pci/altera-pcie.txt =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| =C2=A02 +-<br>&gt;&gt; =C2=A0 Documentation/devicetr=
ee/bindings/pci/fsl,imx6q-pcie.txt =C2=A0 =C2=A0 | =C2=A02 +-<br>&gt;&gt; =
=C2=A0 Documentation/devicetree/bindings/pci/hisilicon-pcie.txt =C2=A0 =C2=
=A0 | =C2=A02 +-<br>&gt;&gt; =C2=A0 Documentation/devicetree/bindings/phy/s=
un4i-usb-phy.txt =C2=A0 =C2=A0 =C2=A0| =C2=A02 +-<br>&gt;&gt; =C2=A0 .../de=
vicetree/bindings/pinctrl/brcm,cygnus-pinmux.txt =C2=A0 =C2=A0 =C2=A0 | =C2=
=A02 +-<br>&gt;&gt; =C2=A0 Documentation/devicetree/bindings/pinctrl/pinctr=
l-atlas7.txt | =C2=A04 ++--<br>&gt;&gt; =C2=A0 Documentation/devicetree/bin=
dings/pinctrl/pinctrl-sirf.txt =C2=A0 | =C2=A02 +-<br>&gt;&gt; =C2=A0 .../d=
evicetree/bindings/pinctrl/rockchip,pinctrl.txt =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | =C2=A04 ++--<br>&gt;&gt; =C2=A0 Documentation/devicetree/bindings/regula=
tor/regulator.txt =C2=A0 =C2=A0| =C2=A02 +-<br>&gt;&gt; =C2=A0 Documentatio=
n/devicetree/bindings/serial/efm32-uart.txt =C2=A0 =C2=A0 =C2=A0| =C2=A02 +=
-<br>&gt;&gt; =C2=A0 .../devicetree/bindings/serio/allwinner,sun4i-ps2.txt =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A02 +-<br>&gt;&gt; =C2=A0 .../devicetree/b=
indings/soc/ti/keystone-navigator-qmss.txt =C2=A0 | =C2=A02 +-<br>&gt;&gt; =
=C2=A0 Documentation/devicetree/bindings/sound/adi,axi-i2s.txt =C2=A0 =C2=
=A0 =C2=A0| =C2=A02 +-<br>&gt;&gt; =C2=A0 Documentation/devicetree/bindings=
/sound/adi,axi-spdif-tx.txt | =C2=A02 +-<br>&gt;&gt; =C2=A0 Documentation/d=
evicetree/bindings/sound/ak4613.txt =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
=C2=A02 +-<br>&gt;&gt; =C2=A0 Documentation/devicetree/bindings/sound/ak464=
2.txt =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A02 +-<br>&gt;&gt; =C2=A0 Do=
cumentation/devicetree/bindings/sound/max98371.txt =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A02 +-<br>&gt;&gt; =C2=A0 Documentation/devicetree/bindings/sound=
/max9867.txt =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A02 +-<br>&gt;&gt; =C2=
=A0 Documentation/devicetree/bindings/sound/renesas,fsi.txt =C2=A0 =C2=A0 =
=C2=A0| =C2=A02 +-<br>&gt;&gt; =C2=A0 Documentation/devicetree/bindings/sou=
nd/rockchip-spdif.txt =C2=A0 | =C2=A02 +-<br>&gt;&gt; =C2=A0 Documentation/=
devicetree/bindings/sound/st,sti-asoc-card.txt | =C2=A08 ++++----<br>&gt;&g=
t; =C2=A0 Documentation/devicetree/bindings/spi/efm32-spi.txt =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| =C2=A02 +-<br>&gt;&gt; =C2=A0 Documentation/devicetr=
ee/bindings/thermal/thermal.txt =C2=A0 =C2=A0 =C2=A0 =C2=A0| 12 ++++++-----=
-<br>&gt;&gt; =C2=A0 Documentation/devicetree/bindings/ufs/ufs-qcom.txt =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A04 ++--<br>&gt;&gt; =C2=A0 Documenta=
tion/devicetree/bindings/ufs/ufshcd-pltfrm.txt =C2=A0 =C2=A0 =C2=A0| =C2=A0=
2 +-<br>&gt;&gt; =C2=A0 Documentation/devicetree/bindings/usb/ehci-st.txt =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A02 +-<br>&gt;&gt; =C2=A0 Do=
cumentation/devicetree/bindings/usb/ohci-st.txt =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A02 +-<br>&gt;&gt; =C2=A0 .../devicetree/bindings/watch=
dog/ingenic,jz4740-wdt.txt =C2=A0 =C2=A0 =C2=A0| =C2=A02 +-<br>&gt;&gt; =C2=
=A0 73 files changed, 99 insertions(+), 99 deletions(-)<br>&gt;&gt;</div></=
div>

--001a1144bceca0b46b055f2e8abb--
