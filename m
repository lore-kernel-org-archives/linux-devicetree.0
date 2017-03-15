From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: Re: [PATCH v3 3/3] mfd: wm831x: Add device tree binding document
Date: Wed, 15 Mar 2017 15:24:14 +0000
Message-ID: <20170315152414.GI6986@localhost.localdomain>
References: <1488818804-9406-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1488818804-9406-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <20170314145935.3wy3ximhtuhw3fgc@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170314145935.3wy3ximhtuhw3fgc@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linus.walleij@linaro.org, gnurou@gmail.com, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

On Tue, Mar 14, 2017 at 02:59:35PM +0000, Lee Jones wrote:
> On Mon, 06 Mar 2017, Charles Keepax wrote:
> 
> > Add a device tree binding document for the wm831x series of PMICs.
> > Currently only support for the registering the device and the GPIOs are
> > actually implemented in the driver.
> > 
> > Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> > ---
> > 
> > Changes since v2:
> >  - Flesh the binding some more with some additional features of the device,
> >    although these are not yet implemented in the code.
> > 
> >  Documentation/devicetree/bindings/mfd/wm831x.txt | 81 ++++++++++++++++++++++++
> >  MAINTAINERS                                      |  1 +
> >  2 files changed, 82 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/wm831x.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/mfd/wm831x.txt b/Documentation/devicetree/bindings/mfd/wm831x.txt
> > new file mode 100644
> > index 0000000..680ac18
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/wm831x.txt
> > @@ -0,0 +1,81 @@
> > +Cirrus Logic/Wolfson Microelectronics wm831x PMICs
> > +
> > +System PMICs with a wide range of additional features.
> > +
> > +Required properties:
> > +
> > +  - compatible : One of the following chip-specific strings:
> > +        "wlf,wm8310"
> > +        "wlf,wm8311"
> > +        "wlf,wm8312"
> > +        "wlf,wm8320"
> > +        "wlf,wm8321"
> > +        "wlf,wm8325"
> > +        "wlf,wm8326"
> > +
> > +  - reg : I2C slave address when connected using I2C, chip select number
> > +    when using SPI.
> > +
> > +  - gpio-controller : Indicates this device is a GPIO controller.
> > +  - #gpio-cells : Must be 2. The first cell is the pin number and the
> > +    second cell is used to specify optional parameters (currently unused).
> 
> Then why not "must be 1", if the second cell is unused?
> 

I believe it is generally advised to use at least 2 cells for
GPIOs and since there is a reasonable chance someone might add
flags later seems better have it in the binding already.

> > +  - interrupts : The interrupt line the /IRQ signal for the device is
> > +    connected to.
> 
> What's with the '/'?

Active low, but will remove.

> 
> > +  - interrupt-parent : The parent interrupt controller.
> > +
> > +  - interrupt-controller : wm831x devices contain interrupt controllers and
> > +    may provide interrupt services to other devices.
> > +  - #interrupt-cells: Must be 2. The first cell is the IRQ number, and the
> > +    second cell is the flags, encoded as the trigger masks from
> > +    Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
> 
> Please use the succinct "../../" format.

Can do.

Thanks,
Charles
