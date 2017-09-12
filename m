From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 5/5] lmp92001: mfd: doc: Add support LMP92001
Date: Tue, 12 Sep 2017 11:09:23 +0100
Message-ID: <20170912110923.0f80c116@archlinux>
References: <20170830182528.9479-1-s.abhisit@gmail.com>
        <20170911215841.jaaipbdcf5hchjck@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170911215841.jaaipbdcf5hchjck@rob-hp-laptop>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: s.abhisit-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Jonathan.Cameron-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, jacopo-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, fabrice.gasnier-qxv4g6HH51o@public.gmane.org, akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marek.vasut+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org, mike.looijmans-Oq418RWZeHk@public.gmane.org, peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org, jeff.dagenais-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org, adi.reus-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 11 Sep 2017 16:58:41 -0500
Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:

> On Thu, Aug 31, 2017 at 01:25:28AM +0700, s.abhisit-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> > From: Abhisit Sangjan <s.abhisit-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > 
> > TI LMP92001 Analog System Monitor and Controller
> > 
> > 8-bit GPIOs.
> > 12 DACs with 12-bit resolution.
> > 
> > The GPIOs and DACs are shared port function with Cy function pin to
> > take control the pin suddenly from external hardware.
> > DAC's referance voltage selectable for Internal/External.
> > 
> > 16 + 1 ADCs with 12-bit resolution.
> > 
> > Built-in internal Temperature Sensor on channel 17.
> > Window Comparator Function is supported on channel 1-3 and 9-11 for
> > monitoring with interrupt signal (pending to implement for interrupt).
> > ADC's referance voltage selectable for Internal/External.
> > 
> > Signed-off-by: Abhisit Sangjan <s.abhisit-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >  Documentation/ABI/testing/sysfs-bus-iio-lmp920001  | 65 ++++++++++++++++++++++
> >  .../devicetree/bindings/gpio/gpio-lmp92001.txt     | 22 ++++++++  
> 
> As Jonathan said, please split.
> 
> >  .../bindings/iio/adc/ti-lmp92001-adc.txt           | 20 +++++++
> >  .../bindings/iio/dac/ti-lmp92001-dac.txt           | 35 ++++++++++++
> >  4 files changed, 142 insertions(+)
> >  create mode 100644 Documentation/ABI/testing/sysfs-bus-iio-lmp920001
> >  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-lmp92001.txt
> >  create mode 100644 Documentation/devicetree/bindings/iio/adc/ti-lmp92001-adc.txt
> >  create mode 100644 Documentation/devicetree/bindings/iio/dac/ti-lmp92001-dac.txt  
> 
> [...]
> 
> > diff --git a/Documentation/devicetree/bindings/gpio/gpio-lmp92001.txt b/Documentation/devicetree/bindings/gpio/gpio-lmp92001.txt
> > new file mode 100644
> > index 000000000000..f9a18c492145
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/gpio/gpio-lmp92001.txt
> > @@ -0,0 +1,22 @@
> > +* Texas Instruments' LMP92001 GPIOs
> > +  
> 
> Need to state what this is a child of and refer to that binding doc. 
> Same for the others.
> 
> > +Required properties:
> > + - compatible: Must be set to "ti,lmp92001-gpio".
> > + - reg: i2c chip address for the device.  
> 
> ? That's for the parent.
> 
> > + - gpio-controller: Marks the device node as a gpio controller.
> > + - #gpio-cells : Should be two.  The first cell is the pin number and the
> > +  second cell is used to specify the gpio polarity:
> > +        0 = Active high
> > +        1 = Active low
> > +
> > +Example:
> > +lmp92001@20 {
> > +        compatible = "ti,lmp92001";
> > +        reg = <0x20>;
> > +
> > +        gpio-controller {  
> 
> Should be "gpio {"
> 
> > +                compatible = "ti,lmp92001-gpio";
> > +                gpio-controller;
> > +                #gpio-cells = <2>;
> > +        };
> > +};
> > diff --git a/Documentation/devicetree/bindings/iio/adc/ti-lmp92001-adc.txt b/Documentation/devicetree/bindings/iio/adc/ti-lmp92001-adc.txt
> > new file mode 100644
> > index 000000000000..4565961bf511
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/iio/adc/ti-lmp92001-adc.txt
> > @@ -0,0 +1,20 @@
> > +* Texas Instruments' LMP92001 ADCs
> > +
> > +Required properties:
> > + - compatible: Must be set to "ti,lmp92001-adc".
> > + - reg: i2c chip address for the device.
> > + - ti,lmp92001-adc-mask: bit mask for which channel is enable.
> > +        0 = Off
> > +        1 = On
> > +
> > +Example:
> > +lmp92001@20 {
> > +        compatible = "ti,lmp92001";
> > +        reg = <0x20>;
> > +
> > +        lmp92001-adc {  
> 
> adc {
> 
> > +                compatible = "ti,lmp92001-adc";
> > +                ti,lmp92001-adc-mode = "continuous";  
> 
> Not documented and I believe we're going to add a common property for 
> this.

Possibly.  I'm not keen on it being explicitly controlled in general.
It isn't a feature of the hardware in this case (I think) and as userspace
control it is very hard for userspace to know what to do with it -
normally it is better to put sufficient smarts in the driver to handle
this transparently from either dt or userspace abi point of view.

At a rough guess 10-25% of the hardware in IIO has a similar mode (possibly more)
We expose it precisely 1 other driver at the moment (and to be honest
I can't recall why we allowed it in there)  There are all sorts of optimizations
that can be done in the driver if we don't make this a manual control.

Jonathan

> 
> > +                ti,lmp92001-adc-mask = <0x00000079>;
> > +        };
> > +};
> > diff --git a/Documentation/devicetree/bindings/iio/dac/ti-lmp92001-dac.txt b/Documentation/devicetree/bindings/iio/dac/ti-lmp92001-dac.txt
> > new file mode 100644
> > index 000000000000..882db9ca92f5
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/iio/dac/ti-lmp92001-dac.txt
> > @@ -0,0 +1,35 @@
> > +* Texas Instruments' LMP92001 DACs
> > +
> > +Required properties:
> > + - compatible: Must be set to "ti,lmp92001-dac".
> > + - reg: i2c chip address for the device.
> > + - ti,lmp92001-dac-hiz: hi-impedance control,
> > +        1 = Forces all OUT[1:12] outputs to hi-z, 0 = normal
> > + - ti,lmp92001-dac-outx:
> > +        Cy = 0, 1 = will force associated OUTx outputs to VDD
> > +        Cy = 0, 0 = will force associated OUTx outputs to GND
> > + - ti,lmp92001-dac-gang: What group of Cy is governed to.
> > +        -----------------------------------------
> > +        |  Cy   | CDAC:GANG = 0 | CDAC:GANG = 1 |
> > +        -----------------------------------------
> > +        |  C1   |   OUT[1:4]    |    OUT[1:3]   |
> > +        -----------------------------------------
> > +        |  C2   |   OUT[5:6]    |    OUT[4:6]   |
> > +        -----------------------------------------
> > +        |  C3   |   OUT[7:8]    |    OUT[7:9]   |
> > +        -----------------------------------------
> > +        |  C4   |   OUT[9:12]   |    OUT[10:12] |
> > +        -----------------------------------------
> > +
> > +Example:
> > +lmp92001@20 {
> > +        compatible = "ti,lmp92001";
> > +        reg = <0x20>;
> > +
> > +        lmp92001-dac {  
> 
> dac {
> 
> > +                compatible = "ti,lmp92001-dac";
> > +                ti,lmp92001-dac-hiz  = /bits/ 8 <0>;
> > +                ti,lmp92001-dac-outx = /bits/ 8 <0>;
> > +                ti,lmp92001-dac-gang = /bits/ 8 <0>;
> > +        };
> > +};
> > -- 
> > 2.13.0
> >   
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
