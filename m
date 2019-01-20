From: Anand Moon <linux.amoon@gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: meson8b: odroidc1: Enable usb phy node
Date: Mon, 21 Jan 2019 00:14:15 +0530
Message-ID: <CANAwSgQNNRqr3rZRgr71iy7+0zuuYykd+4-1W3LB+Voux6KioQ@mail.gmail.com>
References: <20190113181808.5768-1-linux.amoon@gmail.com> <CAFBinCCD4o0cXEht_7bgV6moCK2WfVRvZq8UUZD3gDo-TaRKbQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFBinCCD4o0cXEht_7bgV6moCK2WfVRvZq8UUZD3gDo-TaRKbQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-amlogic@lists.infradead.org, Linux Kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Emiliano Ingrassia <ingrassia@epigenesys.com>
List-Id: devicetree@vger.kernel.org

Hi Martin,

Thanks for your review comments.

On Sat, 19 Jan 2019 at 03:59, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Anand,
>
> thank you for this patch!
>
> On Sun, Jan 13, 2019 at 7:18 PM Anand Moon <linux.amoon@gmail.com> wrote:
> >
> > Add missing vbus-supply link to phy controller for usb_phy0
> > and usb_phy1 nodes, this changes fixed the power issue
> > on usb ports usb, changes help fix usb reset warning.
> I trust you on the fact that GPIOAO_5 controls VBUS of USB0 and USB1
>
> to me the schematics are not 100% clear or I'm bad at interpreting them:
> - I'll refer to odroid-c1+_rev0.4_20150615.pdf
> - page 1 lists GPIOAO.BIT5 as input for the PWREN signal of the
> USB_OTG controller (usb0)
> - page 1 also shows a PWREN signal in the USB_HOST controller (usb1)
> but not it's input
> - based on your patch I assume that PWREN is the same signal for both
> USB controllers
>
As per the schematics odroid-c1+_rev0.4_20150615.pdf

It seem that their  vbus setting for *OTG* port. *Bus 01.Port 1* using
*GPIOAO.BIT5* gpio
But we also need set power supply for *USB_B* port. *Bus 02.Port 1* ?
I don't know but I will try to find solution.
We need to enable some bit in phy driver ?

