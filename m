From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH 09/10] ARM: mvebu: add Device Tree files for Armada 39x
 SoC and board
Date: Fri, 20 Feb 2015 15:14:55 +0100
Message-ID: <20150220151455.461b97bb@free-electrons.com>
References: <1423238276-9206-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<1423238276-9206-10-git-send-email-thomas.petazzoni@free-electrons.com>
	<20150206172153.GY25985@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20150206172153.GY25985@lunn.ch>
Sender: linux-gpio-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Mike Turquette <mturquette@linaro.org>, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Nadav Haklai <nadavh@marvell.com>, linux-gpio@vger.kernel.org, Lior Amsalem <alior@marvell.com>, Rob Herring <robh+dt@kernel.org>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Kumar Gala <galak@codeaurora.org>, Gregory Clement <gregory.clement@free-electrons.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Tawfik Bayouk <tawfik@marvell.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Dear Andrew Lunn,

On Fri, 6 Feb 2015 18:21:53 +0100, Andrew Lunn wrote:

> > +	chosen {
> > +		bootargs = "console=ttyS0,115200 earlyprintk";
> > +	};
> > +
> 
> Arnd has been encouraging people not use earlyprintk here.  Also a
> stdout-path would be nice. We also seem to be missing aliases for the
> serial ports.

Right.


> > +		internal-regs {
> > +                        i2c@11000 {
> > +				pinctrl-0 = <&i2c0_pins>;
> > +				pinctrl-names = "default";
> > +                                status = "okay";
> > +                                clock-frequency = <100000>;
> > +                        };
> > +
> > +			serial@12000 {
> > +				pinctrl-0 = <&uart0_pins>;
> > +				pinctrl-names = "default";
> > +				status = "okay";
> > +			};
> > +
> 
> Tab vs space issue here somewhere? Probably the i2c node.

Yes, fixed.

> > +			pinctrl@18000 {
> > +				uart0_pins: uart0-pins {
> > +					marvell,pins = "mpp0", "mpp1";
> > +					marvell,function = "ua0";
> > +				};
> > +
> > +				uart1_pins: uart1-pins {
> > +					marvell,pins = "mpp19", "mpp20";
> > +					marvell,function = "ua1";
> > +				};
> 
> Does it make sense to put there in the .dtsi file? I know there are
> other choices, but generally board manufacturers tend to follow the
> reference design.

I am not really convinced here: there are really many possible pin
muxing possibilities. Various pins for UART0 and UART1, whether you use
CTS/RTS or not, etc. I believe this is really the sort of pin mux
configuration that is best left at the board level.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
