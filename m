From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCHv3 1/2] ARM64: dts: meson-gxbb-odroidc2: Fix usb phy reset warning
Date: Mon, 4 Feb 2019 21:49:26 +0100
Message-ID: <CAFBinCBjF5iOkUjhxSGXpQa7Nc1=bWAzA=XjrfXRYxSPZO15nQ@mail.gmail.com>
References: <20190129102521.4141-1-linux.amoon@gmail.com> <20190129102521.4141-2-linux.amoon@gmail.com>
 <CAFBinCDj=Y9HWEhJYMjo9FviAosxpHW5d61CceZ7HPV4ObZ79Q@mail.gmail.com> <CANAwSgSnR-DWffg3vKStuXQXahLf8ONssxr4+byL=PSr5JR=xA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANAwSgSnR-DWffg3vKStuXQXahLf8ONssxr4+byL=PSr5JR=xA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>
Cc: devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-amlogic@lists.infradead.org, Linux Kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>
List-Id: devicetree@vger.kernel.org

Hi Anand,

On Mon, Feb 4, 2019 at 9:04 PM Anand Moon <linux.amoon@gmail.com> wrote:
[...]
> > > @@ -36,6 +43,8 @@
> > >                 regulator-min-microvolt = <5000000>;
> > >                 regulator-max-microvolt = <5000000>;
> > >
> > > +               vin-supply = <&p5v0>;
> > did you find out why this patch fixes the USB_OTG_PWR regulator?
> > based on just reading the patch I can't find an explanation myself
> >
>
> As per the device tree binding we need this setting to enable power input source
> [0] Documentation/devicetree/bindings/regulator/fixed-regulator.txt
>
> *I have observed few more place where this setting is missing*
OK, I understand that we should describe the hierarchy of the regulators

> > have you tested without this patch to rule out that you hit some bug
> > in the regulator framework back when you wrote the patch?
> > (I don't have an Odroid-C2 so I can't test this myself).
> >
>
> Yes I have tested this patch.Some device like usb camera and usb hard drive
> when connected to usb port will generate warning message.
> which shows us that not enough power is being set to the port.
I don't understand why adding "p5v0" as parent of "usb_otg_pwr"
changes the output of "usb_otg_pwr":
- "p5v0" is a fixed regulator which cannot be controlled at all (apart
from removing power from it)
- "usb_otg_pwr" does not have any current limits set inside the .dts
- "usb_otg_pwr" has the same fixed voltage as the new "p5v0" regulator

what are your steps-to-reproduce for your original issue ("reset
high-speed USB device number 3 using dwc2")?


Regards
Martin
