From: Adam Sampson <ats-G+91BasbrijYtjvyW6yDsg@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun7i: Add dts file for pcDuino 3 Nano board
Date: Mon, 26 Jan 2015 00:35:20 +0000
Message-ID: <20150126003520.GA871@cartman.at.offog.org>
References: <1422199921-325-1-git-send-email-ats@offog.org>
 <20150125164846.GL8470@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150125164846.GL8470@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Maxime,

On Sun, Jan 25, 2015 at 05:48:46PM +0100, Maxime Ripard wrote:
> > +			label = "pcduino3-nano:green:led3";
...
> > +			label = "pcduino3-nano:green:led4";
> Where are the three other leds?

LED1 is the power LED, and as far as I can see there isn't an LED2 on
the board. LED5 is next to LED3/4, but it's not exposed by the 3.4
kernel that LinkSprite ship, and this forum post says it's not
software-controllable (which seems weird):
http://forum.linksprite.com/index.php?/topic/3145-pcduino3-nano-led-control/

> Also, usually, the last part of the label is what the led function
> usually is.

"LED3" and "LED4" are how those LEDs are actually labelled on the board
(unlike the pcDuino v3, which labels them "TX" and "RX", and calls them
pcduino3:green:rx/tx in the DTS). I've changed them to
pcduino3-nano:led3:usr and pcduino3-nano:led4:usr, but if you've got any
better suggestions then please let me know!

> > +&pio {
> > +	ahci_pwr_pin_a: ahci_pwr_pin@0 {
> > +		allwinner,pins = "PH2";
> > +	};
> We usually declare a whole new node for this one...
...
> > +&reg_ahci_5v {
> > +	gpio = <&pio 7 2 GPIO_ACTIVE_HIGH>; /* PH2 */
> ... and we override the pinctrl-0 property here.

Done -- I've followed lime2's example, which makes it looks the same as
I've done for reg_usb1_vbus.

> > +&uart0 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&uart0_pins_a>;
> > +	status = "okay";
> > +};
> > +
> > +&uart2 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&uart2_pins_a>;
> > +	status = "okay";
> > +};
> 
> You probably want aliases for these two UARTs.

Done: I've aliased serial0 = &uart0 and serial1 = &uart2. Should there
be aliases for I2C as well, since the same situation applies (i2c0 and
i2c2)?

More generally, is it correct to add nodes like these (uart2, spi0,
i2c2) for features that appear on the Arduino GPIO headers?

Thanks very much,

-- 
Adam Sampson <ats-G+91BasbrijYtjvyW6yDsg@public.gmane.org>                         <http://offog.org/>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
