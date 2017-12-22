From: =?iso-8859-1?Q?T=FCrk=2C_Jan?= <Jan.Tuerk-BU0Y/NROKIiELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH v2 4/5] ARM: dts: Add support for emtrion emCON-MX6
 series
Date: Fri, 22 Dec 2017 11:34:31 +0100
Message-ID: <95F51F4B902CAC40AF459205F6322F01B7FDFECC3C@BMK019S01.emtrion.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: de-DE
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Rob Herring' <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, =?iso-8859-1?Q?Andreas_F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, SZ Lin <sz.lin-D4fb9hXD9d4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, LinuxArmKernelMailingListe <linux-arm-kern>
List-Id: devicetree@vger.kernel.org

> -----Ursprüngliche Nachricht-----
> Von: Rob Herring [mailto:robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
> Gesendet: Freitag, 22. Dezember 2017 00:19
> An: Türk, Jan
> Betreff: Re: [PATCH v2 4/5] ARM: dts: Add support for emtrion emCON-MX6
> series
> 
> On Wed, Dec 20, 2017 at 02:47:04PM +0100, jan.tuerk-BU0Y/NROKIhBDgjK7y7TUQ@public.gmane.org wrote:
> > From: Jan Tuerk <jan.tuerk-BU0Y/NROKIhBDgjK7y7TUQ@public.gmane.org>
> >
> > This patch adds support for the emtrion GmbH emCON-MX6 modules.
> > They are available with imx.6 Solo, Dual-Lite, Dual and Quad equipped
> > with Memory from 512MB to 2GB (configured by U-Boot).
> >
> > Our default developer-Kit ships with the Avari baseboard and the EDT
> > ETM0700G0BDH6 Display (imx6[q|dl]-emcon-avari).
> >
> > The devicetree is split into the common part providing all module
> > components and the basic support for all SoC versions
> > (imx6qdl-emcon.dtsi) and parts which are i.mx6 S|DL and D|Q relevant.
> > Finally the support for the avari baseboard in the developer-kit
> > configuration is provided by the emcon-avari dts files.
> >
> > Signed-off-by: Jan Tuerk <jan.tuerk-BU0Y/NROKIhBDgjK7y7TUQ@public.gmane.org>
> > ---
> > Changes in v2:
> >  - Fixed typo (reg_prallel.. --> reg_parallel)
> >  - Removed trailing new-line
> >  - Fix uppercase addresses as Rob H. noted
> >  - Fix warning about lcd@di0 -> rename to disp0
> >  - Renamed some nodes regarding Rob H.
> >
> >  Documentation/devicetree/bindings/arm/emtrion.txt |  13 +
> >  arch/arm/boot/dts/Makefile                        |   2 +
> >  arch/arm/boot/dts/imx6dl-emcon-avari.dts          | 233 ++++++
> >  arch/arm/boot/dts/imx6dl-emcon.dtsi               |  37 +
> >  arch/arm/boot/dts/imx6q-emcon-avari.dts           | 233 ++++++
> >  arch/arm/boot/dts/imx6q-emcon.dtsi                |  37 +
> >  arch/arm/boot/dts/imx6qdl-emcon.dtsi              | 848
> ++++++++++++++++++++++
> >  7 files changed, 1403 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/arm/emtrion.txt
> >  create mode 100644 arch/arm/boot/dts/imx6dl-emcon-avari.dts
> >  create mode 100644 arch/arm/boot/dts/imx6dl-emcon.dtsi
> >  create mode 100644 arch/arm/boot/dts/imx6q-emcon-avari.dts
> >  create mode 100644 arch/arm/boot/dts/imx6q-emcon.dtsi
> >  create mode 100644 arch/arm/boot/dts/imx6qdl-emcon.dtsi
> 
> [...]
> 
> > +	captouch: touchscreen@38 {
> > +		reg = <0x38>;
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_irq_touch2 &pinctrl_emcon_gpio4>;
> > +		interrupt-parent = <&gpio6>;
> > +		interrupts = <31 IRQ_TYPE_EDGE_FALLING>;
> > +		compatible = "edt,edt-ft5406";
> 
> Put compatible as the first property.
> 
> > +		wake-gpios = <&gpio2 3 GPIO_ACTIVE_HIGH>;
> > +		wakeup-source;
> > +	};
> > +};
> 
> [...]
> 
> > +&rgb_panel {
> > +	compatible = "edt,etm0700g0bdh6";
> > +	status = "okay";
> 
> Having compatible here is a bit strange and fragile. It's assuming 2 different
> panels have the same common properties.

The reason for doing it here is that the devicetree is splitted into 2 Layers (3 with imx6qdl.dtsi).
The first Layer (imx6qdl-emcon.dtsi) describes the i.mx6 Module named "emCON-MX6", with all drivers
(some are currently disabled) to provide all functionality as defined by its specification. 
For the RGB port it means that it defaults to 24 bit. However, the "panel" connects the specified
backlight pwm and the corresponding enable pin of the display. 
In the file you're mentioning here the AVARI baseboard is configured and described, which has an 
18bit EDT RGB connector. Also the display is an option and might be a different one on customer's 
hardware. 
So if custom designs based on our module/baseboard are made, they'll have just to specify the display type
actually connected and we'll save the boilerplate of drm + pm connections.

> 
> 
> > diff --git a/arch/arm/boot/dts/imx6q-emcon.dtsi b/arch/arm/boot/dts/imx6q-
> emcon.dtsi
> > new file mode 100644
> > index 000000000000..64fc0cd74c05
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/imx6q-emcon.dtsi
> > @@ -0,0 +1,37 @@
> > +/*
> > + * Copyright (C) 2017 emtrion GmbH
> > + * Author: Jan Tuerk  <jan.tuerk-BU0Y/NROKIhBDgjK7y7TUQ@public.gmane.org>
> > + *
> > + * The code contained herein is licensed under the GNU General Public
> > + * License. You may obtain a copy of the GNU General Public License
> > + * Version 2 or later at the following locations:
> > + *
> > + * http://www.opensource.org/licenses/gpl-license.html
> > + * http://www.gnu.org/copyleft/gpl.html
> 
> You don't need this if...

I've got a little different point of view on this since the OSS Europe 2017 - part of gpl2 following.

GPLv2-Para1 (=>highlighted<=) :
1. You may copy and distribute verbatim copies of the Program's source code as you receive it, in any medium,
 provided that you conspicuously and appropriately publish on each copy an 
=> appropriate copyright notice and disclaimer of warranty; <=
keep intact all the notices that refer to this License and to the absence of any warranty;
 and give any other recipients of the Program a copy of this License along with the Program.

After reviewing this I think apparently I should include the Warranty disclaimer as well.
Examples could be found  in:
arch/arm/boot/dts/imx6q-tbs2910.dts
and
arch/arm/boot/dts/imx6q-zii-rdu2.dts

> 
> > + *
> > + * SPDX-License-Identifier: GPL-2.0
> 
> You have this.
> 
> Also, the rules around this are getting a bit stricter saying the SPDX
> tag should be the first line of the file using a C++ style comment.
> 
I'll change it for v3 of this patch however it will end up like this:
//SPDX-License...
/*
 *  Copyright 
do you have an reference for that? What I've found so far was telling the format I used.

> > + *
> > + */
> > +
> > +/ {
> > +	model = "emtrion SoM emCON-MX6 Dual/Quad";
> > +	compatible = "emtrion,emcon-mx6","fsl,imx6q";
> 
> Need a space                             ^
Ok
> 
> > diff --git a/arch/arm/boot/dts/imx6qdl-emcon.dtsi
> b/arch/arm/boot/dts/imx6qdl-emcon.dtsi
> > new file mode 100644
> > index 000000000000..f87d8ed6a1b1
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/imx6qdl-emcon.dtsi
> > @@ -0,0 +1,848 @@
> > +/*
> > + * Copyright (C) 2017 emtrion GmbH
> > + * Author: Jan Tuerk  <jan.tuerk-BU0Y/NROKIhBDgjK7y7TUQ@public.gmane.org>
> > + *
> > + * The code contained herein is licensed under the GNU General Public
> > + * License. You may obtain a copy of the GNU General Public License
> > + * Version 2 or later at the following locations:
> > + *
> > + * http://www.opensource.org/licenses/gpl-license.html
> > + * http://www.gnu.org/copyleft/gpl.html
> > + *
> > + * SPDX-License-Identifier: GPL-2.0
> > + *
> > + */
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/pwm/pwm.h>
> > +#include <dt-bindings/input/input.h>
> > +
> > +/ {
> > +
> > +	model = "emtrion SoM emCON-MX6";
> > +	compatible = "emtrion,emcon-mx6","fsl,imx6q", "fsl,imx6dl";
> 
> Need a space                             ^

Ok


Regards 

Jan 

---
emtrion GmbH
Alter Schlachthof 45
76131 Karlsruhe
GERMANY
https://www.emtrion.de

Amtsgericht Mannheim
HRB 110 300
Geschäftsführer: Dieter Baur, Ramona Maurer



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