> > [  821.991470] usb 1-1.2: reset high-speed USB device number 3 using dwc2
> > [  825.243385] usb 1-1.2: reset high-speed USB device number 3 using dwc2
> > [  828.151310] usb 1-1.2: reset high-speed USB device number 3 using dwc2
> > [  830.991241] usb 1-1.2: reset high-speed USB device number 3 using dwc2
> >
> > Fixes: 2eb79a4d15ff (ARM: dts: meson: enabling the USB Host controller on Odroid-C1/C1+ board)
> you already split your original patch into two, however I suggest
> splitting these patches differently:
> - this one (personally I would choose "ARM: dts: meson8b: odroidc1:
> fix USB VBUS supplies" as title), which contains the Fixes tag, adds
> the "usb_vbus" and references it in the "usb0" and "usb1" nodes
> - enables usb0_phy and usb0 as part of your second patch (I would call
> that "ARM: dts: meson8b: odroidc1: enable the OTG capable USB
> controller")

Ok I will fix this as per you suggestion in the next version.

>
> > Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > Cc: Jerome Brunet <jbrunet@baylibre.com>
> > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> > Rebased on Kevin's amlogic/v5.0/fixes branch
> >
> > [alarm@archl-c1t ~]$ lsusb -t
> > /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=dwc2/1p, 480M
> >     |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
> >         |__ Port 1: Dev 4, If 0, Class=Mass Storage, Driver=usb-storage, 480M
> >         |__ Port 3: Dev 3, If 0, Class=Video, Driver=uvcvideo, 480M
> >         |__ Port 3: Dev 3, If 1, Class=Video, Driver=uvcvideo, 480M
> >         |__ Port 3: Dev 3, If 2, Class=Audio, Driver=snd-usb-audio, 480M
> >         |__ Port 3: Dev 3, If 3, Class=Audio, Driver=snd-usb-audio, 480M
> > [alarm@archl-c1t ~]$
> > [alarm@archl-c1t ~]$ lsusb -v|egrep "^Bus|MaxPower"
> > Couldn't open device, some information will be missing
> > Bus 001 Device 003: ID 1b71:0056 Fushicai
> >     MaxPower              500mA
> > Couldn't open device, some information will be missing
> > Bus 001 Device 004: ID 152d:0578 JMicron Technology Corp. / JMicron USA Technology Corp. JMS567 SATA 6Gb/s bridge
> >     MaxPower               30mA
> > Couldn't open device, some information will be missing
> > Couldn't open device, some information will be missing
> > Bus 001 Device 002: ID 05e3:0610 Genesys Logic, Inc. 4-port hub
> >     MaxPower              100mA
> > Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> >     MaxPower                0mA
> > ---
> >  arch/arm/boot/dts/meson8b-odroidc1.dts | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
> > index 0f0a46ddf3ff..a49a8509b288 100644
> > --- a/arch/arm/boot/dts/meson8b-odroidc1.dts
> > +++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
> > @@ -83,6 +83,19 @@
> >                 regulator-max-microvolt = <5000000>;
> >         };
> >
> > +       usb_vbus: regulator-usb-vbus {
> please add a comment here with some details about the regulator and
> add a hint that the signal in the schematics is called "PWREN"
Ok I will add this comment in the next patch.
>
> > +               compatible = "regulator-fixed";
> > +
> > +               regulator-name = "USB_VBUS";
> > +               regulator-min-microvolt = <5000000>;
> > +               regulator-max-microvolt = <5000000>;
> > +
> > +               vin-supply = <&p5v0>;
> > +
> > +               gpio = <&gpio_ao GPIOAO_5 GPIO_ACTIVE_HIGH>;
> > +               enable-active-high;
> > +       };
> > +
> >         tflash_vdd: regulator-tflash_vdd {
> >                 /*
> >                  * signal name from schematics: TFLASH_VDD_EN
> > @@ -293,8 +306,18 @@
> >         pinctrl-names = "default";
> >  };
> >
> > +&usb0_phy {
> > +       status = "okay";
> > +       vbus-supply = <&usb_vbus>;
> > +};
> > +
> >  &usb1_phy {
> >         status = "okay";
> > +       vbus-supply = <&usb_vbus>;
> > +};
> > +
> > +&usb0 {
> > +       status = "okay";
> >  };
> I believe there's a problem with the usb/usb_phy nodes here. on my
> Odroid-C1 this results in:
> # cat /sys/kernel/debug/regulator/regulator_summary | grep USB_VBUS
>    USB_VBUS                      0    0      0 unknown  5000mV     0mA
>  5000mV  5000mV
> (open count is 0)
>
> if I move "vbus-supply" to the "usb1" node (just as an example) then I get:
> # cat /sys/kernel/debug/regulator/regulator_summary | grep USB_VBUS
>    USB_VBUS                      1    1      0 unknown  5000mV     0mA
>  5000mV  5000mV

Sorry for the mixing the vbus-supply node.

After fix the phy driver code and dts changes I am getting this changes.
# cat /sys/kernel/debug/regulator/regulator_summary | grep USB_VBUS
    USB_VBUS                      1    2      0 unknown  5000mV
0mA  5000mV  5000mV

Now I am able to enable both *Bus 01.Port 1* and *Bus 02.Port 1*

# lsusb -t
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=dwc2/1p, 480M
    |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
        |__ Port 1: Dev 4, If 0, Class=Mass Storage, Driver=usb-storage, 480M
        |__ Port 3: Dev 3, If 0, Class=Video, Driver=uvcvideo, 480M
        |__ Port 3: Dev 3, If 1, Class=Video, Driver=uvcvideo, 480M
        |__ Port 3: Dev 3, If 2, Class=Audio, Driver=snd-usb-audio, 480M
        |__ Port 3: Dev 3, If 3, Class=Audio, Driver=snd-usb-audio, 480M
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=dwc2/1p, 480M

But not usb device are getting enable on *Bus 01.Port 1*

>
> unfortunately neither your original patch nor the modified version
> seem to enable USB VBUS on my Odroid-C1.
> I have documented my findings already back in December, see "USB
> issues on Odroid-C1" [0]
> help on that would be highly appreciated :)
>
> on which board revision have you tested this patch?
>

I have with me for testing

ODROID-C0 REV 0.4 20151217
ODROID-C1+ REV 0.4 20150615 ----> current testing on
ODROID-C1+ REV 0.4 20160226

>
> Regards
> Martin
>
>
> [0] http://lists.infradead.org/pipermail/linux-amlogic/2018-December/009451.html

Best Regards

-Anand
