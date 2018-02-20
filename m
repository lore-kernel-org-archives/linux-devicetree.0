From: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH v4 2/5] dt-bindings: gpio: add raspberry pi GPIO expander
 binding
Date: Tue, 20 Feb 2018 09:34:27 +0200
Message-ID: <20180220073427.vaxp5wkygs6pwaxi@tarshish>
References: <cover.1517923836.git.baruch@tkos.co.il>
 <214ff3856c430b8045b63b25d83733b77054dfab.1517923836.git.baruch@tkos.co.il>
 <20180213232007.ieme6rjxgc7vidbw@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180213232007.ieme6rjxgc7vidbw@rob-hp-laptop>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Eric Anholt <eric@anholt.net>, Michael Zoran <mzoran@crowfest.net>, linux-rpi-kernel@lists.infradead.org, Dave Stevenson <dave.stevenson@raspberrypi.org>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

Thanks again for reviewing.

On Tue, Feb 13, 2018 at 05:20:07PM -0600, Rob Herring wrote:
> On Wed, Feb 07, 2018 at 08:35:23PM +0200, Baruch Siach wrote:
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
> 
> This is the parent node. You don't need it.

OK. I guess of_get_parent() will do the trick.

> > +Example:
> > +
> > +firmware: firmware {
> > +	compatible = "raspberrypi,bcm2835-firmware";
> > +	mboxes = <&mailbox>;
> 
> No, sorry. /firmware is the container of firmware nodes. So 
> something like this:
> 
> firmware {
> 	rpi-firmware {
> 		compatible = "raspberrypi,bcm2835-firmware";
> 		mboxes = <&mailbox>;
> 		gpio {
> 		 compatible = "raspberrypi,firmware-gpio";
> 
> 		};
> 	};
> };

This is the hierarchy we currently have at arch/arm/boot/dts/bcm2835-rpi.dtsi:

/ {
        soc {
                firmware: firmware {
                        compatible = "raspberrypi,bcm2835-firmware";
                        mboxes = <&mailbox>;
                };
        };
};


Are you suggesting to add another container between 'soc' and 'firmware'? Or 
is it the 'firmware' node name that we need to change to 'rpi-firmware'?

> > +
> > +	expgpio: gpio {
> > +		 compatible = "raspberrypi,firmware-gpio";
> > +		 gpio-controller;
> > +		 #gpio-cells = <2>;
> > +		 firmware = <&firmware>;
> > +	 };
> > +};

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
