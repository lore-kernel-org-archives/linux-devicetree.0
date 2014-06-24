Return-Path: <vpalatin@google.com>
MIME-Version: 1.0
Sender: vpalatin@google.com
In-Reply-To: <CAD=FV=W96QpDhh1NSaVwrXYjL6Jr-v4sq1-eRSfT=tErw_KCOQ@mail.gmail.com>
References: <1403486483-4063-1-git-send-email-afaerber@suse.de>
 <1403486483-4063-5-git-send-email-afaerber@suse.de> <CAD=FV=WHAqASC+bp8mGVnhfr79F5LapJCTLtSfgUG8XuRUSCqw@mail.gmail.com>
 <53A8AE4C.6080702@suse.de> <CAD=FV=W96QpDhh1NSaVwrXYjL6Jr-v4sq1-eRSfT=tErw_KCOQ@mail.gmail.com>
From: Vincent Palatin <vpalatin@chromium.org>
Date: Tue, 24 Jun 2014 08:03:06 -0700
Message-ID: <CAP_ceTwjREwYR_Pg2n2e5_iRuXv8+J2YKtff3w0heQuebAPfQw@mail.gmail.com>
Subject: Re: [RFC 4/4] ARM: dts: exynos5250: Add Spring device tree
Content-Type: multipart/alternative; boundary=047d7b3a93e00f5b5804fc964344
To: Doug Anderson <dianders@chromium.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Stephan van Schaik <stephan@synkhronix.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, "OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, ARM PORT <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, Olof Johansson <olof@lixom.net>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Todd Broch <tbroch@chromium.org>, Tomasz Figa <t.figa@samsung.com>, Julius Werner <jwerner@chromium.org>
List-ID: <devicetree@vger.kernel.org>

--047d7b3a93e00f5b5804fc964344
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2014 at 9:05 PM, Doug Anderson <dianders@chromium.org>
wrote:

