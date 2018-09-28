From: Li Yang <leoyang.li@nxp.com>
Subject: Re: [PATCH] arm64: dts: add LX2160AQDS board support
Date: Fri, 28 Sep 2018 14:20:58 -0500
Message-ID: <CADRPPNQ2HU5JgoSjwXEG-7n9=hAOQJO5FS2BJSWa5YWb2AGriw@mail.gmail.com>
References: <20180921141720.19159-1-pankaj.bansal@nxp.com>
 <20180928090030.GI26692@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180928090030.GI26692@dragon>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, yogeshnarayan.gaur@nxp.com, pankaj.bansal@nxp.com, Rob Herring <robh+dt@kernel.org>, vabhav.sharma@nxp.com, Sriram Dash <sriram.dash@nxp.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 28, 2018 at 4:01 AM Shawn Guo <shawnguo@kernel.org> wrote:
>
> On Fri, Sep 21, 2018 at 07:47:20PM +0530, Pankaj Bansal wrote:
> > The LX2160A QorIQ Development System (QDS) is a test, evaluation, and
> > development platform, supporting QorIQ LX2160A processor.
> >
> > Signed-off-by: Sriram Dash <sriram.dash@nxp.com>
> > Signed-off-by: Pankaj Bansal <pankaj.bansal@nxp.com>
> > ---
> >
> > Notes:
> >     This patch is dependent on [1] and [2]
> >      [1] https://lore.kernel.org/patchwork/patch/985935/
> >      [2] https://lore.kernel.org/patchwork/patch/985938/
>
> I did not receive these.

Please add the Shawn Guo and me in "to" recipients when you send next
version of these patches.  And, btw, I find there is a v3 now, but
your link is still pointing to the v2.

>
> >
> >  arch/arm64/boot/dts/freescale/Makefile       |  1 +
> >  .../boot/dts/freescale/fsl-lx2160a-qds.dts   | 88 ++++++++++++++++++
> >  2 files changed, 89 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> > index 445b72bd5a36..ae80fc5c45f7 100644
> > --- a/arch/arm64/boot/dts/freescale/Makefile
> > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > @@ -14,3 +14,4 @@ dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls2080a-simu.dtb
> >  dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls2088a-qds.dtb
> >  dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls2088a-rdb.dtb
> >  dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-rdb.dtb
> > +dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-qds.dtb
>
> Please keep them in alphabetic order.
>
> > diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts
> > new file mode 100644
> > index 000000000000..5cf2fe279f73
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts
> > @@ -0,0 +1,88 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +//
> > +// Device Tree file for LX2160AQDS
> > +//
> > +// Copyright 2018 NXP
> > +
> > +/dts-v1/;
> > +
> > +#include "fsl-lx2160a.dtsi"
> > +
> > +/ {
> > +     model = "NXP Layerscape LX2160AQDS";
> > +     compatible = "fsl,lx2160a-qds", "fsl,lx2160a";
> > +
> > +     chosen {
> > +             stdout-path = "serial0:115200n8";
> > +     };
> > +};
> > +
> > +&uart0 {
> > +     status = "okay";
> > +};
> > +
> > +&uart1 {
> > +     status = "okay";
> > +};
> > +
> > +&i2c0 {
>
> Sort these labeled nodes alphabetically, so that new additions can find
> their place easier.
>
> > +     status = "okay";
>
> Have a newline between property list and child node.
>
> Shawn
>
> > +     i2c-mux@77 {
> > +             compatible = "nxp,pca9547";
> > +             reg = <0x77>;
> > +             #address-cells = <1>;
> > +             #size-cells = <0>;
> > +
> > +             i2c@2 {
> > +                     #address-cells = <1>;
> > +                     #size-cells = <0>;
> > +                     reg = <0x2>;
> > +
> > +                     power-monitor@40 {
> > +                             compatible = "ti,ina220";
> > +                             reg = <0x40>;
> > +                             shunt-resistor = <500>;
> > +                     };
> > +
> > +                     power-monitor@41 {
> > +                             compatible = "ti,ina220";
> > +                             reg = <0x41>;
> > +                             shunt-resistor = <1000>;
> > +                     };
> > +             };
> > +
> > +             i2c@3 {
> > +                     #address-cells = <1>;
> > +                     #size-cells = <0>;
> > +                     reg = <0x3>;
> > +
> > +                     temperature-sensor@4c {
> > +                             compatible = "nxp,sa56004";
> > +                             reg = <0x4c>;
> > +                     };
> > +
> > +                     temperature-sensor@4d {
> > +                             compatible = "nxp,sa56004";
> > +                             reg = <0x4d>;
> > +                     };
> > +
> > +                     rtc@51 {
> > +                             compatible = "nxp,pcf2129";
> > +                             reg = <0x51>;
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> > +&usb0 {
> > +     status = "okay";
> > +};
> > +
> > +&usb1 {
> > +     status = "okay";
> > +};
> > +
> > +&crypto {
> > +     status = "okay";
> > +};
> > +
> > --
> > 2.17.1
> >
> >
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
