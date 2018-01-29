From: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH v3 2/4] dt-bindings: gpio: add raspberry pi GPIO expander
 binding
Date: Mon, 29 Jan 2018 18:30:20 +0200
Message-ID: <20180129163020.yr3orbrwg4wmq7p4@sapphire.tkos.co.il>
References: <cover.1516105893.git.baruch@tkos.co.il>
 <248ce2c6c79b281261184a0ccde8513a9074af4c.1516105893.git.baruch@tkos.co.il>
 <20180129161134.tm6dhsygvbt3ogxf@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180129161134.tm6dhsygvbt3ogxf@rob-hp-laptop>
Sender: linux-gpio-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.org>, Eric Anholt <eric@anholt.net>, Stefan Wahren <stefan.wahren@i2se.com>, Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Michael Zoran <mzoran@crowfest.net>, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Rob,

Thanks for reviewing.

On Mon, Jan 29, 2018 at 10:11:34AM -0600, Rob Herring wrote:
> On Tue, Jan 16, 2018 at 02:45:08PM +0200, Baruch Siach wrote:
> > The Raspberry Pi 3 GPIO expander is controlled by the VC4 firmware over
> > I2C. The firmware mailbox interface allows the ARM core to control the
> > GPIO lines.
> > 
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > ---
> > v3:
> >   * Rename node name.
> > 
> > v2:
> >   * Rename compatible string to raspberrypi,firmware-gpio
> > ---
> >  .../bindings/gpio/raspberrypi,firmware-gpio.txt    | 24 ++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/gpio/raspberrypi,firmware-gpio.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/gpio/raspberrypi,firmware-gpio.txt b/Documentation/devicetree/bindings/gpio/raspberrypi,firmware-gpio.txt
> > new file mode 100644
> > index 000000000000..936dc59eba12
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/gpio/raspberrypi,firmware-gpio.txt
> > @@ -0,0 +1,24 @@
> > +Raspberry Pi GPIO expander
> > +
> > +The Raspberry Pi 3 GPIO expander is controlled by the VC4 firmware. The
> > +firmware exposes a mailbox interface that allows the ARM core to control the
> > +GPIO lines on the expander.
> > +
> > +Required properties:
> > +
> > +- compatible : Should be "raspberrypi,firmware-gpio"
> > +- gpio-controller : Marks the device node as a gpio controller
> > +- #gpio-cells : Should be two.  The first cell is the pin number, and
> > +  the second cell is used to specify the gpio polarity:
> > +  0 = active high
> > +  1 = active low
> > +- firmware : Reference to the RPi firmware device node
> > +
> > +Example:
> > +
> > +expgpio: gpio-expander {
> 
> Still not right. The correct generic node name is "gpio".

I'll fix that.

> > +	compatible = "raspberrypi,firmware-gpio";
> > +	gpio-controller;
> > +	#gpio-cells = <2>;
> > +	firmware = <&firmware>;
> 
> Can you make this a child of the firmware node instead?

I guess I can, I'll need to look into it. What is the advantage of that? What 
about the existing raspberrypi,bcm2835-power[1] node in bcm2835-rpi.dtsi? 
Should it move under the firmware node as well?

[1] Documentation/devicetree/bindings/soc/bcm/raspberrypi,bcm2835-power.txt

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