> Andreas,
>
> On Mon, Jun 23, 2014 at 3:46 PM, Andreas F=C3=A4rber <afaerber@suse.de> w=
rote:
> > Hi Doug,
> >
> > Am 23.06.2014 21:47, schrieb Doug Anderson:
> >> Thanks for posting!  A first pass on this is below...
> >
> > Thanks a lot for your quick review! My first big .dts patch, and no
> > datasheets for the hardware at hand as a user.
> >
> > A first pass of replies to my defense. ;)
> >
> >> On Sun, Jun 22, 2014 at 6:21 PM, Andreas F=C3=A4rber <afaerber@suse.de=
>
> wrote:
> > [...]
> >>> diff --git a/arch/arm/boot/dts/exynos5250-spring.dts
> b/arch/arm/boot/dts/exynos5250-spring.dts
> >>> new file mode 100644
> >>> index 0000000..e857d44
> >>> --- /dev/null
> >>> +++ b/arch/arm/boot/dts/exynos5250-spring.dts
> >>> @@ -0,0 +1,556 @@
> >>> +/*
> >>> + * Google Spring board device tree source
> >>> + *
> >>> + * Copyright (c) 2013 Google, Inc
> >>> + * Copyright (c) 2014 SUSE LINUX Products GmbH
> >>> + *
> >>> + * This program is free software; you can redistribute it and/or
> modify
> >>> + * it under the terms of the GNU General Public License version 2 as
> >>> + * published by the Free Software Foundation.
> >>> + */
> >>> +
> >>> +/dts-v1/;
> >>> +#include "exynos5250.dtsi"
> >>> +#include "exynos5250-cros-common.dtsi"
> >>
> >> It is possible we may want to backpedal on the use of
> >> "exynos5250-cros-common.dtsi".  I know that Olof (now CCed) said he
> >> wasn't a fan of how it turned out.
> >>
> >> The original idea was that it should include the arbitrary set of
> >> things that are common between a chunk of Chrome OS boards.  As more
> >> boards were introduced things would need to migrate from the "common"
> >> file to the board files.
> >>
> >> At the moment the current conventional wisdom is that some duplication
> >> is better than the confusing movement of everything back and forth.
> >> See exynos5420-peach-pit and exynos5800-peach-pi in ToT linux-next.
> >>
> >>
> >>> +/ {
> >>> +       model =3D "Google Spring";
> >>> +       compatible =3D "google,spring", "samsung,exynos5250",
> "samsung,exynos5";
> >>> +
> >>> +       pinctrl@11400000 {
> >>
> >> The new best way to do things is to put this down at the bottom.  See
> >> exynos5420-peach-pit as an example:
> >>
> >> &pinctrl_0 {
> >>   ...
> >> }
> >>
> >> Note that I believe it was decided that top-level references like that
> >> should be sorted alphabetically.
> >
> > Thanks for the hint. (My chosen sort order here was by address.)
> >
> >> If you wanted to apply that run to exynos5250-snow I don't think it
> >> would be a terrible idea.
> >
> > I can of course apply changes to Snow, but I cannot test them myself.
>
> If you want to send up a patch like that I'm happy to give it a once
> over and also to test it.  ...but don't feel obligated
>
>
> >>> +               s5m8767_dvs: s5m8767-dvs {
> >>> +                       samsung,pins =3D "gpd1-0", "gpd1-1", "gpd1-2"=
;
> >>> +                       samsung,pin-function =3D <0>;
> >>> +                       samsung,pin-pud =3D <1>;
> >>> +                       samsung,pin-drv =3D <0>;
> >>> +               };
> >>> +
> >>> +               s5m8767_ds: s5m8767-ds {
> >>> +                       samsung,pins =3D "gpx2-3", "gpx2-4", "gpx2-5"=
;
> >>> +                       samsung,pin-function =3D <0>;
> >>> +                       samsung,pin-pud =3D <1>;
> >>> +                       samsung,pin-drv =3D <0>;
> >>> +               };
> >>> +
> >>> +               tps65090_irq: tps65090-irq {
> >>> +                       samsung,pins =3D "gpx2-6";
> >>> +                       samsung,pin-function =3D <0>;
> >>> +                       samsung,pin-pud =3D <0>;
> >>> +                       samsung,pin-drv =3D <0>;
> >>> +               };
> >>> +
> >>> +               s5m8767_irq: s5m8767-irq {
> >>> +                       samsung,pins =3D "gpx3-2";
> >>> +                       samsung,pin-function =3D <0>;
> >>> +                       samsung,pin-pud =3D <0>;
> >>> +                       samsung,pin-drv =3D <0>;
> >>> +               };
> >>> +
> >>> +               hdmi_hpd_irq: hdmi-hpd-irq {
> >>> +                       samsung,pins =3D "gpx3-7";
> >>> +                       samsung,pin-function =3D <0>;
> >>> +                       samsung,pin-pud =3D <1>;
> >>> +                       samsung,pin-drv =3D <0>;
> >>> +               };
> >>> +       };
> >>> +
> >>> +       pinctrl@13400000 {
> >>> +               hsic_reset: hsic-reset {
> >>> +                       samsung,pins =3D "gpe1-0";
> >>> +                       samsung,pin-function =3D <1>;
> >>> +                       samsung,pin-pud =3D <0>;
> >>> +                       samsung,pin-drv =3D <0>;
> >>> +               };
> >>
> >> I'm pretty sure that the HSIC reset needed some funky code to make it
> >> work and I'm not sure what the status of that is upstream
> >
> > Yeah, you mentioned something along those lines. However it's the
> > equivalent of the usb3-vbus-en in -snow.dts. Rename or drop?
>

It's clearly not equivalent, usb3-vbus-en just turns on/off the load switch
for VBUS
while the HSIC chip (USB3503) is an external PHY (and hub) for the USB2
port, the reset of the PHY side of the HSIC needs to be done within the
proper timing window compared to the SoC HSIC controller to get a working
link.
As the current kernel has a binding for the SMSC USB3503 and a PHY driver
(which is in driver/usb/misc probably because it is an external PHY), the
hsic-reset should be connected there (as "reset-gpios").

On top of that the HSIC link is a bit finicky and it needs a few quirks if
we want it to survive all kind of events :
eg  s5p_hub_control() in
https://chromium.googlesource.com/chromiumos/third_party/kernel/+/chromeos-=
3.8/drivers/usb/host/ehci-s5p.c


>
> On snow locally I see USB2 vbus is gpx1-1 and USB3 vbus is gpx2-7.  I
> don't see that in spring.
>

On Spring, the USB3 root hub is just connected to the internal camera
(which is powered by one of the TPS65090 LDOs)
On the external USB2 ports, the port enable going to the VBUS load switch
is controlled directly the USB3503 (which has an internal mechanism,
configured by default as an automatic control of overcurrent protection, it
can be bypass by using the USB3503 I2C registers).



>
> This will take more time than I have right now to track down.  I added
> Julius to the thread in case he has time to answer and can suggest
> what to do for upstream purposes.  I may be able to look more
> tomorrow.
>
> You can always send up the next version and include this and we'll
> look at it again.
>
>
> >>> +       };
> >>> +
> >>> +       vbat: vbat-fixed-regulator {
> >>> +               compatible =3D "regulator-fixed";
> >>> +               regulator-name =3D "vbat-supply";
> >>> +               regulator-boot-on;
> >>> +       };
> >>> +
> >>> +       usb@12000000 {
> >>> +               status =3D "okay";
> >>> +       };
> >>> +
> >>> +       usb3_vbus_reg: regulator-usb3 {
> >>> +               compatible =3D "regulator-fixed";
> >>> +               regulator-name =3D "P5.0V_USB3CON";
> >>> +               regulator-min-microvolt =3D <5000000>;
> >>> +               regulator-max-microvolt =3D <5000000>;
> >>> +               gpio =3D <&gpe1 0 1>;
> >>> +               pinctrl-names =3D "default";
> >>> +               pinctrl-0 =3D <&hsic_reset>;
> >>> +               enable-active-high;
> >>> +       };
> >>> +
> >>> +       phy@12100000 {
> >>> +               vbus-supply =3D <&usb3_vbus_reg>;
> >>> +       };
> >>> +
> >>> +       usb@12110000 {
> >>> +               samsung,vbus-gpio =3D <&gpx1 1 0>;
> >>> +               status =3D "okay";
> >>> +       };
> >>> +
> >>> +       usb@12120000 {
> >>> +               status =3D "okay";
> >>> +       };
> >>> +
> >>> +       mmc@12220000 {
> >>> +               /* MMC2 pins are used as GPIO for eDP bridge control.
> */
> >>> +               status =3D "disabled";
> >>> +       };
> >>> +
> >>> +       mmc@12230000 {
> >>> +               status =3D "disabled";
> >>> +       };
> >>> +
> >>> +       i2c@12C60000 {
> >>> +               max77686@09 {
> >>
> >> There is no max77686 on spring.  It uses s5m8767 in the place of
> max77686.
> >>
> >> ...you've got "status =3D disabled", just remove it.
> >
> > That's because it's inherited from exynos5250-cros-common.dtsi.
>
> Ah, right.  So if we're keeping cros-common the proper thing to do is
> to move it out of cros-common in a patch before this one.  ...but I
> think people might be happier if you simply don't include cros-common.
>
>
> > The rtc that the system successfully uses is "s5m-rtc", which I guess i=
s
> > on the s5m8767 then? (Confusing that 3.8 Spring had this rtc node
> > despite Snow's max77686 not having it.)
>
> I think it's not really supposed to.  It was a bit of a hack to handle
> the fact that the RTC has two different i2c addresses on both the
> 77686 and this PMIC.  The max77686 driver upstream handles it all in
> code and doesn't ask the device tree to list both addresses.
>
> I think that _upstream_ snow doesn't have the node but _downstream_
> spring might have the node (though having a child of a disabled node
> isn't particularly useful).
>
>
> >>> +                       #address-cells =3D <1>;
> >>> +                       #size-cells =3D <0>;
> >>> +                       status =3D "disabled";
> >>> +
> >>> +                       rtc {
> >>> +                               reg =3D <0x6>;
> >>> +                       };
> >>> +               };
> >>> +
> >>> +               s5m8767_pmic@66 {
> >>> +                       compatible =3D "samsung,s5m8767-pmic";
> >>> +                       reg =3D <0x66>;
> >>> +                       interrupt-parent =3D <&gpx3>;
> >>> +                       interrupts =3D <2 0>;
> >>> +                       pinctrl-names =3D "default";
> >>> +                       pinctrl-0 =3D <&s5m8767_irq &s5m8767_dvs
> &s5m8767_ds>;
> >>> +                       wakeup-source;
> >>> +
> >>> +                       s5m8767,pmic-buck-dvs-gpios =3D <&gpd1 0 1>, =
/*
> DVS1 */
> >>> +                                                     <&gpd1 1 1>, /*
> DVS2 */
> >>> +                                                     <&gpd1 2 1>; /*
> DVS3 */
> >>> +
> >>> +                       s5m8767,pmic-buck-ds-gpios =3D <&gpx2 3 1>, /=
*
> SET1 */
> >>> +                                                    <&gpx2 4 1>, /*
> SET2 */
> >>> +                                                    <&gpx2 5 1>; /*
> SET3 */
> >>
> >> The final "1" in each of the GPIO specifiers above should be
> GPIO_ACTIVE_LOW.
> >>
> >>
> >>> +
> >>> +                       /*
> >>> +                        * The following arrays of DVS voltages are
> not used, since we are
> >>> +                        * not using GPIOs to control PMIC bucks, but
> they must be defined
> >>> +                        * to please the driver.
> >>> +                        */
> >>> +                       s5m8767,pmic-buck2-dvs-voltage =3D <1350000>,
> <1300000>,
> >>> +                                                        <1250000>,
> <1200000>,
> >>> +                                                        <1150000>,
> <1100000>,
> >>> +                                                        <1000000>,
> <950000>;
> >>> +
> >>> +                       s5m8767,pmic-buck3-dvs-voltage =3D <1100000>,
> <1100000>,
> >>> +                                                        <1100000>,
> <1100000>,
> >>> +                                                        <1000000>,
> <1000000>,
> >>> +                                                        <1000000>,
> <1000000>;
> >>> +
> >>> +                       s5m8767,pmic-buck4-dvs-voltage =3D <1200000>,
> <1200000>,
> >>> +                                                        <1200000>,
> <1200000>,
> >>> +                                                        <1200000>,
> <1200000>,
> >>> +                                                        <1200000>,
> <1200000>;
> >>> +
> >>> +                       clocks {
> >>> +                               compatible =3D "samsung,s5m8767-clk";
> >>> +                               #clock-cells =3D <1>;
> >>> +                               clock-output-names =3D "en32khz_ap",
> >>> +                                                    "en32khz_cp",
> >>> +                                                    "en32khz_bt";
> >>> +                       };
> >>> +
> >>> +                       regulators {
> >>> +                               s5m_ldo4_reg: LDO4 {
> >>> +                                       regulator-name =3D
> "P1.0V_LDO_OUT4";
> >>> +                                       regulator-min-microvolt =3D
> <1000000>;
> >>> +                                       regulator-max-microvolt =3D
> <1000000>;
> >>> +                                       regulator-always-on;
> >>> +                                       op_mode =3D <0>;
> >>
> >> I think that "op_mode" here is questionable.  Adding Javier to the
> >> thread who was looking at this for max77802 and possibly max77686.
> >
> > Confirming that this op_mode is present in the original 3.8 device tree=
.
>
> Yes and it needs to be handled eventually.  It makes suspend/resume
> work properly.  ...but I think it needs to be thought out better.
>
> ...but given that other users of this PMIC have it I guess it makes
> sense to leave it in.  Javier was going to try to think it through
> better for max77686 and max77802.
>
>
> > (I used dtc to compile my /proc/device-tree tarball back to .dts, so it
> > has hexadecimal <0x0> but that shouldn't matter to dtc AFAIU.)
> >
> >>> +                               };
> >>> +
> >>> +                               s5m_ldo5_reg: LDO5 {
> >>> +                                       regulator-name =3D
> "P1.0V_LDO_OUT5";
> >>> +                                       regulator-min-microvolt =3D
> <1000000>;
> >>> +                                       regulator-max-microvolt =3D
> <1000000>;
> >>> +                                       regulator-always-on;
> >>> +                                       op_mode =3D <0>;
> >>> +                               };
> >>> +
> >>> +                               s5m_ldo6_reg: LDO6 {
> >>> +                                       regulator-name =3D "vdd_mydp"=
;
> >>> +                                       regulator-min-microvolt =3D
> <1000000>;
> >>> +                                       regulator-max-microvolt =3D
> <1000000>;
> >>> +                                       regulator-always-on;
> >>> +                                       op_mode =3D <3>;
> >>> +                               };
> >>> +
> >>> +                               s5m_ldo7_reg: LDO7 {
> >>> +                                       regulator-name =3D
> "P1.1V_LDO_OUT7";
> >>> +                                       regulator-min-microvolt =3D
> <1100000>;
> >>> +                                       regulator-max-microvolt =3D
> <1100000>;
> >>> +                                       regulator-always-on;
> >>> +                                       op_mode =3D <3>;
> >>> +                               };
> >>> +
> >>> +                               s5m_ldo8_reg: LDO8 {
> >>> +                                       regulator-name =3D
> "P1.0V_LDO_OUT8";
> >>> +                                       regulator-min-microvolt =3D
> <1000000>;
> >>> +                                       regulator-max-microvolt =3D
> <1000000>;
> >>> +                                       regulator-always-on;
> >>> +                                       op_mode =3D <3>;
> >>> +                               };
> >>> +
> >>> +                               s5m_ldo10_reg: LDO10 {
> >>> +                                       regulator-name =3D
> "P1.8V_LDO_OUT10";
> >>> +                                       regulator-min-microvolt =3D
> <1800000>;
> >>> +                                       regulator-max-microvolt =3D
> <1800000>;
> >>> +                                       regulator-always-on;
> >>> +                                       op_mode =3D <3>;
> >>> +                               };
> >>> +
> >>> +                               s5m_ldo11_reg: LDO11 {
> >>> +                                       regulator-name =3D
> "P1.8V_LDO_OUT11";
> >>> +                                       regulator-min-microvolt =3D
> <1800000>;
> >>> +                                       regulator-max-microvolt =3D
> <1800000>;
> >>> +                                       regulator-always-on;
> >>> +                                       op_mode =3D <0>;
> >>> +                               };
> >>> +
> >>> +                               s5m_ldo12_reg: LDO12 {
> >>> +                                       regulator-name =3D
> "P3.0V_LDO_OUT12";
> >>> +                                       regulator-min-microvolt =3D
> <3000000>;
> >>> +                                       regulator-max-microvolt =3D
> <3000000>;
> >>> +                                       regulator-always-on;
> >>> +                                       op_mode =3D <3>;
> >>> +                               };
> >>> +
> >>> +                               s5m_ldo13_reg: LDO13 {
> >>> +                                       regulator-name =3D
> "P1.8V_LDO_OUT13";
> >>> +                                       regulator-min-microvolt =3D
> <1800000>;
> >>> +                                       regulator-max-microvolt =3D
> <1800000>;
> >>> +                                       regulator-always-on;
> >>> +                                       op_mode =3D <0>;
> >>> +                               };
> >>> +
> >>> +                               s5m_ldo14_reg: LDO14 {
> >>> +                                       regulator-name =3D
> "P1.8V_LDO_OUT14";
> >>> +                                       regulator-min-microvolt =3D
> <1800000>;
> >>> +                                       regulator-max-microvolt =3D
> <1800000>;
> >>> +                                       regulator-always-on;
> >>> +                                       op_mode =3D <3>;
> >>> +                               };
> >>> +
> >>> +                               s5m_ldo15_reg: LDO15 {
> >>> +                                       regulator-name =3D
> "P1.0V_LDO_OUT15";
> >>> +                                       regulator-min-microvolt =3D
> <1000000>;
> >>> +                                       regulator-max-microvolt =3D
> <1000000>;
> >>> +                                       regulator-always-on;
> >>> +                                       op_mode =3D <3>;
> >>> +                               };
> >>> +
> >>> +                               s5m_ldo16_reg: LDO16 {
> >>> +                                       regulator-name =3D
> "P1.8V_LDO_OUT16";
> >>> +                                       regulator-min-microvolt =3D
> <1800000>;
> >>> +                                       regulator-max-microvolt =3D
> <1800000>;
> >>> +                                       regulator-always-on;
> >>> +                                       op_mode =3D <3>;
> >>> +                               };
> >>> +
> >>> +                               s5m_ldo17_reg: LDO17 {
> >>> +                                       regulator-name =3D
> "P2.8V_LDO_OUT17";
> >>> +                                       regulator-min-microvolt =3D
> <2800000>;
> >>> +                                       regulator-max-microvolt =3D
> <2800000>;
> >>> +                                       regulator-always-on;
> >>> +                                       op_mode =3D <0>;
> >>> +                               };
> >>> +
> >>> +                               s5m_ldo25_reg: LDO25 {
> >>> +                                       regulator-name =3D "vdd_bridg=
e";
> >>> +                                       regulator-min-microvolt =3D
> <1200000>;
> >>> +                                       regulator-max-microvolt =3D
> <1200000>;
> >>> +                                       regulator-always-on;
> >>> +                                       op_mode =3D <1>;
> >>> +                               };
> >>> +
> >>> +                               BUCK1 {
> >>> +                                       regulator-name =3D "vdd_mif";
> >>> +                                       regulator-min-microvolt =3D
> <950000>;
> >>> +                                       regulator-max-microvolt =3D
> <1300000>;
> >>> +                                       regulator-always-on;
> >>> +                                       regulator-boot-on;
> >>> +                                       op_mode =3D <3>;
> >>> +                               };
> >>> +
> >>> +                               BUCK2 {
> >>> +                                       regulator-name =3D "vdd_arm";
> >>> +                                       regulator-min-microvolt =3D
> <850000>;
> >>> +                                       regulator-max-microvolt =3D
> <1350000>;
> >>> +                                       regulator-always-on;
> >>> +                                       regulator-boot-on;
> >>> +                                       op_mode =3D <3>;
> >>> +                               };
> >>> +
> >>> +                               BUCK3 {
> >>> +                                       regulator-name =3D "vdd_int";
> >>> +                                       regulator-min-microvolt =3D
> <900000>;
> >>> +                                       regulator-max-microvolt =3D
> <1200000>;
> >>> +                                       regulator-always-on;
> >>> +                                       regulator-boot-on;
> >>> +                                       op_mode =3D <3>;
> >>> +                               };
> >>> +
> >>> +                               BUCK4 {
> >>> +                                       regulator-name =3D "vdd_g3d";
> >>> +                                       regulator-min-microvolt =3D
> <850000>;
> >>> +                                       regulator-max-microvolt =3D
> <1300000>;
> >>> +                                       regulator-boot-on;
> >>> +                                       op_mode =3D <3>;
> >>> +                               };
> >>> +
> >>> +                               BUCK5 {
> >>> +                                       regulator-name =3D
> "P1.8V_BUCK_OUT5";
> >>> +                                       regulator-min-microvolt =3D
> <1800000>;
> >>> +                                       regulator-max-microvolt =3D
> <1800000>;
> >>> +                                       regulator-always-on;
> >>> +                                       regulator-boot-on;
> >>> +                                       op_mode =3D <1>;
> >>> +                               };
> >>> +
> >>> +                               BUCK6 {
> >>> +                                       regulator-name =3D
> "P1.2V_BUCK_OUT6";
> >>> +                                       regulator-min-microvolt =3D
> <1200000>;
> >>> +                                       regulator-max-microvolt =3D
> <1200000>;
> >>> +                                       regulator-always-on;
> >>> +                                       regulator-boot>
> >>
> > -on;
> >>> +                                       op_mode =3D <0>;
> >>> +                               };
> >>> +
> >>> +                               BUCK9 {
> >>> +                                       regulator-name =3D "vdd_ummc"=
;
> >>> +                                       regulator-min-microvolt =3D
> <950000>;
> >>> +                                       regulator-max-microvolt =3D
> <3000000>;
> >>> +                                       regulator-always-on;
> >>> +                                       regulator-boot-on;
> >>> +                                       op_mode =3D <3>;
> >>> +                               };
> >>> +                       };
> >>> +               };
> >>> +       };
> >>> +
> >>> +       i2c@12C70000 {
> >>> +               trackpad {
> >>> +                       status =3D "disabled";
> >>
> >> Having this bogus entry here doesn't add anything.  Remove it until
> >> the trackpad should be added.  See http://crbug.com/371114 for a
> >> slightly stale bug about trackpad.
> >
> > You misunderstand: This resolves an error about the cypress,cyapa
> > inherited from -cros-common.dtsi. Spring uses a different device and tw=
o
> > different I2C addresses.
>
> Ah, right.  I forgot about cros5250-common.
>
>
> > Nodes named trackpad-bootloader and trackpad-alt are prepared here:
> > https://github.com/afaerber/linux/commits/spring-next
>
> It might work, but you run into pinctrl problems.  You need to put the
> pinctrl node _somewhere_ and if you put it with the trackpad entries
> themselves then you get conflicts.  ...and it doesn't belong in the
> i2c bus (though that's what we have locally in our tree)
>
> See <http://permalink.gmane.org/gmane.linux.kernel.samsung-soc/30953>
> for some background.
>
>
> >>> +               };
> >>> +       };
> >>> +
> >>> +       i2c@12CA0000 {
> >>> +               embedded-controller {
> >>
> >> Add "cros_ec" alias like snow.
> >>
> >>
> >>> +                       compatible =3D "google,cros-ec-i2c";
> >>> +                       reg =3D <0x1e>;
> >>> +                       interrupts =3D <6 0>;
> >>> +                       interrupt-parent =3D <&gpx1>;
> >>> +                       wakeup-source;
> >>> +
> >>> +                       keyboard-controller {
> >>
> >> Don't include keyboard-controller here.  Add:
> >>
> >> #include "cros-ec-keyboard.dtsi"
> >>
> >> ...at the bottom.  Note that I think that the spring EC has a special
> >> "charger" key that it uses to indicate when a charger was plugged in
> >> and unplugged.  I'm not sure how that will end up getting supported
> >> upstream but you could just leave it out for now.
> >
> > Is there such a pending patch for snow? That's what I modeled after.
>
> Yeah, and it appears to be in linux-next.  (1a395e3 ARM: dts: Use the
> cros-ec-keyboard fragment in exynos5250-snow).  It actually ended up
> going through the tegra tree since it was in a series with a similar
> tegra change.  I asked Kukjin to pick it up via merge but he didn't
> appear to.
>
>
> > Where is cros-ec-keyboard.dtsi? Don't see it in
> >
> http://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/tree/=
arch/arm/boot/dts?h=3Dfor-next
> > or
> >
> http://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/tree/=
include/dt-bindings?h=3Dfor-next
> >
> > Are you proposing I factor it out?
> >
> >>> +                               compatible =3D "google,cros-ec-keyb";
> >>> +                               keypad,num-rows =3D <8>;
> >>> +                               keypad,num-columns =3D <13>;
> >>
> >> Don't you need pinctrl here?
> >
> > The keyboard is usable; what would pinctrl be needed for? There's none
> > in the 3.8 device tree.
>
> Generally it's good to have the pinctrl listed to configure the IRQ
> properly (get the pulls right).  It might work without it but it's a
> little less ideal I think.
>
> I see this, right?
>
>                         pinctrl-names =3D "default";
>                         pinctrl-0 =3D <&ec_irq>;
>
> ...in the downstream "arch/arm/boot/dts/exynos5250-spring.dts"
>
>
> >>> +                               google,needs-ghost-filter;
> >>> +                               linux,keymap =3D <
> >>> +                                       0x0001007d      /* L_META */
> >>> +                                       0x0002003b      /* F1 */
> >>> +                                       0x00030030      /* B */
> >>> +                                       0x00040044      /* F10 */
> >>> +                                       0x00060031      /* N */
> >>> +                                       0x0008000d      /* =3D */
> >>> +                                       0x000a0064      /* R_ALT */
> >>> +
> >>> +                                       0x01010001      /* ESC */
> >>> +                                       0x0102003e      /* F4 */
> >>> +                                       0x01030022      /* G */
> >>> +                                       0x01040041      /* F7 */
> >>> +                                       0x01060023      /* H */
> >>> +                                       0x01080028      /* ' */
> >>> +                                       0x01090043      /* F9 */
> >>> +                                       0x010b000e      /* BKSPACE */
> >>> +
> >>> +                                       0x0200001d      /* L_CTRL */
> >>> +                                       0x0201000f      /* TAB */
> >>> +                                       0x0202003d      /* F3 */
> >>> +                                       0x02030014      /* T */
> >>> +                                       0x02040040      /* F6 */
> >>> +                                       0x0205001b      /* ] */
> >>> +                                       0x02060015      /* Y */
> >>> +                                       0x02070056      /* 102ND */
> >>> +                                       0x0208001a      /* [ */
> >>> +                                       0x02090042      /* F8 */
> >>> +
> >>> +                                       0x03010029      /* GRAVE */
> >>> +                                       0x0302003c      /* F2 */
> >>> +                                       0x03030006      /* 5 */
> >>> +                                       0x0304003f      /* F5 */
> >>> +                                       0x03060007      /* 6 */
> >>> +                                       0x0308000c      /* - */
> >>> +                                       0x030b002b      /* \ */
> >>> +
> >>> +                                       0x04000061      /* R_CTRL */
> >>> +                                       0x0401001e      /* A */
> >>> +                                       0x04020020      /* D */
> >>> +                                       0x04030021      /* F */
> >>> +                                       0x0404001f      /* S */
> >>> +                                       0x04050025      /* K */
> >>> +                                       0x04060024      /* J */
> >>> +                                       0x04080027      /* ; */
> >>> +                                       0x04090026      /* L */
> >>> +                                       0x040a002b      /* \ */
> >>> +                                       0x040b001c      /* ENTER */
> >>> +
> >>> +                                       0x0501002c      /* Z */
> >>> +                                       0x0502002e      /* C */
> >>> +                                       0x0503002f      /* V */
> >>> +                                       0x0504002d      /* X */
> >>> +                                       0x05050033      /* , */
> >>> +                                       0x05060032      /* M */
> >>> +                                       0x0507002a      /* L_SHIFT */
> >>> +                                       0x05080035      /* / */
> >>> +                                       0x05090034      /* . */
> >>> +                                       0x050B0039      /* SPACE */
> >>> +
> >>> +                                       0x06010002      /* 1 */
> >>> +                                       0x06020004      /* 3 */
> >>> +                                       0x06030005      /* 4 */
> >>> +                                       0x06040003      /* 2 */
> >>> +                                       0x06050009      /* 8 */
> >>> +                                       0x06060008      /* 7 */
> >>> +                                       0x0608000b      /* 0 */
> >>> +                                       0x0609000a      /* 9 */
> >>> +                                       0x060a0038      /* L_ALT */
> >>> +                                       0x060b006c      /* DOWN */
> >>> +                                       0x060c006a      /* RIGHT */
> >>> +
> >>> +                                       0x07010010      /* Q */
> >>> +                                       0x07020012      /* E */
> >>> +                                       0x07030013      /* R */
> >>> +                                       0x07040011      /* W */
> >>> +                                       0x07050017      /* I */
> >>> +                                       0x07060016      /* U */
> >>> +                                       0x07070036      /* R_SHIFT */
> >>> +                                       0x07080019      /* P */
> >>> +                                       0x07090018      /* O */
> >>> +                                       0x070b0067      /* UP */
> >>> +                                       0x070c0069      /* LEFT */
> >>> +                               >;
> >>> +                       };
> >>> +               };
> >>> +
> >>> +               power-regulator {
> >>> +                       compatible =3D "ti,tps65090";
> >>
> >> I doubt tps65090 will "just work".  Does it?
> >
> > Good question. How to tell? :) Not familiar with clocks and regulators.
> > I don't see the nodes referenced anywhere, so I could just try to drop
> > (as I would, as per my cover letter, propose for anything non-essential
> > that turns controversial).
>
> What does "dmesg | grep tps65090" say?
>
> What does this show:
>   grep "" /sys/class/regulator/*/name
>
>
> > If we drop tps65090, can we safely drop vbat-fixed-regulator as well?
>
> Yes
>
>
> >> On spring the tps65090 is not directly on the same i2c bus as the EC.
> >> It's actually hidden behind the EC.
> >>
> >> Locally in the ChromeOS tree there appears to be a forked copy of the
> >> 65090 regulator driver that's in use just for spring.  See this from
> >> the ChromeOS 3.8 tree:
> >>
> >> ./drivers/regulator/tps65090-regulator.c
> >> ./drivers/regulator/cros_ec-tps65090.c
> >>
> >> The Spring version of the driver sends EC commands directly to access
> >> the tps65090.
> >>
> >> It is possible (untested) that you could also talk to tps65090 over an
> >> i2c tunnel.  On exynos5420-peach-pit we have a full fledged i2c
> >> tunnel, but you may be able to extend the tunnel to export an i2c
> >> tunnel for spring using something like
> >> <https://chromium-review.googlesource.com/66116>
> >
> > The SBS battery thingy (not in this patch) should also be behind some
> > tunnel. There's none defined in -cros-common.dtsi or in my patch, and
> > still it shows up in dmesg to my surprise, complaining "Couldn't read
> > remote-bus property".
>
> Might be due to the cros5250-common.  ...but yes, the battery should
> be behind the tunnel too and the patches needed for Spring haven't
> been posted by anyone yet.  I picked up a whole bunch of cros_ec
> cleanup patches and thought that the tunnel patches for spring could
> possible go up after those land.
>
>
> >>> +                       reg =3D <0x48>;
> >>> +
> >>> +                       /*
> >>> +                        * Config irq to disable internal pulls
> >>> +                        * even though we run in polling mode.
> >>> +                        */
> >>> +                       pinctrl-names =3D "default";
> >>> +                       pinctrl-0 =3D <&tps65090_irq>;
> >>> +
> >>> +                       vsys1-supply =3D <&vbat>;
> >>> +                       vsys2-supply =3D <&vbat>;
> >>> +                       vsys3-supply =3D <&vbat>;
> >>> +                       infet1-supply =3D <&vbat>;
> >>> +                       infet2-supply =3D <&vbat>;
> >>> +                       infet3-supply =3D <&vbat>;
> >>> +                       infet4-supply =3D <&vbat>;
> >>> +                       infet5-supply =3D <&vbat>;
> >>> +                       infet6-supply =3D <&vbat>;
> >>> +                       infet7-supply =3D <&vbat>;
> >>> +                       vsys-l1-supply =3D <&vbat>;
> >>> +                       vsys-l2-supply =3D <&vbat>;
> >>> +
> >>> +                       regulators {
> >>> +                               fet1 {
> >>> +                                       regulator-name =3D "vcd_led";
> >>> +                                       regulator-min-microvolt =3D
> <12000000>;
> >>> +                                       regulator-max-microvolt =3D
> <12000000>;
> >>> +                               };
> >>> +                               fet3 {
> >>> +                                       regulator-name =3D "wwan_r";
> >>> +                                       regulator-min-microvolt =3D
> <3300000>;
> >>> +                                       regulator-max-microvolt =3D
> <3300000>;
> >>> +                                       regulator-always-on;
> >>> +                               };
> >>> +                               fet5 {
> >>> +                                       regulator-name =3D "cam";
> >>> +                                       regulator-min-microvolt =3D
> <3300000>;
> >>> +                                       regulator-max-microvolt =3D
> <3300000>;
> >>> +                                       regulator-always-on;
> >>> +                               };
> >>> +                               fet6 {
> >>> +                                       regulator-name =3D "lcd_vdd";
> >>> +                                       regulator-min-microvolt =3D
> <3300000>;
> >>> +                                       regulator-max-microvolt =3D
> <3300000>;
> >>> +                               };
> >>> +                               fet7 {
> >>> +                                       regulator-name =3D "ts";
> >>> +                                       regulator-min-microvolt =3D
> <5000000>;
> >>> +                                       regulator-max-microvolt =3D
> <5000000>;
> >>> +                               };
> >>> +                       };
> >>> +
> >>> +                       charger {
> >>> +                               compatible =3D "ti,tps65090-charger";
> >>> +                       };
> >>> +               };
> >>> +       };
> >>> +
> >>> +       hdmi {
> >>> +               hdmi-en-supply =3D <&s5m_ldo8_reg>;
> >>> +               vdd-supply =3D <&s5m_ldo8_reg>;
> >>> +               vdd_osc-supply =3D <&s5m_ldo10_reg>;
> >>> +               vdd_pll-supply =3D <&s5m_ldo8_reg>;
> >>> +       };
> >>> +
> >>> +       fimd@14400000 {
> >>> +               status =3D "okay";
> >>> +               samsung,invert-vclk;
> >>> +       };
> >>> +
> >>> +       dp-controller@145B0000 {
> >>> +               status =3D "okay";
> >>> +               pinctrl-names =3D "default";
> >>> +               pinctrl-0 =3D <&dp_hpd>;
> >>
> >> This is probably not right.  It looks as if spring uses gpc3-0 for
> >> display port HPD (as a GPIO).  The upstream has this in the
> >> exynos5250-pinctrl.dtsi as a different pin.
> >>
> >> I think you'll need to define your own pinctrl here.
> >>
> >>
> >>> +               samsung,color-space =3D <0>;
> >>> +               samsung,dynamic-range =3D <0>;
> >>> +               samsung,ycbcr-coeff =3D <0>;
> >>> +               samsung,color-depth =3D <1>;
> >>> +               samsung,link-rate =3D <0x0a>;
> >>> +               samsung,lane-count =3D <1>;
> >>> +               samsung,hpd-gpio =3D <&gpc3 0 0>;
> >>> +
> >>> +               display-timings {
> >>> +                       native-mode =3D <&timing1>;
> >>> +
> >>> +                       timing1: timing@1 {
> >>> +                               clock-frequency =3D <70589280>;
> >>> +                               hactive =3D <1366>;
> >>> +                               vactive =3D <768>;
> >>> +                               hfront-porch =3D <40>;
> >>> +                               hback-porch =3D <40>;
> >>> +                               hsync-len =3D <32>;
> >>> +                               vback-porch =3D <10>;
> >>> +                               vfront-porch =3D <12>;
> >>> +                               vsync-len =3D <6>;
> >>> +                       };
> >>> +               };
> >>> +       };
> >>> +
> >>> +       fixed-rate-clocks {
> >>> +               xxti {
> >>> +                       compatible =3D "samsung,clock-xxti";
> >>> +                       clock-frequency =3D <24000000>;
> >>> +               };
> >>> +       };
> >>> +};
> >
> > Will check on the other suggestions.
>
> -Doug
>

--047d7b3a93e00f5b5804fc964344
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX2V4dHJhIj48YnI+PGJyPjxkaXYg
Y2xhc3M9ImdtYWlsX3F1b3RlIj5PbiBNb24sIEp1biAyMywgMjAxNCBhdCA5OjA1IFBNLCBEb3Vn
IEFuZGVyc29uIDxzcGFuIGRpcj0ibHRyIj4mbHQ7PGEgaHJlZj0ibWFpbHRvOmRpYW5kZXJzQGNo
cm9taXVtLm9yZyIgdGFyZ2V0PSJfYmxhbmsiPmRpYW5kZXJzQGNocm9taXVtLm9yZzwvYT4mZ3Q7
PC9zcGFuPiB3cm90ZTo8YnI+DQoNCjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5
bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdC13aWR0aDoxcHg7Ym9yZGVy
LWxlZnQtY29sb3I6cmdiKDIwNCwyMDQsMjA0KTtib3JkZXItbGVmdC1zdHlsZTpzb2xpZDtwYWRk
aW5nLWxlZnQ6MWV4Ij5BbmRyZWFzLDxicj4NCjxkaXY+PGRpdiBjbGFzcz0iaDUiPjxicj4NCk9u
IE1vbiwgSnVuIDIzLCAyMDE0IGF0IDM6NDYgUE0sIEFuZHJlYXMgRsOkcmJlciAmbHQ7PGEgaHJl
Zj0ibWFpbHRvOmFmYWVyYmVyQHN1c2UuZGUiPmFmYWVyYmVyQHN1c2UuZGU8L2E+Jmd0OyB3cm90
ZTo8YnI+DQomZ3Q7IEhpIERvdWcsPGJyPg0KJmd0Ozxicj4NCiZndDsgQW0gMjMuMDYuMjAxNCAy
MTo0Nywgc2NocmllYiBEb3VnIEFuZGVyc29uOjxicj4NCiZndDsmZ3Q7IFRoYW5rcyBmb3IgcG9z
dGluZyEgwqBBIGZpcnN0IHBhc3Mgb24gdGhpcyBpcyBiZWxvdy4uLjxicj4NCiZndDs8YnI+DQom
Z3Q7IFRoYW5rcyBhIGxvdCBmb3IgeW91ciBxdWljayByZXZpZXchIE15IGZpcnN0IGJpZyAuZHRz
IHBhdGNoLCBhbmQgbm88YnI+DQomZ3Q7IGRhdGFzaGVldHMgZm9yIHRoZSBoYXJkd2FyZSBhdCBo
YW5kIGFzIGEgdXNlci48YnI+DQomZ3Q7PGJyPg0KJmd0OyBBIGZpcnN0IHBhc3Mgb2YgcmVwbGll
cyB0byBteSBkZWZlbnNlLiA7KTxicj4NCiZndDs8YnI+DQomZ3Q7Jmd0OyBPbiBTdW4sIEp1biAy
MiwgMjAxNCBhdCA2OjIxIFBNLCBBbmRyZWFzIEbDpHJiZXIgJmx0OzxhIGhyZWY9Im1haWx0bzph
ZmFlcmJlckBzdXNlLmRlIj5hZmFlcmJlckBzdXNlLmRlPC9hPiZndDsgd3JvdGU6PGJyPg0KJmd0
OyBbLi4uXTxicj4NCiZndDsmZ3Q7Jmd0OyBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMv
ZXh5bm9zNTI1MC1zcHJpbmcuZHRzIGIvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNTI1MC1zcHJp
bmcuZHRzPGJyPg0KJmd0OyZndDsmZ3Q7IG5ldyBmaWxlIG1vZGUgMTAwNjQ0PGJyPg0KJmd0OyZn
dDsmZ3Q7IGluZGV4IDAwMDAwMDAuLmU4NTdkNDQ8YnI+DQomZ3Q7Jmd0OyZndDsgLS0tIC9kZXYv
bnVsbDxicj4NCiZndDsmZ3Q7Jmd0OyArKysgYi9hcmNoL2FybS9ib290L2R0cy9leHlub3M1MjUw
LXNwcmluZy5kdHM8YnI+DQomZ3Q7Jmd0OyZndDsgQEAgLTAsMCArMSw1NTYgQEA8YnI+DQomZ3Q7
Jmd0OyZndDsgKy8qPGJyPg0KJmd0OyZndDsmZ3Q7ICsgKiBHb29nbGUgU3ByaW5nIGJvYXJkIGRl
dmljZSB0cmVlIHNvdXJjZTxicj4NCiZndDsmZ3Q7Jmd0OyArICo8YnI+DQomZ3Q7Jmd0OyZndDsg
KyAqIENvcHlyaWdodCAoYykgMjAxMyBHb29nbGUsIEluYzxicj4NCiZndDsmZ3Q7Jmd0OyArICog
Q29weXJpZ2h0IChjKSAyMDE0IFNVU0UgTElOVVggUHJvZHVjdHMgR21iSDxicj4NCiZndDsmZ3Q7
Jmd0OyArICo8YnI+DQomZ3Q7Jmd0OyZndDsgKyAqIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3
YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5PGJyPg0KJmd0OyZndDsm
Z3Q7ICsgKiBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNl
bnNlIHZlcnNpb24gMiBhczxicj4NCiZndDsmZ3Q7Jmd0OyArICogcHVibGlzaGVkIGJ5IHRoZSBG
cmVlIFNvZnR3YXJlIEZvdW5kYXRpb24uPGJyPg0KJmd0OyZndDsmZ3Q7ICsgKi88YnI+DQomZ3Q7
Jmd0OyZndDsgKzxicj4NCiZndDsmZ3Q7Jmd0OyArL2R0cy12MS87PGJyPg0KJmd0OyZndDsmZ3Q7
ICsjaW5jbHVkZSAmcXVvdDtleHlub3M1MjUwLmR0c2kmcXVvdDs8YnI+DQomZ3Q7Jmd0OyZndDsg
KyNpbmNsdWRlICZxdW90O2V4eW5vczUyNTAtY3Jvcy1jb21tb24uZHRzaSZxdW90Ozxicj4NCiZn
dDsmZ3Q7PGJyPg0KJmd0OyZndDsgSXQgaXMgcG9zc2libGUgd2UgbWF5IHdhbnQgdG8gYmFja3Bl
ZGFsIG9uIHRoZSB1c2Ugb2Y8YnI+DQomZ3Q7Jmd0OyAmcXVvdDtleHlub3M1MjUwLWNyb3MtY29t
bW9uLmR0c2kmcXVvdDsuIMKgSSBrbm93IHRoYXQgT2xvZiAobm93IENDZWQpIHNhaWQgaGU8YnI+
DQomZ3Q7Jmd0OyB3YXNuJiMzOTt0IGEgZmFuIG9mIGhvdyBpdCB0dXJuZWQgb3V0Ljxicj4NCiZn
dDsmZ3Q7PGJyPg0KJmd0OyZndDsgVGhlIG9yaWdpbmFsIGlkZWEgd2FzIHRoYXQgaXQgc2hvdWxk
IGluY2x1ZGUgdGhlIGFyYml0cmFyeSBzZXQgb2Y8YnI+DQomZ3Q7Jmd0OyB0aGluZ3MgdGhhdCBh
cmUgY29tbW9uIGJldHdlZW4gYSBjaHVuayBvZiBDaHJvbWUgT1MgYm9hcmRzLiDCoEFzIG1vcmU8
YnI+DQomZ3Q7Jmd0OyBib2FyZHMgd2VyZSBpbnRyb2R1Y2VkIHRoaW5ncyB3b3VsZCBuZWVkIHRv
IG1pZ3JhdGUgZnJvbSB0aGUgJnF1b3Q7Y29tbW9uJnF1b3Q7PGJyPg0KJmd0OyZndDsgZmlsZSB0
byB0aGUgYm9hcmQgZmlsZXMuPGJyPg0KJmd0OyZndDs8YnI+DQomZ3Q7Jmd0OyBBdCB0aGUgbW9t
ZW50IHRoZSBjdXJyZW50IGNvbnZlbnRpb25hbCB3aXNkb20gaXMgdGhhdCBzb21lIGR1cGxpY2F0
aW9uPGJyPg0KJmd0OyZndDsgaXMgYmV0dGVyIHRoYW4gdGhlIGNvbmZ1c2luZyBtb3ZlbWVudCBv
ZiBldmVyeXRoaW5nIGJhY2sgYW5kIGZvcnRoLjxicj4NCiZndDsmZ3Q7IFNlZSBleHlub3M1NDIw
LXBlYWNoLXBpdCBhbmQgZXh5bm9zNTgwMC1wZWFjaC1waSBpbiBUb1QgbGludXgtbmV4dC48YnI+
DQomZ3Q7Jmd0Ozxicj4NCiZndDsmZ3Q7PGJyPg0KJmd0OyZndDsmZ3Q7ICsvIHs8YnI+DQomZ3Q7
Jmd0OyZndDsgKyDCoCDCoCDCoCBtb2RlbCA9ICZxdW90O0dvb2dsZSBTcHJpbmcmcXVvdDs7PGJy
Pg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgY29tcGF0aWJsZSA9ICZxdW90O2dvb2dsZSxzcHJp
bmcmcXVvdDssICZxdW90O3NhbXN1bmcsZXh5bm9zNTI1MCZxdW90OywgJnF1b3Q7c2Ftc3VuZyxl
eHlub3M1JnF1b3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArPGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAg
wqAgwqAgcGluY3RybEAxMTQwMDAwMCB7PGJyPg0KJmd0OyZndDs8YnI+DQomZ3Q7Jmd0OyBUaGUg
bmV3IGJlc3Qgd2F5IHRvIGRvIHRoaW5ncyBpcyB0byBwdXQgdGhpcyBkb3duIGF0IHRoZSBib3R0
b20uIMKgU2VlPGJyPg0KJmd0OyZndDsgZXh5bm9zNTQyMC1wZWFjaC1waXQgYXMgYW4gZXhhbXBs
ZTo8YnI+DQomZ3Q7Jmd0Ozxicj4NCiZndDsmZ3Q7ICZhbXA7cGluY3RybF8wIHs8YnI+DQomZ3Q7
Jmd0OyDCoCAuLi48YnI+DQomZ3Q7Jmd0OyB9PGJyPg0KJmd0OyZndDs8YnI+DQomZ3Q7Jmd0OyBO
b3RlIHRoYXQgSSBiZWxpZXZlIGl0IHdhcyBkZWNpZGVkIHRoYXQgdG9wLWxldmVsIHJlZmVyZW5j
ZXMgbGlrZSB0aGF0PGJyPg0KJmd0OyZndDsgc2hvdWxkIGJlIHNvcnRlZCBhbHBoYWJldGljYWxs
eS48YnI+DQomZ3Q7PGJyPg0KJmd0OyBUaGFua3MgZm9yIHRoZSBoaW50LiAoTXkgY2hvc2VuIHNv
cnQgb3JkZXIgaGVyZSB3YXMgYnkgYWRkcmVzcy4pPGJyPg0KJmd0Ozxicj4NCiZndDsmZ3Q7IElm
IHlvdSB3YW50ZWQgdG8gYXBwbHkgdGhhdCBydW4gdG8gZXh5bm9zNTI1MC1zbm93IEkgZG9uJiMz
OTt0IHRoaW5rIGl0PGJyPg0KJmd0OyZndDsgd291bGQgYmUgYSB0ZXJyaWJsZSBpZGVhLjxicj4N
CiZndDs8YnI+DQomZ3Q7IEkgY2FuIG9mIGNvdXJzZSBhcHBseSBjaGFuZ2VzIHRvIFNub3csIGJ1
dCBJIGNhbm5vdCB0ZXN0IHRoZW0gbXlzZWxmLjxicj4NCjxicj4NCjwvZGl2PjwvZGl2PklmIHlv
dSB3YW50IHRvIHNlbmQgdXAgYSBwYXRjaCBsaWtlIHRoYXQgSSYjMzk7bSBoYXBweSB0byBnaXZl
IGl0IGEgb25jZTxicj4NCm92ZXIgYW5kIGFsc28gdG8gdGVzdCBpdC4gwqAuLi5idXQgZG9uJiMz
OTt0IGZlZWwgb2JsaWdhdGVkPGJyPg0KPGRpdj48ZGl2IGNsYXNzPSJoNSI+PGJyPg0KPGJyPg0K
Jmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgczVtODc2N19kdnM6IHM1bTg3Njct
ZHZzIHs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCBzYW1zdW5nLHBpbnMgPSAmcXVvdDtncGQxLTAmcXVvdDssICZxdW90O2dwZDEtMSZxdW90Oywg
JnF1b3Q7Z3BkMS0yJnF1b3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIHNhbXN1bmcscGluLWZ1bmN0aW9uID0gJmx0OzAmZ3Q7Ozxicj4NCiZn
dDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHNhbXN1bmcscGlu
LXB1ZCA9ICZsdDsxJmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCBzYW1zdW5nLHBpbi1kcnYgPSAmbHQ7MCZndDs7PGJyPg0KJmd0OyZndDsm
Z3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfTs8YnI+DQomZ3Q7Jmd0OyZndDsgKzxicj4NCiZn
dDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHM1bTg3NjdfZHM6IHM1bTg3NjctZHMg
ezxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHNh
bXN1bmcscGlucyA9ICZxdW90O2dweDItMyZxdW90OywgJnF1b3Q7Z3B4Mi00JnF1b3Q7LCAmcXVv
dDtncHgyLTUmcXVvdDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgc2Ftc3VuZyxwaW4tZnVuY3Rpb24gPSAmbHQ7MCZndDs7PGJyPg0KJmd0OyZn
dDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgc2Ftc3VuZyxwaW4tcHVk
ID0gJmx0OzEmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIHNhbXN1bmcscGluLWRydiA9ICZsdDswJmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsg
KyDCoCDCoCDCoCDCoCDCoCDCoCDCoCB9Ozxicj4NCiZndDsmZ3Q7Jmd0OyArPGJyPg0KJmd0OyZn
dDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgdHBzNjUwOTBfaXJxOiB0cHM2NTA5MC1pcnEg
ezxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHNh
bXN1bmcscGlucyA9ICZxdW90O2dweDItNiZxdW90Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBzYW1zdW5nLHBpbi1mdW5jdGlvbiA9ICZsdDsw
Jmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCBzYW1zdW5nLHBpbi1wdWQgPSAmbHQ7MCZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgc2Ftc3VuZyxwaW4tZHJ2ID0gJmx0OzAmZ3Q7Ozxi
cj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH07PGJyPg0KJmd0OyZndDsm
Z3Q7ICs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCBzNW04NzY3X2ly
cTogczVtODc2Ny1pcnEgezxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIHNhbXN1bmcscGlucyA9ICZxdW90O2dweDMtMiZxdW90Ozs8YnI+DQomZ3Q7
Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBzYW1zdW5nLHBpbi1m
dW5jdGlvbiA9ICZsdDswJmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCBzYW1zdW5nLHBpbi1wdWQgPSAmbHQ7MCZndDs7PGJyPg0KJmd0OyZn
dDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgc2Ftc3VuZyxwaW4tZHJ2
ID0gJmx0OzAmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH07
PGJyPg0KJmd0OyZndDsmZ3Q7ICs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBoZG1pX2hwZF9pcnE6IGhkbWktaHBkLWlycSB7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgc2Ftc3VuZyxwaW5zID0gJnF1b3Q7Z3B4My03
JnF1b3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIHNhbXN1bmcscGluLWZ1bmN0aW9uID0gJmx0OzAmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyAr
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHNhbXN1bmcscGluLXB1ZCA9ICZsdDsx
Jmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCBzYW1zdW5nLHBpbi1kcnYgPSAmbHQ7MCZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgfTs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCB9Ozxicj4NCiZn
dDsmZ3Q7Jmd0OyArPGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgcGluY3RybEAxMzQwMDAw
MCB7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaHNpY19yZXNldDog
aHNpYy1yZXNldCB7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgc2Ftc3VuZyxwaW5zID0gJnF1b3Q7Z3BlMS0wJnF1b3Q7Ozxicj4NCiZndDsmZ3Q7
Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHNhbXN1bmcscGluLWZ1bmN0
aW9uID0gJmx0OzEmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIHNhbXN1bmcscGluLXB1ZCA9ICZsdDswJmd0Ozs8YnI+DQomZ3Q7Jmd0OyZn
dDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBzYW1zdW5nLHBpbi1kcnYgPSAm
bHQ7MCZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfTs8YnI+
DQomZ3Q7Jmd0Ozxicj4NCiZndDsmZ3Q7IEkmIzM5O20gcHJldHR5IHN1cmUgdGhhdCB0aGUgSFNJ
QyByZXNldCBuZWVkZWQgc29tZSBmdW5reSBjb2RlIHRvIG1ha2UgaXQ8YnI+DQomZ3Q7Jmd0OyB3
b3JrIGFuZCBJJiMzOTttIG5vdCBzdXJlIHdoYXQgdGhlIHN0YXR1cyBvZiB0aGF0IGlzIHVwc3Ry
ZWFtPGJyPg0KJmd0Ozxicj4NCiZndDsgWWVhaCwgeW91IG1lbnRpb25lZCBzb21ldGhpbmcgYWxv
bmcgdGhvc2UgbGluZXMuIEhvd2V2ZXIgaXQmIzM5O3MgdGhlPGJyPg0KJmd0OyBlcXVpdmFsZW50
IG9mIHRoZSB1c2IzLXZidXMtZW4gaW4gLXNub3cuZHRzLiBSZW5hbWUgb3IgZHJvcD88YnI+PC9k
aXY+PC9kaXY+PC9ibG9ja3F1b3RlPjxkaXY+PGJyPjwvZGl2PjxkaXY+SXQmIzM5O3MgY2xlYXJs
eSBub3QgZXF1aXZhbGVudCwgdXNiMy12YnVzLWVuIGp1c3QgdHVybnMgb24vb2ZmIHRoZSBsb2Fk
IHN3aXRjaCBmb3IgVkJVUzwvZGl2PjxkaXY+d2hpbGUgdGhlIEhTSUMgY2hpcCAoVVNCMzUwMykg
aXMgYW4gZXh0ZXJuYWwgUEhZIChhbmQgaHViKSBmb3IgdGhlIFVTQjIgcG9ydCwgdGhlIHJlc2V0
IG9mIHRoZSBQSFkgc2lkZSBvZiB0aGUgSFNJQyBuZWVkcyB0byBiZSBkb25lIHdpdGhpbiB0aGUg
cHJvcGVyIHRpbWluZyB3aW5kb3cgY29tcGFyZWQgdG8gdGhlIFNvQyBIU0lDIGNvbnRyb2xsZXIg
dG8gZ2V0IGEgd29ya2luZyBsaW5rLjwvZGl2Pg0KDQo8ZGl2PkFzIHRoZSBjdXJyZW50IGtlcm5l
bCBoYXMgYSBiaW5kaW5nIGZvciB0aGUgU01TQyBVU0IzNTAzIGFuZCBhIFBIWSBkcml2ZXIgKHdo
aWNoIGlzIGluIGRyaXZlci91c2IvbWlzYyBwcm9iYWJseSBiZWNhdXNlIGl0IGlzIGFuIGV4dGVy
bmFsIFBIWSksIHRoZSBoc2ljLXJlc2V0IHNob3VsZCBiZSBjb25uZWN0ZWQgdGhlcmUgKGFzICZx
dW90O3Jlc2V0LWdwaW9zJnF1b3Q7KS48L2Rpdj4NCg0KPGRpdj48YnI+PC9kaXY+PGRpdj5PbiB0
b3Agb2YgdGhhdCB0aGUgSFNJQyBsaW5rIGlzIGEgYml0IGZpbmlja3kgYW5kIGl0IG5lZWRzIGEg
ZmV3IHF1aXJrcyBpZiB3ZSB3YW50IGl0IHRvIHN1cnZpdmUgYWxsIGtpbmQgb2YgZXZlbnRzIDo8
L2Rpdj48ZGl2PmVnIMKgczVwX2h1Yl9jb250cm9sKCkgaW4gPGEgaHJlZj0iaHR0cHM6Ly9jaHJv
bWl1bS5nb29nbGVzb3VyY2UuY29tL2Nocm9taXVtb3MvdGhpcmRfcGFydHkva2VybmVsLysvY2hy
b21lb3MtMy44L2RyaXZlcnMvdXNiL2hvc3QvZWhjaS1zNXAuYyI+aHR0cHM6Ly9jaHJvbWl1bS5n
b29nbGVzb3VyY2UuY29tL2Nocm9taXVtb3MvdGhpcmRfcGFydHkva2VybmVsLysvY2hyb21lb3Mt
My44L2RyaXZlcnMvdXNiL2hvc3QvZWhjaS1zNXAuYzwvYT48L2Rpdj4NCg0KPGRpdj7CoDwvZGl2
PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBw
eCAwLjhleDtib3JkZXItbGVmdC13aWR0aDoxcHg7Ym9yZGVyLWxlZnQtY29sb3I6cmdiKDIwNCwy
MDQsMjA0KTtib3JkZXItbGVmdC1zdHlsZTpzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij48ZGl2Pjxk
aXYgY2xhc3M9Img1Ij4NCjxicj4NCjwvZGl2PjwvZGl2Pk9uIHNub3cgbG9jYWxseSBJIHNlZSBV
U0IyIHZidXMgaXMgZ3B4MS0xIGFuZCBVU0IzIHZidXMgaXMgZ3B4Mi03LiDCoEk8YnI+DQpkb24m
IzM5O3Qgc2VlIHRoYXQgaW4gc3ByaW5nLjxicj48L2Jsb2NrcXVvdGU+PGRpdj48YnI+PC9kaXY+
PGRpdj5PbiBTcHJpbmcsIHRoZSBVU0IzIHJvb3QgaHViIGlzIGp1c3QgY29ubmVjdGVkIHRvIHRo
ZSBpbnRlcm5hbCBjYW1lcmEgKHdoaWNoIGlzIHBvd2VyZWQgYnkgb25lIG9mIHRoZSBUUFM2NTA5
MCBMRE9zKTwvZGl2PjxkaXY+T24gdGhlIGV4dGVybmFsIFVTQjIgcG9ydHMsIHRoZSBwb3J0IGVu
YWJsZSBnb2luZyB0byB0aGUgVkJVUyBsb2FkIHN3aXRjaCBpcyBjb250cm9sbGVkIGRpcmVjdGx5
IHRoZSBVU0IzNTAzICh3aGljaCBoYXMgYW4gaW50ZXJuYWwgbWVjaGFuaXNtLCBjb25maWd1cmVk
IGJ5IGRlZmF1bHQgYXMgYW4gYXV0b21hdGljIGNvbnRyb2wgb2Ygb3ZlcmN1cnJlbnQgcHJvdGVj
dGlvbiwgaXQgY2FuIGJlIGJ5cGFzcyBieSB1c2luZyB0aGUgVVNCMzUwMyBJMkMgcmVnaXN0ZXJz
KS48L2Rpdj4NCg0KPGRpdj48YnI+PC9kaXY+PGRpdj7CoDwvZGl2PjxibG9ja3F1b3RlIGNsYXNz
PSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVm
dC13aWR0aDoxcHg7Ym9yZGVyLWxlZnQtY29sb3I6cmdiKDIwNCwyMDQsMjA0KTtib3JkZXItbGVm
dC1zdHlsZTpzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij4NCjxicj4NClRoaXMgd2lsbCB0YWtlIG1v
cmUgdGltZSB0aGFuIEkgaGF2ZSByaWdodCBub3cgdG8gdHJhY2sgZG93bi4gwqBJIGFkZGVkPGJy
Pg0KSnVsaXVzIHRvIHRoZSB0aHJlYWQgaW4gY2FzZSBoZSBoYXMgdGltZSB0byBhbnN3ZXIgYW5k
IGNhbiBzdWdnZXN0PGJyPg0Kd2hhdCB0byBkbyBmb3IgdXBzdHJlYW0gcHVycG9zZXMuIMKgSSBt
YXkgYmUgYWJsZSB0byBsb29rIG1vcmU8YnI+DQp0b21vcnJvdy48YnI+DQo8YnI+DQpZb3UgY2Fu
IGFsd2F5cyBzZW5kIHVwIHRoZSBuZXh0IHZlcnNpb24gYW5kIGluY2x1ZGUgdGhpcyBhbmQgd2Um
IzM5O2xsPGJyPg0KbG9vayBhdCBpdCBhZ2Fpbi48YnI+DQo8ZGl2PjxkaXYgY2xhc3M9Img1Ij48
YnI+DQo8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCB9Ozxicj4NCiZndDsmZ3Q7Jmd0OyAr
PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgdmJhdDogdmJhdC1maXhlZC1yZWd1bGF0b3Ig
ezxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGNvbXBhdGlibGUgPSAm
cXVvdDtyZWd1bGF0b3ItZml4ZWQmcXVvdDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgcmVndWxhdG9yLW5hbWUgPSAmcXVvdDt2YmF0LXN1cHBseSZxdW90Ozs8YnI+
DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCByZWd1bGF0b3ItYm9vdC1vbjs8
YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCB9Ozxicj4NCiZndDsmZ3Q7Jmd0OyArPGJyPg0K
Jmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgdXNiQDEyMDAwMDAwIHs8YnI+DQomZ3Q7Jmd0OyZndDsg
KyDCoCDCoCDCoCDCoCDCoCDCoCDCoCBzdGF0dXMgPSAmcXVvdDtva2F5JnF1b3Q7Ozxicj4NCiZn
dDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIH07PGJyPg0KJmd0OyZndDsmZ3Q7ICs8YnI+DQomZ3Q7Jmd0
OyZndDsgKyDCoCDCoCDCoCB1c2IzX3ZidXNfcmVnOiByZWd1bGF0b3ItdXNiMyB7PGJyPg0KJmd0
OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgY29tcGF0aWJsZSA9ICZxdW90O3JlZ3Vs
YXRvci1maXhlZCZxdW90Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDC
oCByZWd1bGF0b3ItbmFtZSA9ICZxdW90O1A1LjBWX1VTQjNDT04mcXVvdDs7PGJyPg0KJmd0OyZn
dDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSAm
bHQ7NTAwMDAwMCZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
cmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSAmbHQ7NTAwMDAwMCZndDs7PGJyPg0KJmd0OyZndDsm
Z3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZ3BpbyA9ICZsdDsmYW1wO2dwZTEgMCAxJmd0Ozs8
YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCBwaW5jdHJsLW5hbWVzID0g
JnF1b3Q7ZGVmYXVsdCZxdW90Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBwaW5jdHJsLTAgPSAmbHQ7JmFtcDtoc2ljX3Jlc2V0Jmd0Ozs8YnI+DQomZ3Q7Jmd0OyZn
dDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCBlbmFibGUtYWN0aXZlLWhpZ2g7PGJyPg0KJmd0OyZn
dDsmZ3Q7ICsgwqAgwqAgwqAgfTs8YnI+DQomZ3Q7Jmd0OyZndDsgKzxicj4NCiZndDsmZ3Q7Jmd0
OyArIMKgIMKgIMKgIHBoeUAxMjEwMDAwMCB7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgdmJ1cy1zdXBwbHkgPSAmbHQ7JmFtcDt1c2IzX3ZidXNfcmVnJmd0Ozs8YnI+
DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCB9Ozxicj4NCiZndDsmZ3Q7Jmd0OyArPGJyPg0KJmd0
OyZndDsmZ3Q7ICsgwqAgwqAgwqAgdXNiQDEyMTEwMDAwIHs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDC
oCDCoCDCoCDCoCDCoCDCoCDCoCBzYW1zdW5nLHZidXMtZ3BpbyA9ICZsdDsmYW1wO2dweDEgMSAw
Jmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCBzdGF0dXMgPSAm
cXVvdDtva2F5JnF1b3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIH07PGJyPg0KJmd0
OyZndDsmZ3Q7ICs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCB1c2JAMTIxMjAwMDAgezxi
cj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHN0YXR1cyA9ICZxdW90O29r
YXkmcXVvdDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgfTs8YnI+DQomZ3Q7Jmd0OyZn
dDsgKzxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIG1tY0AxMjIyMDAwMCB7PGJyPg0KJmd0
OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLyogTU1DMiBwaW5zIGFyZSB1c2VkIGFz
IEdQSU8gZm9yIGVEUCBicmlkZ2UgY29udHJvbC4gKi88YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDC
oCDCoCDCoCDCoCDCoCDCoCBzdGF0dXMgPSAmcXVvdDtkaXNhYmxlZCZxdW90Ozs8YnI+DQomZ3Q7
Jmd0OyZndDsgKyDCoCDCoCDCoCB9Ozxicj4NCiZndDsmZ3Q7Jmd0OyArPGJyPg0KJmd0OyZndDsm
Z3Q7ICsgwqAgwqAgwqAgbW1jQDEyMjMwMDAwIHs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDC
oCDCoCDCoCDCoCDCoCBzdGF0dXMgPSAmcXVvdDtkaXNhYmxlZCZxdW90Ozs8YnI+DQomZ3Q7Jmd0
OyZndDsgKyDCoCDCoCDCoCB9Ozxicj4NCiZndDsmZ3Q7Jmd0OyArPGJyPg0KJmd0OyZndDsmZ3Q7
ICsgwqAgwqAgwqAgaTJjQDEyQzYwMDAwIHs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDC
oCDCoCDCoCDCoCBtYXg3NzY4NkAwOSB7PGJyPg0KJmd0OyZndDs8YnI+DQomZ3Q7Jmd0OyBUaGVy
ZSBpcyBubyBtYXg3NzY4NiBvbiBzcHJpbmcuIMKgSXQgdXNlcyBzNW04NzY3IGluIHRoZSBwbGFj
ZSBvZiBtYXg3NzY4Ni48YnI+DQomZ3Q7Jmd0Ozxicj4NCiZndDsmZ3Q7IC4uLnlvdSYjMzk7dmUg
Z290ICZxdW90O3N0YXR1cyA9IGRpc2FibGVkJnF1b3Q7LCBqdXN0IHJlbW92ZSBpdC48YnI+DQom
Z3Q7PGJyPg0KJmd0OyBUaGF0JiMzOTtzIGJlY2F1c2UgaXQmIzM5O3MgaW5oZXJpdGVkIGZyb20g
ZXh5bm9zNTI1MC1jcm9zLWNvbW1vbi5kdHNpLjxicj4NCjxicj4NCjwvZGl2PjwvZGl2PkFoLCBy
aWdodC4gwqBTbyBpZiB3ZSYjMzk7cmUga2VlcGluZyBjcm9zLWNvbW1vbiB0aGUgcHJvcGVyIHRo
aW5nIHRvIGRvIGlzPGJyPg0KdG8gbW92ZSBpdCBvdXQgb2YgY3Jvcy1jb21tb24gaW4gYSBwYXRj
aCBiZWZvcmUgdGhpcyBvbmUuIMKgLi4uYnV0IEk8YnI+DQp0aGluayBwZW9wbGUgbWlnaHQgYmUg
aGFwcGllciBpZiB5b3Ugc2ltcGx5IGRvbiYjMzk7dCBpbmNsdWRlIGNyb3MtY29tbW9uLjxicj4N
CjxkaXYgY2xhc3M9IiI+PGJyPg0KPGJyPg0KJmd0OyBUaGUgcnRjIHRoYXQgdGhlIHN5c3RlbSBz
dWNjZXNzZnVsbHkgdXNlcyBpcyAmcXVvdDtzNW0tcnRjJnF1b3Q7LCB3aGljaCBJIGd1ZXNzIGlz
PGJyPg0KJmd0OyBvbiB0aGUgczVtODc2NyB0aGVuPyAoQ29uZnVzaW5nIHRoYXQgMy44IFNwcmlu
ZyBoYWQgdGhpcyBydGMgbm9kZTxicj4NCiZndDsgZGVzcGl0ZSBTbm93JiMzOTtzIG1heDc3Njg2
IG5vdCBoYXZpbmcgaXQuKTxicj4NCjxicj4NCjwvZGl2PkkgdGhpbmsgaXQmIzM5O3Mgbm90IHJl
YWxseSBzdXBwb3NlZCB0by4gwqBJdCB3YXMgYSBiaXQgb2YgYSBoYWNrIHRvIGhhbmRsZTxicj4N
CnRoZSBmYWN0IHRoYXQgdGhlIFJUQyBoYXMgdHdvIGRpZmZlcmVudCBpMmMgYWRkcmVzc2VzIG9u
IGJvdGggdGhlPGJyPg0KNzc2ODYgYW5kIHRoaXMgUE1JQy4gwqBUaGUgbWF4Nzc2ODYgZHJpdmVy
IHVwc3RyZWFtIGhhbmRsZXMgaXQgYWxsIGluPGJyPg0KY29kZSBhbmQgZG9lc24mIzM5O3QgYXNr
IHRoZSBkZXZpY2UgdHJlZSB0byBsaXN0IGJvdGggYWRkcmVzc2VzLjxicj4NCjxicj4NCkkgdGhp
bmsgdGhhdCBfdXBzdHJlYW1fIHNub3cgZG9lc24mIzM5O3QgaGF2ZSB0aGUgbm9kZSBidXQgX2Rv
d25zdHJlYW1fPGJyPg0Kc3ByaW5nIG1pZ2h0IGhhdmUgdGhlIG5vZGUgKHRob3VnaCBoYXZpbmcg
YSBjaGlsZCBvZiBhIGRpc2FibGVkIG5vZGU8YnI+DQppc24mIzM5O3QgcGFydGljdWxhcmx5IHVz
ZWZ1bCkuPGJyPg0KPGRpdj48ZGl2IGNsYXNzPSJoNSI+PGJyPg0KPGJyPg0KJmd0OyZndDsmZ3Q7
ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgI2FkZHJlc3MtY2VsbHMgPSAmbHQ7
MSZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgI3NpemUtY2VsbHMgPSAmbHQ7MCZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgc3RhdHVzID0gJnF1b3Q7ZGlzYWJsZWQmcXVvdDs7PGJy
Pg0KJmd0OyZndDsmZ3Q7ICs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCBydGMgezxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJlZyA9ICZsdDsweDYmZ3Q7Ozxicj4NCiZndDsm
Z3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH07PGJyPg0KJmd0OyZn
dDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfTs8YnI+DQomZ3Q7Jmd0OyZndDsgKzxicj4N
CiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHM1bTg3NjdfcG1pY0A2NiB7PGJy
Pg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgY29tcGF0
aWJsZSA9ICZxdW90O3NhbXN1bmcsczVtODc2Ny1wbWljJnF1b3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0
OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJlZyA9ICZsdDsweDY2Jmd0Ozs8
YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpbnRl
cnJ1cHQtcGFyZW50ID0gJmx0OyZhbXA7Z3B4MyZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaW50ZXJydXB0cyA9ICZsdDsyIDAmZ3Q7Ozxi
cj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHBpbmN0
cmwtbmFtZXMgPSAmcXVvdDtkZWZhdWx0JnF1b3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHBpbmN0cmwtMCA9ICZsdDsmYW1wO3M1bTg3Njdf
aXJxICZhbXA7czVtODc2N19kdnMgJmFtcDtzNW04NzY3X2RzJmd0Ozs8YnI+DQomZ3Q7Jmd0OyZn
dDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB3YWtldXAtc291cmNlOzxicj4N
CiZndDsmZ3Q7Jmd0OyArPGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgczVtODc2NyxwbWljLWJ1Y2stZHZzLWdwaW9zID0gJmx0OyZhbXA7Z3BkMSAw
IDEmZ3Q7LCAvKiBEVlMxICovPGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgJmx0OyZhbXA7Z3BkMSAxIDEmZ3Q7LCAvKiBEVlMyICovPGJyPg0KJmd0OyZndDsmZ3Q7ICsg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmx0OyZhbXA7Z3BkMSAyIDEmZ3Q7OyAvKiBEVlMzICovPGJy
Pg0KJmd0OyZndDsmZ3Q7ICs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCBzNW04NzY3LHBtaWMtYnVjay1kcy1ncGlvcyA9ICZsdDsmYW1wO2dweDIg
MyAxJmd0OywgLyogU0VUMSAqLzxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgJmx0OyZhbXA7Z3B4MiA0IDEmZ3Q7LCAvKiBTRVQyICovPGJyPg0KJmd0OyZndDsmZ3Q7ICsg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7JmFtcDtncHgyIDUgMSZndDs7IC8qIFNFVDMgKi88YnI+
DQomZ3Q7Jmd0Ozxicj4NCiZndDsmZ3Q7IFRoZSBmaW5hbCAmcXVvdDsxJnF1b3Q7IGluIGVhY2gg
b2YgdGhlIEdQSU8gc3BlY2lmaWVycyBhYm92ZSBzaG91bGQgYmUgR1BJT19BQ1RJVkVfTE9XLjxi
cj4NCiZndDsmZ3Q7PGJyPg0KJmd0OyZndDs8YnI+DQomZ3Q7Jmd0OyZndDsgKzxicj4NCiZndDsm
Z3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC8qPGJyPg0KJmd0OyZn
dDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAqIFRoZSBmb2xsb3dp
bmcgYXJyYXlzIG9mIERWUyB2b2x0YWdlcyBhcmUgbm90IHVzZWQsIHNpbmNlIHdlIGFyZTxicj4N
CiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKiBub3Qg
dXNpbmcgR1BJT3MgdG8gY29udHJvbCBQTUlDIGJ1Y2tzLCBidXQgdGhleSBtdXN0IGJlIGRlZmlu
ZWQ8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCogdG8gcGxlYXNlIHRoZSBkcml2ZXIuPGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAqLzxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIHM1bTg3NjcscG1pYy1idWNrMi1kdnMtdm9sdGFnZSA9ICZs
dDsxMzUwMDAwJmd0OywgJmx0OzEzMDAwMDAmZ3Q7LDxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgJmx0OzEyNTAwMDAmZ3Q7LCAmbHQ7MTIwMDAwMCZndDssPGJy
Pg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7MTE1MDAwMCZn
dDssICZsdDsxMTAwMDAwJmd0Oyw8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCZsdDsxMDAwMDAwJmd0OywgJmx0Ozk1MDAwMCZndDs7PGJyPg0KJmd0OyZndDsm
Z3Q7ICs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCBzNW04NzY3LHBtaWMtYnVjazMtZHZzLXZvbHRhZ2UgPSAmbHQ7MTEwMDAwMCZndDssICZsdDsx
MTAwMDAwJmd0Oyw8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCZsdDsxMTAwMDAwJmd0OywgJmx0OzExMDAwMDAmZ3Q7LDxicj4NCiZndDsmZ3Q7Jmd0OyArIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmx0OzEwMDAwMDAmZ3Q7LCAmbHQ7MTAwMDAwMCZndDss
PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7MTAwMDAw
MCZndDssICZsdDsxMDAwMDAwJmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgKzxicj4NCiZndDsmZ3Q7
Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHM1bTg3NjcscG1pYy1idWNr
NC1kdnMtdm9sdGFnZSA9ICZsdDsxMjAwMDAwJmd0OywgJmx0OzEyMDAwMDAmZ3Q7LDxicj4NCiZn
dDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmx0OzEyMDAwMDAmZ3Q7LCAm
bHQ7MTIwMDAwMCZndDssPGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAmbHQ7MTIwMDAwMCZndDssICZsdDsxMjAwMDAwJmd0Oyw8YnI+DQomZ3Q7Jmd0OyZndDsg
KyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDsxMjAwMDAwJmd0OywgJmx0OzEyMDAwMDAm
Z3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArPGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgY2xvY2tzIHs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBjb21wYXRpYmxlID0gJnF1b3Q7
c2Ftc3VuZyxzNW04NzY3LWNsayZxdW90Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAjY2xvY2stY2VsbHMgPSAmbHQ7MSZn
dDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgY2xvY2stb3V0cHV0LW5hbWVzID0gJnF1b3Q7ZW4zMmtoel9hcCZxdW90Oyw8
YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZxdW90O2VuMzJraHpfY3Am
cXVvdDssPGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmcXVvdDtlbjMy
a2h6X2J0JnF1b3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIH07PGJyPg0KJmd0OyZndDsmZ3Q7ICs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCByZWd1bGF0b3JzIHs8YnI+DQomZ3Q7Jmd0OyZn
dDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBzNW1fbGRv
NF9yZWc6IExETzQgezxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJlZ3VsYXRvci1uYW1lID0gJnF1b3Q7
UDEuMFZfTERPX09VVDQmcXVvdDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVndWxhdG9yLW1pbi1t
aWNyb3ZvbHQgPSAmbHQ7MTAwMDAwMCZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVndWxhdG9y
LW1heC1taWNyb3ZvbHQgPSAmbHQ7MTAwMDAwMCZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVn
dWxhdG9yLWFsd2F5cy1vbjs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBvcF9tb2RlID0gJmx0OzAmZ3Q7
Ozxicj4NCiZndDsmZ3Q7PGJyPg0KJmd0OyZndDsgSSB0aGluayB0aGF0ICZxdW90O29wX21vZGUm
cXVvdDsgaGVyZSBpcyBxdWVzdGlvbmFibGUuIMKgQWRkaW5nIEphdmllciB0byB0aGU8YnI+DQom
Z3Q7Jmd0OyB0aHJlYWQgd2hvIHdhcyBsb29raW5nIGF0IHRoaXMgZm9yIG1heDc3ODAyIGFuZCBw
b3NzaWJseSBtYXg3NzY4Ni48YnI+DQomZ3Q7PGJyPg0KJmd0OyBDb25maXJtaW5nIHRoYXQgdGhp
cyBvcF9tb2RlIGlzIHByZXNlbnQgaW4gdGhlIG9yaWdpbmFsIDMuOCBkZXZpY2UgdHJlZS48YnI+
DQo8YnI+DQo8L2Rpdj48L2Rpdj5ZZXMgYW5kIGl0IG5lZWRzIHRvIGJlIGhhbmRsZWQgZXZlbnR1
YWxseS4gwqBJdCBtYWtlcyBzdXNwZW5kL3Jlc3VtZTxicj4NCndvcmsgcHJvcGVybHkuIMKgLi4u
YnV0IEkgdGhpbmsgaXQgbmVlZHMgdG8gYmUgdGhvdWdodCBvdXQgYmV0dGVyLjxicj4NCjxicj4N
Ci4uLmJ1dCBnaXZlbiB0aGF0IG90aGVyIHVzZXJzIG9mIHRoaXMgUE1JQyBoYXZlIGl0IEkgZ3Vl
c3MgaXQgbWFrZXM8YnI+DQpzZW5zZSB0byBsZWF2ZSBpdCBpbi4gwqBKYXZpZXIgd2FzIGdvaW5n
IHRvIHRyeSB0byB0aGluayBpdCB0aHJvdWdoPGJyPg0KYmV0dGVyIGZvciBtYXg3NzY4NiBhbmQg
bWF4Nzc4MDIuPGJyPg0KPGRpdj48ZGl2IGNsYXNzPSJoNSI+PGJyPg0KPGJyPg0KJmd0OyAoSSB1
c2VkIGR0YyB0byBjb21waWxlIG15IC9wcm9jL2RldmljZS10cmVlIHRhcmJhbGwgYmFjayB0byAu
ZHRzLCBzbyBpdDxicj4NCiZndDsgaGFzIGhleGFkZWNpbWFsICZsdDsweDAmZ3Q7IGJ1dCB0aGF0
IHNob3VsZG4mIzM5O3QgbWF0dGVyIHRvIGR0YyBBRkFJVS4pPGJyPg0KJmd0Ozxicj4NCiZndDsm
Z3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH07
PGJyPg0KJmd0OyZndDsmZ3Q7ICs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBzNW1fbGRvNV9yZWc6IExETzUgezxicj4NCiZn
dDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIHJlZ3VsYXRvci1uYW1lID0gJnF1b3Q7UDEuMFZfTERPX09VVDUmcXVvdDs7
PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSAmbHQ7MTAwMDAw
MCZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSAmbHQ7
MTAwMDAwMCZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVndWxhdG9yLWFsd2F5cy1vbjs8YnI+
DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCBvcF9tb2RlID0gJmx0OzAmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyAr
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH07PGJyPg0KJmd0
OyZndDsmZ3Q7ICs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCBzNW1fbGRvNl9yZWc6IExETzYgezxicj4NCiZndDsmZ3Q7Jmd0
OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIHJlZ3VsYXRvci1uYW1lID0gJnF1b3Q7dmRkX215ZHAmcXVvdDs7PGJyPg0KJmd0OyZndDsm
Z3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSAmbHQ7MTAwMDAwMCZndDs7PGJyPg0KJmd0
OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSAmbHQ7MTAwMDAwMCZndDs7PGJy
Pg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgcmVndWxhdG9yLWFsd2F5cy1vbjs8YnI+DQomZ3Q7Jmd0OyZndDsg
KyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCBvcF9tb2RlID0gJmx0OzMmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH07PGJyPg0KJmd0OyZndDsmZ3Q7ICs8YnI+
DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBzNW1fbGRvN19yZWc6IExETzcgezxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJlZ3VsYXRvci1u
YW1lID0gJnF1b3Q7UDEuMVZfTERPX09VVDcmcXVvdDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVn
dWxhdG9yLW1pbi1taWNyb3ZvbHQgPSAmbHQ7MTEwMDAwMCZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7
ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSAmbHQ7MTEwMDAwMCZndDs7PGJyPg0KJmd0OyZn
dDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgcmVndWxhdG9yLWFsd2F5cy1vbjs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBvcF9tb2Rl
ID0gJmx0OzMmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIH07PGJyPg0KJmd0OyZndDsmZ3Q7ICs8YnI+DQomZ3Q7Jmd0
OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBzNW1f
bGRvOF9yZWc6IExETzggezxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJlZ3VsYXRvci1uYW1lID0gJnF1
b3Q7UDEuMFZfTERPX09VVDgmcXVvdDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVndWxhdG9yLW1p
bi1taWNyb3ZvbHQgPSAmbHQ7MTAwMDAwMCZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVndWxh
dG9yLW1heC1taWNyb3ZvbHQgPSAmbHQ7MTAwMDAwMCZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICsg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
cmVndWxhdG9yLWFsd2F5cy1vbjs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBvcF9tb2RlID0gJmx0OzMm
Z3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIH07PGJyPg0KJmd0OyZndDsmZ3Q7ICs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBzNW1fbGRvMTBfcmVn
OiBMRE8xMCB7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVndWxhdG9yLW5hbWUgPSAmcXVvdDtQMS44
Vl9MRE9fT1VUMTAmcXVvdDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVndWxhdG9yLW1pbi1taWNy
b3ZvbHQgPSAmbHQ7MTgwMDAwMCZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVndWxhdG9yLW1h
eC1taWNyb3ZvbHQgPSAmbHQ7MTgwMDAwMCZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVndWxh
dG9yLWFsd2F5cy1vbjs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBvcF9tb2RlID0gJmx0OzMmZ3Q7Ozxi
cj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIH07PGJyPg0KJmd0OyZndDsmZ3Q7ICs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBzNW1fbGRvMTFfcmVnOiBMRE8x
MSB7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVndWxhdG9yLW5hbWUgPSAmcXVvdDtQMS44Vl9MRE9f
T1VUMTEmcXVvdDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQg
PSAmbHQ7MTgwMDAwMCZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVndWxhdG9yLW1heC1taWNy
b3ZvbHQgPSAmbHQ7MTgwMDAwMCZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVndWxhdG9yLWFs
d2F5cy1vbjs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBvcF9tb2RlID0gJmx0OzAmZ3Q7Ozxicj4NCiZn
dDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IH07PGJyPg0KJmd0OyZndDsmZ3Q7ICs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBzNW1fbGRvMTJfcmVnOiBMRE8xMiB7PGJy
Pg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgcmVndWxhdG9yLW5hbWUgPSAmcXVvdDtQMy4wVl9MRE9fT1VUMTIm
cXVvdDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSAmbHQ7
MzAwMDAwMCZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVndWxhdG9yLW1heC1taWNyb3ZvbHQg
PSAmbHQ7MzAwMDAwMCZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVndWxhdG9yLWFsd2F5cy1v
bjs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBvcF9tb2RlID0gJmx0OzMmZ3Q7Ozxicj4NCiZndDsmZ3Q7
Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH07PGJy
Pg0KJmd0OyZndDsmZ3Q7ICs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBzNW1fbGRvMTNfcmVnOiBMRE8xMyB7PGJyPg0KJmd0
OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgcmVndWxhdG9yLW5hbWUgPSAmcXVvdDtQMS44Vl9MRE9fT1VUMTMmcXVvdDs7
PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSAmbHQ7MTgwMDAw
MCZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSAmbHQ7
MTgwMDAwMCZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVndWxhdG9yLWFsd2F5cy1vbjs8YnI+
DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCBvcF9tb2RlID0gJmx0OzAmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyAr
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH07PGJyPg0KJmd0
OyZndDsmZ3Q7ICs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCBzNW1fbGRvMTRfcmVnOiBMRE8xNCB7PGJyPg0KJmd0OyZndDsm
Z3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgcmVndWxhdG9yLW5hbWUgPSAmcXVvdDtQMS44Vl9MRE9fT1VUMTQmcXVvdDs7PGJyPg0K
Jmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSAmbHQ7MTgwMDAwMCZndDs7
PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSAmbHQ7MTgwMDAw
MCZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVndWxhdG9yLWFsd2F5cy1vbjs8YnI+DQomZ3Q7
Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCBvcF9tb2RlID0gJmx0OzMmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH07PGJyPg0KJmd0OyZndDsm
Z3Q7ICs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCBzNW1fbGRvMTVfcmVnOiBMRE8xNSB7PGJyPg0KJmd0OyZndDsmZ3Q7ICsg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
cmVndWxhdG9yLW5hbWUgPSAmcXVvdDtQMS4wVl9MRE9fT1VUMTUmcXVvdDs7PGJyPg0KJmd0OyZn
dDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSAmbHQ7MTAwMDAwMCZndDs7PGJyPg0K
Jmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSAmbHQ7MTAwMDAwMCZndDs7
PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVndWxhdG9yLWFsd2F5cy1vbjs8YnI+DQomZ3Q7Jmd0OyZn
dDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBvcF9tb2RlID0gJmx0OzMmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH07PGJyPg0KJmd0OyZndDsmZ3Q7ICs8
YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCBzNW1fbGRvMTZfcmVnOiBMRE8xNiB7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVndWxh
dG9yLW5hbWUgPSAmcXVvdDtQMS44Vl9MRE9fT1VUMTYmcXVvdDs7PGJyPg0KJmd0OyZndDsmZ3Q7
ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSAmbHQ7MTgwMDAwMCZndDs7PGJyPg0KJmd0OyZn
dDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSAmbHQ7MTgwMDAwMCZndDs7PGJyPg0K
Jmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgcmVndWxhdG9yLWFsd2F5cy1vbjs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBv
cF9tb2RlID0gJmx0OzMmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH07PGJyPg0KJmd0OyZndDsmZ3Q7ICs8YnI+DQom
Z3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCBzNW1fbGRvMTdfcmVnOiBMRE8xNyB7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVndWxhdG9yLW5h
bWUgPSAmcXVvdDtQMi44Vl9MRE9fT1VUMTcmcXVvdDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVn
dWxhdG9yLW1pbi1taWNyb3ZvbHQgPSAmbHQ7MjgwMDAwMCZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7
ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSAmbHQ7MjgwMDAwMCZndDs7PGJyPg0KJmd0OyZn
dDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgcmVndWxhdG9yLWFsd2F5cy1vbjs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBvcF9tb2Rl
ID0gJmx0OzAmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIH07PGJyPg0KJmd0OyZndDsmZ3Q7ICs8YnI+DQomZ3Q7Jmd0
OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBzNW1f
bGRvMjVfcmVnOiBMRE8yNSB7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVndWxhdG9yLW5hbWUgPSAm
cXVvdDt2ZGRfYnJpZGdlJnF1b3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJlZ3VsYXRvci1taW4t
bWljcm92b2x0ID0gJmx0OzEyMDAwMDAmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJlZ3VsYXRv
ci1tYXgtbWljcm92b2x0ID0gJmx0OzEyMDAwMDAmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJl
Z3VsYXRvci1hbHdheXMtb247PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgb3BfbW9kZSA9ICZsdDsxJmd0
Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCB9Ozxicj4NCiZndDsmZ3Q7Jmd0OyArPGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgQlVDSzEgezxicj4NCiZn
dDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIHJlZ3VsYXRvci1uYW1lID0gJnF1b3Q7dmRkX21pZiZxdW90Ozs8YnI+DQom
Z3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCByZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9ICZsdDs5NTAwMDAmZ3Q7Ozxi
cj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIHJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gJmx0OzEzMDAwMDAm
Z3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJlZ3VsYXRvci1hbHdheXMtb247PGJyPg0KJmd0OyZn
dDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgcmVndWxhdG9yLWJvb3Qtb247PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgb3BfbW9kZSA9
ICZsdDszJmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCB9Ozxicj4NCiZndDsmZ3Q7Jmd0OyArPGJyPg0KJmd0OyZndDsm
Z3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgQlVDSzIg
ezxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJlZ3VsYXRvci1uYW1lID0gJnF1b3Q7dmRkX2FybSZxdW90
Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCByZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9ICZsdDs4NTAw
MDAmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gJmx0
OzEzNTAwMDAmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJlZ3VsYXRvci1hbHdheXMtb247PGJy
Pg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgcmVndWxhdG9yLWJvb3Qtb247PGJyPg0KJmd0OyZndDsmZ3Q7ICsg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
b3BfbW9kZSA9ICZsdDszJmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB9Ozxicj4NCiZndDsmZ3Q7Jmd0OyArPGJyPg0K
Jmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgQlVDSzMgezxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJlZ3VsYXRvci1uYW1lID0gJnF1b3Q7dmRk
X2ludCZxdW90Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCByZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9
ICZsdDs5MDAwMDAmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJlZ3VsYXRvci1tYXgtbWljcm92
b2x0ID0gJmx0OzEyMDAwMDAmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJlZ3VsYXRvci1hbHdh
eXMtb247PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVndWxhdG9yLWJvb3Qtb247PGJyPg0KJmd0OyZn
dDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgb3BfbW9kZSA9ICZsdDszJmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB9Ozxicj4NCiZndDsmZ3Q7Jmd0
OyArPGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgQlVDSzQgezxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJlZ3VsYXRvci1uYW1lID0g
JnF1b3Q7dmRkX2czZCZxdW90Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCByZWd1bGF0b3ItbWluLW1p
Y3Jvdm9sdCA9ICZsdDs4NTAwMDAmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJlZ3VsYXRvci1t
YXgtbWljcm92b2x0ID0gJmx0OzEzMDAwMDAmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJlZ3Vs
YXRvci1ib290LW9uOzxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIG9wX21vZGUgPSAmbHQ7MyZndDs7PGJy
Pg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgfTs8YnI+DQomZ3Q7Jmd0OyZndDsgKzxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIEJVQ0s1IHs8YnI+DQomZ3Q7Jmd0
OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCByZWd1bGF0b3ItbmFtZSA9ICZxdW90O1AxLjhWX0JVQ0tfT1VUNSZxdW90Ozs8YnI+
DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCByZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9ICZsdDsxODAwMDAwJmd0
Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCByZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9ICZsdDsxODAw
MDAwJmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCByZWd1bGF0b3ItYWx3YXlzLW9uOzxicj4NCiZn
dDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIHJlZ3VsYXRvci1ib290LW9uOzxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIG9wX21v
ZGUgPSAmbHQ7MSZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfTs8YnI+DQomZ3Q7Jmd0OyZndDsgKzxicj4NCiZndDsm
Z3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIEJV
Q0s2IHs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCByZWd1bGF0b3ItbmFtZSA9ICZxdW90O1AxLjJWX0JV
Q0tfT1VUNiZxdW90Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCByZWd1bGF0b3ItbWluLW1pY3Jvdm9s
dCA9ICZsdDsxMjAwMDAwJmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCByZWd1bGF0b3ItbWF4LW1p
Y3Jvdm9sdCA9ICZsdDsxMjAwMDAwJmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCByZWd1bGF0b3It
YWx3YXlzLW9uOzxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJlZ3VsYXRvci1ib290Jmd0Ozxicj4NCiZn
dDsmZ3Q7PGJyPg0KJmd0OyAtb247PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgb3BfbW9kZSA9ICZsdDsw
Jmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCB9Ozxicj4NCiZndDsmZ3Q7Jmd0OyArPGJyPg0KJmd0OyZndDsmZ3Q7ICsg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgQlVDSzkgezxicj4N
CiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIHJlZ3VsYXRvci1uYW1lID0gJnF1b3Q7dmRkX3VtbWMmcXVvdDs7PGJy
Pg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSAmbHQ7OTUwMDAwJmd0
Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCByZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9ICZsdDszMDAw
MDAwJmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCByZWd1bGF0b3ItYWx3YXlzLW9uOzxicj4NCiZn
dDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIHJlZ3VsYXRvci1ib290LW9uOzxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIG9wX21v
ZGUgPSAmbHQ7MyZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfTs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB9Ozxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIH07PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgfTs8YnI+DQomZ3Q7Jmd0
OyZndDsgKzxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIGkyY0AxMkM3MDAwMCB7PGJyPg0K
Jmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgdHJhY2twYWQgezxicj4NCiZndDsm
Z3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHN0YXR1cyA9ICZxdW90
O2Rpc2FibGVkJnF1b3Q7Ozxicj4NCiZndDsmZ3Q7PGJyPg0KJmd0OyZndDsgSGF2aW5nIHRoaXMg
Ym9ndXMgZW50cnkgaGVyZSBkb2VzbiYjMzk7dCBhZGQgYW55dGhpbmcuIMKgUmVtb3ZlIGl0IHVu
dGlsPGJyPg0KJmd0OyZndDsgdGhlIHRyYWNrcGFkIHNob3VsZCBiZSBhZGRlZC4gwqBTZWUgPGEg
aHJlZj0iaHR0cDovL2NyYnVnLmNvbS8zNzExMTQiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vY3Ji
dWcuY29tLzM3MTExNDwvYT4gZm9yIGE8YnI+DQomZ3Q7Jmd0OyBzbGlnaHRseSBzdGFsZSBidWcg
YWJvdXQgdHJhY2twYWQuPGJyPg0KJmd0Ozxicj4NCiZndDsgWW91IG1pc3VuZGVyc3RhbmQ6IFRo
aXMgcmVzb2x2ZXMgYW4gZXJyb3IgYWJvdXQgdGhlIGN5cHJlc3MsY3lhcGE8YnI+DQomZ3Q7IGlu
aGVyaXRlZCBmcm9tIC1jcm9zLWNvbW1vbi5kdHNpLiBTcHJpbmcgdXNlcyBhIGRpZmZlcmVudCBk
ZXZpY2UgYW5kIHR3bzxicj4NCiZndDsgZGlmZmVyZW50IEkyQyBhZGRyZXNzZXMuPGJyPg0KPGJy
Pg0KPC9kaXY+PC9kaXY+QWgsIHJpZ2h0LiDCoEkgZm9yZ290IGFib3V0IGNyb3M1MjUwLWNvbW1v
bi48YnI+DQo8ZGl2IGNsYXNzPSIiPjxicj4NCjxicj4NCiZndDsgTm9kZXMgbmFtZWQgdHJhY2tw
YWQtYm9vdGxvYWRlciBhbmQgdHJhY2twYWQtYWx0IGFyZSBwcmVwYXJlZCBoZXJlOjxicj4NCiZn
dDsgPGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL2FmYWVyYmVyL2xpbnV4L2NvbW1pdHMvc3By
aW5nLW5leHQiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2dpdGh1Yi5jb20vYWZhZXJiZXIvbGlu
dXgvY29tbWl0cy9zcHJpbmctbmV4dDwvYT48YnI+DQo8YnI+DQo8L2Rpdj5JdCBtaWdodCB3b3Jr
LCBidXQgeW91IHJ1biBpbnRvIHBpbmN0cmwgcHJvYmxlbXMuIMKgWW91IG5lZWQgdG8gcHV0IHRo
ZTxicj4NCnBpbmN0cmwgbm9kZSBfc29tZXdoZXJlXyBhbmQgaWYgeW91IHB1dCBpdCB3aXRoIHRo
ZSB0cmFja3BhZCBlbnRyaWVzPGJyPg0KdGhlbXNlbHZlcyB0aGVuIHlvdSBnZXQgY29uZmxpY3Rz
LiDCoC4uLmFuZCBpdCBkb2VzbiYjMzk7dCBiZWxvbmcgaW4gdGhlPGJyPg0KaTJjIGJ1cyAodGhv
dWdoIHRoYXQmIzM5O3Mgd2hhdCB3ZSBoYXZlIGxvY2FsbHkgaW4gb3VyIHRyZWUpPGJyPg0KPGJy
Pg0KU2VlICZsdDs8YSBocmVmPSJodHRwOi8vcGVybWFsaW5rLmdtYW5lLm9yZy9nbWFuZS5saW51
eC5rZXJuZWwuc2Ftc3VuZy1zb2MvMzA5NTMiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vcGVybWFs
aW5rLmdtYW5lLm9yZy9nbWFuZS5saW51eC5rZXJuZWwuc2Ftc3VuZy1zb2MvMzA5NTM8L2E+Jmd0
Ozxicj4NCmZvciBzb21lIGJhY2tncm91bmQuPGJyPg0KPGRpdiBjbGFzcz0iIj48YnI+DQo8YnI+
DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCB9Ozxicj4NCiZndDsmZ3Q7Jmd0
OyArIMKgIMKgIMKgIH07PGJyPg0KJmd0OyZndDsmZ3Q7ICs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDC
oCDCoCDCoCBpMmNAMTJDQTAwMDAgezxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIGVtYmVkZGVkLWNvbnRyb2xsZXIgezxicj4NCiZndDsmZ3Q7PGJyPg0KJmd0OyZndDsg
QWRkICZxdW90O2Nyb3NfZWMmcXVvdDsgYWxpYXMgbGlrZSBzbm93Ljxicj4NCiZndDsmZ3Q7PGJy
Pg0KJmd0OyZndDs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCBjb21wYXRpYmxlID0gJnF1b3Q7Z29vZ2xlLGNyb3MtZWMtaTJjJnF1b3Q7Ozxicj4N
CiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJlZyA9ICZs
dDsweDFlJmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCBpbnRlcnJ1cHRzID0gJmx0OzYgMCZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaW50ZXJydXB0LXBhcmVudCA9ICZsdDsmYW1w
O2dweDEmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIHdha2V1cC1zb3VyY2U7PGJyPg0KJmd0OyZndDsmZ3Q7ICs8YnI+DQomZ3Q7Jmd0OyZn
dDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBrZXlib2FyZC1jb250cm9sbGVy
IHs8YnI+DQomZ3Q7Jmd0Ozxicj4NCiZndDsmZ3Q7IERvbiYjMzk7dCBpbmNsdWRlIGtleWJvYXJk
LWNvbnRyb2xsZXIgaGVyZS4gwqBBZGQ6PGJyPg0KJmd0OyZndDs8YnI+DQomZ3Q7Jmd0OyAjaW5j
bHVkZSAmcXVvdDtjcm9zLWVjLWtleWJvYXJkLmR0c2kmcXVvdDs8YnI+DQomZ3Q7Jmd0Ozxicj4N
CiZndDsmZ3Q7IC4uLmF0IHRoZSBib3R0b20uIMKgTm90ZSB0aGF0IEkgdGhpbmsgdGhhdCB0aGUg
c3ByaW5nIEVDIGhhcyBhIHNwZWNpYWw8YnI+DQomZ3Q7Jmd0OyAmcXVvdDtjaGFyZ2VyJnF1b3Q7
IGtleSB0aGF0IGl0IHVzZXMgdG8gaW5kaWNhdGUgd2hlbiBhIGNoYXJnZXIgd2FzIHBsdWdnZWQg
aW48YnI+DQomZ3Q7Jmd0OyBhbmQgdW5wbHVnZ2VkLiDCoEkmIzM5O20gbm90IHN1cmUgaG93IHRo
YXQgd2lsbCBlbmQgdXAgZ2V0dGluZyBzdXBwb3J0ZWQ8YnI+DQomZ3Q7Jmd0OyB1cHN0cmVhbSBi
dXQgeW91IGNvdWxkIGp1c3QgbGVhdmUgaXQgb3V0IGZvciBub3cuPGJyPg0KJmd0Ozxicj4NCiZn
dDsgSXMgdGhlcmUgc3VjaCBhIHBlbmRpbmcgcGF0Y2ggZm9yIHNub3c/IFRoYXQmIzM5O3Mgd2hh
dCBJIG1vZGVsZWQgYWZ0ZXIuPGJyPg0KPGJyPg0KPC9kaXY+WWVhaCwgYW5kIGl0IGFwcGVhcnMg
dG8gYmUgaW4gbGludXgtbmV4dC4gwqAoMWEzOTVlMyBBUk06IGR0czogVXNlIHRoZTxicj4NCmNy
b3MtZWMta2V5Ym9hcmQgZnJhZ21lbnQgaW4gZXh5bm9zNTI1MC1zbm93KS4gwqBJdCBhY3R1YWxs
eSBlbmRlZCB1cDxicj4NCmdvaW5nIHRocm91Z2ggdGhlIHRlZ3JhIHRyZWUgc2luY2UgaXQgd2Fz
IGluIGEgc2VyaWVzIHdpdGggYSBzaW1pbGFyPGJyPg0KdGVncmEgY2hhbmdlLiDCoEkgYXNrZWQg
S3VramluIHRvIHBpY2sgaXQgdXAgdmlhIG1lcmdlIGJ1dCBoZSBkaWRuJiMzOTt0PGJyPg0KYXBw
ZWFyIHRvLjxicj4NCjxkaXYgY2xhc3M9IiI+PGJyPg0KPGJyPg0KJmd0OyBXaGVyZSBpcyBjcm9z
LWVjLWtleWJvYXJkLmR0c2k/IERvbiYjMzk7dCBzZWUgaXQgaW48YnI+DQomZ3Q7IDxhIGhyZWY9
Imh0dHA6Ly9naXQua2VybmVsLm9yZy9jZ2l0L2xpbnV4L2tlcm5lbC9naXQva2dlbmUvbGludXgt
c2Ftc3VuZy5naXQvdHJlZS9hcmNoL2FybS9ib290L2R0cz9oPWZvci1uZXh0IiB0YXJnZXQ9Il9i
bGFuayI+aHR0cDovL2dpdC5rZXJuZWwub3JnL2NnaXQvbGludXgva2VybmVsL2dpdC9rZ2VuZS9s
aW51eC1zYW1zdW5nLmdpdC90cmVlL2FyY2gvYXJtL2Jvb3QvZHRzP2g9Zm9yLW5leHQ8L2E+PGJy
Pg0KDQoNCiZndDsgb3I8YnI+DQomZ3Q7IDxhIGhyZWY9Imh0dHA6Ly9naXQua2VybmVsLm9yZy9j
Z2l0L2xpbnV4L2tlcm5lbC9naXQva2dlbmUvbGludXgtc2Ftc3VuZy5naXQvdHJlZS9pbmNsdWRl
L2R0LWJpbmRpbmdzP2g9Zm9yLW5leHQiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vZ2l0Lmtlcm5l
bC5vcmcvY2dpdC9saW51eC9rZXJuZWwvZ2l0L2tnZW5lL2xpbnV4LXNhbXN1bmcuZ2l0L3RyZWUv
aW5jbHVkZS9kdC1iaW5kaW5ncz9oPWZvci1uZXh0PC9hPjxicj4NCg0KDQomZ3Q7PGJyPg0KJmd0
OyBBcmUgeW91IHByb3Bvc2luZyBJIGZhY3RvciBpdCBvdXQ/PGJyPg0KJmd0Ozxicj4NCiZndDsm
Z3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGNv
bXBhdGlibGUgPSAmcXVvdDtnb29nbGUsY3Jvcy1lYy1rZXliJnF1b3Q7Ozxicj4NCiZndDsmZ3Q7
Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGtleXBh
ZCxudW0tcm93cyA9ICZsdDs4Jmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBrZXlwYWQsbnVtLWNvbHVtbnMgPSAmbHQ7
MTMmZ3Q7Ozxicj4NCiZndDsmZ3Q7PGJyPg0KJmd0OyZndDsgRG9uJiMzOTt0IHlvdSBuZWVkIHBp
bmN0cmwgaGVyZT88YnI+DQomZ3Q7PGJyPg0KJmd0OyBUaGUga2V5Ym9hcmQgaXMgdXNhYmxlOyB3
aGF0IHdvdWxkIHBpbmN0cmwgYmUgbmVlZGVkIGZvcj8gVGhlcmUmIzM5O3Mgbm9uZTxicj4NCiZn
dDsgaW4gdGhlIDMuOCBkZXZpY2UgdHJlZS48YnI+DQo8YnI+DQo8L2Rpdj5HZW5lcmFsbHkgaXQm
IzM5O3MgZ29vZCB0byBoYXZlIHRoZSBwaW5jdHJsIGxpc3RlZCB0byBjb25maWd1cmUgdGhlIElS
UTxicj4NCnByb3Blcmx5IChnZXQgdGhlIHB1bGxzIHJpZ2h0KS4gwqBJdCBtaWdodCB3b3JrIHdp
dGhvdXQgaXQgYnV0IGl0JiMzOTtzIGE8YnI+DQpsaXR0bGUgbGVzcyBpZGVhbCBJIHRoaW5rLjxi
cj4NCjxicj4NCkkgc2VlIHRoaXMsIHJpZ2h0Pzxicj4NCjxicj4NCsKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIHBpbmN0cmwtbmFtZXMgPSAmcXVvdDtkZWZhdWx0JnF1b3Q7Ozxi
cj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHBpbmN0cmwtMCA9ICZsdDsm
YW1wO2VjX2lycSZndDs7PGJyPg0KPGJyPg0KLi4uaW4gdGhlIGRvd25zdHJlYW0gJnF1b3Q7YXJj
aC9hcm0vYm9vdC9kdHMvZXh5bm9zNTI1MC1zcHJpbmcuZHRzJnF1b3Q7PGJyPg0KPGRpdj48ZGl2
IGNsYXNzPSJoNSI+PGJyPg0KPGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZ29vZ2xlLG5lZWRzLWdob3N0LWZpbHRlcjs8YnI+
DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBsaW51eCxrZXltYXAgPSAmbHQ7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgMHgwMDAxMDA3ZCDC
oCDCoCDCoC8qIExfTUVUQSAqLzxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDB4MDAwMjAwM2IgwqAgwqAg
wqAvKiBGMSAqLzxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDB4MDAwMzAwMzAgwqAgwqAgwqAvKiBCICov
PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgMHgwMDA0MDA0NCDCoCDCoCDCoC8qIEYxMCAqLzxicj4NCiZn
dDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIDB4MDAwNjAwMzEgwqAgwqAgwqAvKiBOICovPGJyPg0KJmd0OyZndDsmZ3Q7
ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgMHgwMDA4MDAwZCDCoCDCoCDCoC8qID0gKi88YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAweDAwMGEw
MDY0IMKgIMKgIMKgLyogUl9BTFQgKi88YnI+DQomZ3Q7Jmd0OyZndDsgKzxicj4NCiZndDsmZ3Q7
Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIDB4MDEwMTAwMDEgwqAgwqAgwqAvKiBFU0MgKi88YnI+DQomZ3Q7Jmd0OyZndDsgKyDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAw
eDAxMDIwMDNlIMKgIMKgIMKgLyogRjQgKi88YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAweDAxMDMwMDIy
IMKgIMKgIMKgLyogRyAqLzxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDB4MDEwNDAwNDEgwqAgwqAgwqAv
KiBGNyAqLzxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDB4MDEwNjAwMjMgwqAgwqAgwqAvKiBIICovPGJy
Pg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgMHgwMTA4MDAyOCDCoCDCoCDCoC8qICYjMzk7ICovPGJyPg0KJmd0
OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgMHgwMTA5MDA0MyDCoCDCoCDCoC8qIEY5ICovPGJyPg0KJmd0OyZndDsmZ3Q7
ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgMHgwMTBiMDAwZSDCoCDCoCDCoC8qIEJLU1BBQ0UgKi88YnI+DQomZ3Q7Jmd0OyZndDsgKzxi
cj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIDB4MDIwMDAwMWQgwqAgwqAgwqAvKiBMX0NUUkwgKi88YnI+DQom
Z3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCAweDAyMDEwMDBmIMKgIMKgIMKgLyogVEFCICovPGJyPg0KJmd0OyZndDsm
Z3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgMHgwMjAyMDAzZCDCoCDCoCDCoC8qIEYzICovPGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgMHgw
MjAzMDAxNCDCoCDCoCDCoC8qIFQgKi88YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAweDAyMDQwMDQwIMKg
IMKgIMKgLyogRjYgKi88YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAweDAyMDUwMDFiIMKgIMKgIMKgLyog
XSAqLzxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDB4MDIwNjAwMTUgwqAgwqAgwqAvKiBZICovPGJyPg0K
Jmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgMHgwMjA3MDA1NiDCoCDCoCDCoC8qIDEwMk5EICovPGJyPg0KJmd0OyZn
dDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgMHgwMjA4MDAxYSDCoCDCoCDCoC8qIFsgKi88YnI+DQomZ3Q7Jmd0OyZndDsgKyDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAw
eDAyMDkwMDQyIMKgIMKgIMKgLyogRjggKi88YnI+DQomZ3Q7Jmd0OyZndDsgKzxicj4NCiZndDsm
Z3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIDB4MDMwMTAwMjkgwqAgwqAgwqAvKiBHUkFWRSAqLzxicj4NCiZndDsmZ3Q7Jmd0
OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIDB4MDMwMjAwM2MgwqAgwqAgwqAvKiBGMiAqLzxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDB4MDMw
MzAwMDYgwqAgwqAgwqAvKiA1ICovPGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgMHgwMzA0MDAzZiDCoCDC
oCDCoC8qIEY1ICovPGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgMHgwMzA2MDAwNyDCoCDCoCDCoC8qIDYg
Ki88YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAweDAzMDgwMDBjIMKgIMKgIMKgLyogLSAqLzxicj4NCiZn
dDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIDB4MDMwYjAwMmIgwqAgwqAgwqAvKiBcICovPGJyPg0KJmd0OyZndDsmZ3Q7
ICs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAweDA0MDAwMDYxIMKgIMKgIMKgLyogUl9DVFJMICovPGJy
Pg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgMHgwNDAxMDAxZSDCoCDCoCDCoC8qIEEgKi88YnI+DQomZ3Q7Jmd0
OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCAweDA0MDIwMDIwIMKgIMKgIMKgLyogRCAqLzxicj4NCiZndDsmZ3Q7Jmd0OyArIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDB4
MDQwMzAwMjEgwqAgwqAgwqAvKiBGICovPGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgMHgwNDA0MDAxZiDC
oCDCoCDCoC8qIFMgKi88YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAweDA0MDUwMDI1IMKgIMKgIMKgLyog
SyAqLzxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDB4MDQwNjAwMjQgwqAgwqAgwqAvKiBKICovPGJyPg0K
Jmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgMHgwNDA4MDAyNyDCoCDCoCDCoC8qIDsgKi88YnI+DQomZ3Q7Jmd0OyZn
dDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCAweDA0MDkwMDI2IMKgIMKgIMKgLyogTCAqLzxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDB4MDQw
YTAwMmIgwqAgwqAgwqAvKiBcICovPGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgMHgwNDBiMDAxYyDCoCDC
oCDCoC8qIEVOVEVSICovPGJyPg0KJmd0OyZndDsmZ3Q7ICs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAw
eDA1MDEwMDJjIMKgIMKgIMKgLyogWiAqLzxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDB4MDUwMjAwMmUg
wqAgwqAgwqAvKiBDICovPGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgMHgwNTAzMDAyZiDCoCDCoCDCoC8q
IFYgKi88YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAweDA1MDQwMDJkIMKgIMKgIMKgLyogWCAqLzxicj4N
CiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIDB4MDUwNTAwMzMgwqAgwqAgwqAvKiAsICovPGJyPg0KJmd0OyZndDsm
Z3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgMHgwNTA2MDAzMiDCoCDCoCDCoC8qIE0gKi88YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAweDA1
MDcwMDJhIMKgIMKgIMKgLyogTF9TSElGVCAqLzxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDB4MDUwODAw
MzUgwqAgwqAgwqAvKiAvICovPGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgMHgwNTA5MDAzNCDCoCDCoCDC
oC8qIC4gKi88YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAweDA1MEIwMDM5IMKgIMKgIMKgLyogU1BBQ0Ug
Ki88YnI+DQomZ3Q7Jmd0OyZndDsgKzxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDB4MDYwMTAwMDIgwqAg
wqAgwqAvKiAxICovPGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgMHgwNjAyMDAwNCDCoCDCoCDCoC8qIDMg
Ki88YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAweDA2MDMwMDA1IMKgIMKgIMKgLyogNCAqLzxicj4NCiZn
dDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIDB4MDYwNDAwMDMgwqAgwqAgwqAvKiAyICovPGJyPg0KJmd0OyZndDsmZ3Q7
ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgMHgwNjA1MDAwOSDCoCDCoCDCoC8qIDggKi88YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAweDA2MDYw
MDA4IMKgIMKgIMKgLyogNyAqLzxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDB4MDYwODAwMGIgwqAgwqAg
wqAvKiAwICovPGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgMHgwNjA5MDAwYSDCoCDCoCDCoC8qIDkgKi88
YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCAweDA2MGEwMDM4IMKgIMKgIMKgLyogTF9BTFQgKi88YnI+DQom
Z3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCAweDA2MGIwMDZjIMKgIMKgIMKgLyogRE9XTiAqLzxicj4NCiZndDsmZ3Q7
Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIDB4MDYwYzAwNmEgwqAgwqAgwqAvKiBSSUdIVCAqLzxicj4NCiZndDsmZ3Q7Jmd0OyAr
PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgMHgwNzAxMDAxMCDCoCDCoCDCoC8qIFEgKi88YnI+DQomZ3Q7
Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCAweDA3MDIwMDEyIMKgIMKgIMKgLyogRSAqLzxicj4NCiZndDsmZ3Q7Jmd0OyAr
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IDB4MDcwMzAwMTMgwqAgwqAgwqAvKiBSICovPGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgMHgwNzA0MDAx
MSDCoCDCoCDCoC8qIFcgKi88YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAweDA3MDUwMDE3IMKgIMKgIMKg
LyogSSAqLzxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDB4MDcwNjAwMTYgwqAgwqAgwqAvKiBVICovPGJy
Pg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgMHgwNzA3MDAzNiDCoCDCoCDCoC8qIFJfU0hJRlQgKi88YnI+DQom
Z3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCAweDA3MDgwMDE5IMKgIMKgIMKgLyogUCAqLzxicj4NCiZndDsmZ3Q7Jmd0
OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIDB4MDcwOTAwMTggwqAgwqAgwqAvKiBPICovPGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgMHgwNzBi
MDA2NyDCoCDCoCDCoC8qIFVQICovPGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgMHgwNzBjMDA2OSDCoCDC
oCDCoC8qIExFRlQgKi88YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH07PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgfTs8YnI+DQomZ3Q7Jmd0OyZndDsgKzxicj4NCiZndDsmZ3Q7Jmd0OyArIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIHBvd2VyLXJlZ3VsYXRvciB7PGJyPg0KJmd0OyZndDsmZ3Q7ICsg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgY29tcGF0aWJsZSA9ICZxdW90O3RpLHRw
czY1MDkwJnF1b3Q7Ozxicj4NCiZndDsmZ3Q7PGJyPg0KJmd0OyZndDsgSSBkb3VidCB0cHM2NTA5
MCB3aWxsICZxdW90O2p1c3Qgd29yayZxdW90Oy4gwqBEb2VzIGl0Pzxicj4NCiZndDs8YnI+DQom
Z3Q7IEdvb2QgcXVlc3Rpb24uIEhvdyB0byB0ZWxsPyA6KSBOb3QgZmFtaWxpYXIgd2l0aCBjbG9j
a3MgYW5kIHJlZ3VsYXRvcnMuPGJyPg0KJmd0OyBJIGRvbiYjMzk7dCBzZWUgdGhlIG5vZGVzIHJl
ZmVyZW5jZWQgYW55d2hlcmUsIHNvIEkgY291bGQganVzdCB0cnkgdG8gZHJvcDxicj4NCiZndDsg
KGFzIEkgd291bGQsIGFzIHBlciBteSBjb3ZlciBsZXR0ZXIsIHByb3Bvc2UgZm9yIGFueXRoaW5n
IG5vbi1lc3NlbnRpYWw8YnI+DQomZ3Q7IHRoYXQgdHVybnMgY29udHJvdmVyc2lhbCkuPGJyPg0K
PGJyPg0KPC9kaXY+PC9kaXY+V2hhdCBkb2VzICZxdW90O2RtZXNnIHwgZ3JlcCB0cHM2NTA5MCZx
dW90OyBzYXk/PGJyPg0KPGJyPg0KV2hhdCBkb2VzIHRoaXMgc2hvdzo8YnI+DQrCoCBncmVwICZx
dW90OyZxdW90OyAvc3lzL2NsYXNzL3JlZ3VsYXRvci8qL25hbWU8YnI+DQo8ZGl2IGNsYXNzPSIi
Pjxicj4NCjxicj4NCiZndDsgSWYgd2UgZHJvcCB0cHM2NTA5MCwgY2FuIHdlIHNhZmVseSBkcm9w
IHZiYXQtZml4ZWQtcmVndWxhdG9yIGFzIHdlbGw/PGJyPg0KPGJyPg0KPC9kaXY+WWVzPGJyPg0K
PGRpdiBjbGFzcz0iIj48YnI+DQo8YnI+DQomZ3Q7Jmd0OyBPbiBzcHJpbmcgdGhlIHRwczY1MDkw
IGlzIG5vdCBkaXJlY3RseSBvbiB0aGUgc2FtZSBpMmMgYnVzIGFzIHRoZSBFQy48YnI+DQomZ3Q7
Jmd0OyBJdCYjMzk7cyBhY3R1YWxseSBoaWRkZW4gYmVoaW5kIHRoZSBFQy48YnI+DQomZ3Q7Jmd0
Ozxicj4NCiZndDsmZ3Q7IExvY2FsbHkgaW4gdGhlIENocm9tZU9TIHRyZWUgdGhlcmUgYXBwZWFy
cyB0byBiZSBhIGZvcmtlZCBjb3B5IG9mIHRoZTxicj4NCiZndDsmZ3Q7IDY1MDkwIHJlZ3VsYXRv
ciBkcml2ZXIgdGhhdCYjMzk7cyBpbiB1c2UganVzdCBmb3Igc3ByaW5nLiDCoFNlZSB0aGlzIGZy
b208YnI+DQomZ3Q7Jmd0OyB0aGUgQ2hyb21lT1MgMy44IHRyZWU6PGJyPg0KJmd0OyZndDs8YnI+
DQomZ3Q7Jmd0OyAuL2RyaXZlcnMvcmVndWxhdG9yL3RwczY1MDkwLXJlZ3VsYXRvci5jPGJyPg0K
Jmd0OyZndDsgLi9kcml2ZXJzL3JlZ3VsYXRvci9jcm9zX2VjLXRwczY1MDkwLmM8YnI+DQomZ3Q7
Jmd0Ozxicj4NCiZndDsmZ3Q7IFRoZSBTcHJpbmcgdmVyc2lvbiBvZiB0aGUgZHJpdmVyIHNlbmRz
IEVDIGNvbW1hbmRzIGRpcmVjdGx5IHRvIGFjY2Vzczxicj4NCiZndDsmZ3Q7IHRoZSB0cHM2NTA5
MC48YnI+DQomZ3Q7Jmd0Ozxicj4NCiZndDsmZ3Q7IEl0IGlzIHBvc3NpYmxlICh1bnRlc3RlZCkg
dGhhdCB5b3UgY291bGQgYWxzbyB0YWxrIHRvIHRwczY1MDkwIG92ZXIgYW48YnI+DQomZ3Q7Jmd0
OyBpMmMgdHVubmVsLiDCoE9uIGV4eW5vczU0MjAtcGVhY2gtcGl0IHdlIGhhdmUgYSBmdWxsIGZs
ZWRnZWQgaTJjPGJyPg0KJmd0OyZndDsgdHVubmVsLCBidXQgeW91IG1heSBiZSBhYmxlIHRvIGV4
dGVuZCB0aGUgdHVubmVsIHRvIGV4cG9ydCBhbiBpMmM8YnI+DQomZ3Q7Jmd0OyB0dW5uZWwgZm9y
IHNwcmluZyB1c2luZyBzb21ldGhpbmcgbGlrZTxicj4NCiZndDsmZ3Q7ICZsdDs8YSBocmVmPSJo
dHRwczovL2Nocm9taXVtLXJldmlldy5nb29nbGVzb3VyY2UuY29tLzY2MTE2IiB0YXJnZXQ9Il9i
bGFuayI+aHR0cHM6Ly9jaHJvbWl1bS1yZXZpZXcuZ29vZ2xlc291cmNlLmNvbS82NjExNjwvYT4m
Z3Q7PGJyPg0KJmd0Ozxicj4NCiZndDsgVGhlIFNCUyBiYXR0ZXJ5IHRoaW5neSAobm90IGluIHRo
aXMgcGF0Y2gpIHNob3VsZCBhbHNvIGJlIGJlaGluZCBzb21lPGJyPg0KJmd0OyB0dW5uZWwuIFRo
ZXJlJiMzOTtzIG5vbmUgZGVmaW5lZCBpbiAtY3Jvcy1jb21tb24uZHRzaSBvciBpbiBteSBwYXRj
aCwgYW5kPGJyPg0KJmd0OyBzdGlsbCBpdCBzaG93cyB1cCBpbiBkbWVzZyB0byBteSBzdXJwcmlz
ZSwgY29tcGxhaW5pbmcgJnF1b3Q7Q291bGRuJiMzOTt0IHJlYWQ8YnI+DQomZ3Q7IHJlbW90ZS1i
dXMgcHJvcGVydHkmcXVvdDsuPGJyPg0KPGJyPg0KPC9kaXY+TWlnaHQgYmUgZHVlIHRvIHRoZSBj
cm9zNTI1MC1jb21tb24uIMKgLi4uYnV0IHllcywgdGhlIGJhdHRlcnkgc2hvdWxkPGJyPg0KYmUg
YmVoaW5kIHRoZSB0dW5uZWwgdG9vIGFuZCB0aGUgcGF0Y2hlcyBuZWVkZWQgZm9yIFNwcmluZyBo
YXZlbiYjMzk7dDxicj4NCmJlZW4gcG9zdGVkIGJ5IGFueW9uZSB5ZXQuIMKgSSBwaWNrZWQgdXAg
YSB3aG9sZSBidW5jaCBvZiBjcm9zX2VjPGJyPg0KY2xlYW51cCBwYXRjaGVzIGFuZCB0aG91Z2h0
IHRoYXQgdGhlIHR1bm5lbCBwYXRjaGVzIGZvciBzcHJpbmcgY291bGQ8YnI+DQpwb3NzaWJsZSBn
byB1cCBhZnRlciB0aG9zZSBsYW5kLjxicj4NCjxkaXYgY2xhc3M9IiI+PGRpdiBjbGFzcz0iaDUi
Pjxicj4NCjxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIHJlZyA9ICZsdDsweDQ4Jmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgKzxicj4NCiZndDsmZ3Q7
Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC8qPGJyPg0KJmd0OyZndDsm
Z3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAqIENvbmZpZyBpcnEgdG8g
ZGlzYWJsZSBpbnRlcm5hbCBwdWxsczxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgKiBldmVuIHRob3VnaCB3ZSBydW4gaW4gcG9sbGluZyBtb2Rl
Ljxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Ki88YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBw
aW5jdHJsLW5hbWVzID0gJnF1b3Q7ZGVmYXVsdCZxdW90Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBwaW5jdHJsLTAgPSAmbHQ7JmFtcDt0cHM2
NTA5MF9pcnEmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArPGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgdnN5czEtc3VwcGx5ID0gJmx0OyZhbXA7dmJh
dCZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgdnN5czItc3VwcGx5ID0gJmx0OyZhbXA7dmJhdCZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICsg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgdnN5czMtc3VwcGx5ID0gJmx0OyZhbXA7
dmJhdCZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgaW5mZXQxLXN1cHBseSA9ICZsdDsmYW1wO3ZiYXQmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0
OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGluZmV0Mi1zdXBwbHkgPSAmbHQ7
JmFtcDt2YmF0Jmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCBpbmZldDMtc3VwcGx5ID0gJmx0OyZhbXA7dmJhdCZndDs7PGJyPg0KJmd0OyZn
dDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaW5mZXQ0LXN1cHBseSA9
ICZsdDsmYW1wO3ZiYXQmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIGluZmV0NS1zdXBwbHkgPSAmbHQ7JmFtcDt2YmF0Jmd0Ozs8YnI+DQom
Z3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpbmZldDYtc3Vw
cGx5ID0gJmx0OyZhbXA7dmJhdCZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgaW5mZXQ3LXN1cHBseSA9ICZsdDsmYW1wO3ZiYXQmZ3Q7Ozxi
cj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHZzeXMt
bDEtc3VwcGx5ID0gJmx0OyZhbXA7dmJhdCZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgdnN5cy1sMi1zdXBwbHkgPSAmbHQ7JmFtcDt2YmF0
Jmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgKzxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJlZ3VsYXRvcnMgezxicj4NCiZndDsmZ3Q7Jmd0OyArIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGZldDEgezxicj4NCiZn
dDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIHJlZ3VsYXRvci1uYW1lID0gJnF1b3Q7dmNkX2xlZCZxdW90Ozs8YnI+DQom
Z3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCByZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9ICZsdDsxMjAwMDAwMCZndDs7
PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSAmbHQ7MTIwMDAw
MDAmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIH07PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZmV0MyB7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVn
dWxhdG9yLW5hbWUgPSAmcXVvdDt3d2FuX3ImcXVvdDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVn
dWxhdG9yLW1pbi1taWNyb3ZvbHQgPSAmbHQ7MzMwMDAwMCZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7
ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSAmbHQ7MzMwMDAwMCZndDs7PGJyPg0KJmd0OyZn
dDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgcmVndWxhdG9yLWFsd2F5cy1vbjs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB9Ozxicj4NCiZndDsmZ3Q7Jmd0
OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGZldDUgezxi
cj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIHJlZ3VsYXRvci1uYW1lID0gJnF1b3Q7Y2FtJnF1b3Q7Ozxicj4N
CiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIHJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gJmx0OzMzMDAwMDAmZ3Q7
Ozxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gJmx0OzMzMDAw
MDAmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJlZ3VsYXRvci1hbHdheXMtb247PGJyPg0KJmd0
OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
fTs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCBmZXQ2IHs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCByZWd1bGF0b3ItbmFtZSA9ICZx
dW90O2xjZF92ZGQmcXVvdDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVndWxhdG9yLW1pbi1taWNy
b3ZvbHQgPSAmbHQ7MzMwMDAwMCZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVndWxhdG9yLW1h
eC1taWNyb3ZvbHQgPSAmbHQ7MzMwMDAwMCZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfTs8YnI+DQomZ3Q7Jmd0OyZn
dDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBmZXQ3IHs8
YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCByZWd1bGF0b3ItbmFtZSA9ICZxdW90O3RzJnF1b3Q7Ozxicj4N
CiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIHJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gJmx0OzUwMDAwMDAmZ3Q7
Ozxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gJmx0OzUwMDAw
MDAmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIH07PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgfTs8YnI+DQomZ3Q7Jmd0OyZndDsgKzxicj4NCiZndDsmZ3Q7Jmd0OyAr
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGNoYXJnZXIgezxicj4NCiZndDsmZ3Q7
Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGNvbXBh
dGlibGUgPSAmcXVvdDt0aSx0cHM2NTA5MC1jaGFyZ2VyJnF1b3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0
OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH07PGJyPg0KJmd0OyZndDsmZ3Q7
ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfTs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCB9
Ozxicj4NCiZndDsmZ3Q7Jmd0OyArPGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgaGRtaSB7
PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaGRtaS1lbi1zdXBwbHkg
PSAmbHQ7JmFtcDtzNW1fbGRvOF9yZWcmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIHZkZC1zdXBwbHkgPSAmbHQ7JmFtcDtzNW1fbGRvOF9yZWcmZ3Q7Ozxicj4N
CiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHZkZF9vc2Mtc3VwcGx5ID0gJmx0
OyZhbXA7czVtX2xkbzEwX3JlZyZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgdmRkX3BsbC1zdXBwbHkgPSAmbHQ7JmFtcDtzNW1fbGRvOF9yZWcmZ3Q7Ozxicj4N
CiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIH07PGJyPg0KJmd0OyZndDsmZ3Q7ICs8YnI+DQomZ3Q7
Jmd0OyZndDsgKyDCoCDCoCDCoCBmaW1kQDE0NDAwMDAwIHs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDC
oCDCoCDCoCDCoCDCoCDCoCDCoCBzdGF0dXMgPSAmcXVvdDtva2F5JnF1b3Q7Ozxicj4NCiZndDsm
Z3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHNhbXN1bmcsaW52ZXJ0LXZjbGs7PGJyPg0K
Jmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgfTs8YnI+DQomZ3Q7Jmd0OyZndDsgKzxicj4NCiZndDsm
Z3Q7Jmd0OyArIMKgIMKgIMKgIGRwLWNvbnRyb2xsZXJAMTQ1QjAwMDAgezxicj4NCiZndDsmZ3Q7
Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHN0YXR1cyA9ICZxdW90O29rYXkmcXVvdDs7PGJy
Pg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcGluY3RybC1uYW1lcyA9ICZx
dW90O2RlZmF1bHQmcXVvdDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgcGluY3RybC0wID0gJmx0OyZhbXA7ZHBfaHBkJmd0Ozs8YnI+DQomZ3Q7Jmd0Ozxicj4NCiZn
dDsmZ3Q7IFRoaXMgaXMgcHJvYmFibHkgbm90IHJpZ2h0LiDCoEl0IGxvb2tzIGFzIGlmIHNwcmlu
ZyB1c2VzIGdwYzMtMCBmb3I8YnI+DQomZ3Q7Jmd0OyBkaXNwbGF5IHBvcnQgSFBEIChhcyBhIEdQ
SU8pLiDCoFRoZSB1cHN0cmVhbSBoYXMgdGhpcyBpbiB0aGU8YnI+DQomZ3Q7Jmd0OyBleHlub3M1
MjUwLXBpbmN0cmwuZHRzaSBhcyBhIGRpZmZlcmVudCBwaW4uPGJyPg0KJmd0OyZndDs8YnI+DQom
Z3Q7Jmd0OyBJIHRoaW5rIHlvdSYjMzk7bGwgbmVlZCB0byBkZWZpbmUgeW91ciBvd24gcGluY3Ry
bCBoZXJlLjxicj4NCiZndDsmZ3Q7PGJyPg0KJmd0OyZndDs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDC
oCDCoCDCoCDCoCDCoCDCoCDCoCBzYW1zdW5nLGNvbG9yLXNwYWNlID0gJmx0OzAmZ3Q7Ozxicj4N
CiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHNhbXN1bmcsZHluYW1pYy1yYW5n
ZSA9ICZsdDswJmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCBz
YW1zdW5nLHljYmNyLWNvZWZmID0gJmx0OzAmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIHNhbXN1bmcsY29sb3ItZGVwdGggPSAmbHQ7MSZndDs7PGJyPg0KJmd0
OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgc2Ftc3VuZyxsaW5rLXJhdGUgPSAmbHQ7
MHgwYSZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgc2Ftc3Vu
ZyxsYW5lLWNvdW50ID0gJmx0OzEmZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIHNhbXN1bmcsaHBkLWdwaW8gPSAmbHQ7JmFtcDtncGMzIDAgMCZndDs7PGJyPg0K
Jmd0OyZndDsmZ3Q7ICs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCBk
aXNwbGF5LXRpbWluZ3Mgezxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIG5hdGl2ZS1tb2RlID0gJmx0OyZhbXA7dGltaW5nMSZndDs7PGJyPg0KJmd0
OyZndDsmZ3Q7ICs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCB0aW1pbmcxOiB0aW1pbmdAMSB7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgY2xvY2stZnJlcXVlbmN5ID0gJmx0
OzcwNTg5MjgwJmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBoYWN0aXZlID0gJmx0OzEzNjYmZ3Q7Ozxicj4NCiZndDsm
Z3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHZh
Y3RpdmUgPSAmbHQ7NzY4Jmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBoZnJvbnQtcG9yY2ggPSAmbHQ7NDAmZ3Q7Ozxi
cj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIGhiYWNrLXBvcmNoID0gJmx0OzQwJmd0Ozs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBoc3luYy1sZW4gPSAmbHQ7
MzImZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIHZiYWNrLXBvcmNoID0gJmx0OzEwJmd0Ozs8YnI+DQomZ3Q7Jmd0OyZn
dDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB2ZnJvbnQt
cG9yY2ggPSAmbHQ7MTImZ3Q7Ozxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHZzeW5jLWxlbiA9ICZsdDs2Jmd0Ozs8YnI+DQom
Z3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB9Ozxicj4NCiZn
dDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH07PGJyPg0KJmd0OyZndDsmZ3Q7ICsg
wqAgwqAgwqAgfTs8YnI+DQomZ3Q7Jmd0OyZndDsgKzxicj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKg
IMKgIGZpeGVkLXJhdGUtY2xvY2tzIHs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDC
oCDCoCDCoCB4eHRpIHs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCBjb21wYXRpYmxlID0gJnF1b3Q7c2Ftc3VuZyxjbG9jay14eHRpJnF1b3Q7Ozxi
cj4NCiZndDsmZ3Q7Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGNsb2Nr
LWZyZXF1ZW5jeSA9ICZsdDsyNDAwMDAwMCZndDs7PGJyPg0KJmd0OyZndDsmZ3Q7ICsgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgfTs8YnI+DQomZ3Q7Jmd0OyZndDsgKyDCoCDCoCDCoCB9Ozxicj4NCiZn
dDsmZ3Q7Jmd0OyArfTs8YnI+DQomZ3Q7PGJyPg0KJmd0OyBXaWxsIGNoZWNrIG9uIHRoZSBvdGhl
ciBzdWdnZXN0aW9ucy48YnI+DQo8YnI+DQo8L2Rpdj48L2Rpdj48c3BhbiBjbGFzcz0iIj48Zm9u
dCBjb2xvcj0iIzg4ODg4OCI+LURvdWc8YnI+DQo8L2ZvbnQ+PC9zcGFuPjwvYmxvY2txdW90ZT48
L2Rpdj48YnI+PC9kaXY+PC9kaXY+DQo=
--047d7b3a93e00f5b5804fc964344--
