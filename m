From: Robin van der Gracht <robin@protonic.nl>
Subject: Re: [PATCH v4 2/2] auxdisplay: ht16k33: Driver for LED controller
Date: Mon, 21 Mar 2016 09:09:13 +0100
Message-ID: <20160321090913.08be4b45@erd979>
References: <cover.1458140954.git.robin@protonic.nl>
	<ae23cf26135a586440419aaa764f3a70de913c4a.1458140954.git.robin@protonic.nl>
	<20160318214217.GA12811@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160318214217.GA12811@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Thierry Reding <treding@nvidia.com>, Jonathan Cameron <jic23@kernel.org>, Lee Jones <lee.jones@linaro.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Stefan Wahren <stefan.wahren@i2se.com>, Philipp Zabel <philipp.zabel@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 18 Mar 2016 16:42:17 -0500
Rob Herring <robh@kernel.org> wrote:

> On Wed, Mar 16, 2016 at 04:52:09PM +0100, Robin van der Gracht wrote:
> > This is a driver for the Holtek HT16K33 RAM mapping LED controller
> > with keyscan.
> 
> Wrap your lines to less than 80 chars.

I must have missed that one..

> 
> > Signed-off-by: Robin van der Gracht <robin@protonic.nl>
> > ---
> > 
> > Changes in v4:
> >  - Removed trailing dot from patch title
> >  - Removed unused defines
> >  - Fixed brightness range (0 was presumed to be off but its 1/16
> > duty cycle)
> >  - No longer checking 'reschedule' before setting it in
> > ht16k33_keypad_scan()
> >  - Use more efficient ffs() to find changed rows in
> > ht16k33_keypad_scan()
> >  - Use BIT macro in ht16k33_keypad_scan()
> >  - Removed extra space in return line from ht16k33_bl_check_fb()
> >  - Removed redundant 'Out of Memory' prints from ht16k33_probe()
> >  - Changed bustype from BUS_HOST to BUS_I2C
> > 
> >  .../devicetree/bindings/display/ht16k33.txt        |  42 ++
> >  drivers/auxdisplay/Kconfig                         |   9 +
> >  drivers/auxdisplay/Makefile                        |   1 +
> >  drivers/auxdisplay/ht16k33.c                       | 563
> > +++++++++++++++++++++ 4 files changed, 615 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/display/ht16k33.txt create mode
> > 100644 drivers/auxdisplay/ht16k33.c
> > 
> > diff --git a/Documentation/devicetree/bindings/display/ht16k33.txt
> > b/Documentation/devicetree/bindings/display/ht16k33.txt new file
> > mode 100644 index 0000000..20ef996
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/ht16k33.txt
> > @@ -0,0 +1,42 @@
> > +Holtek ht16k33 RAM mapping 16*8 LED controller driver with keyscan
> > +-------------------------------------------------------------------------------
> > +
> > +Required properties:
> > +- compatible:		"ht,ht16k33"
> > +- reg:			I2C slave address of the chip.
> > +- interrupt-parent:	A phandle pointing to the interrupt
> > controller\
> 
> Drop the \

Will do.

> 
> > +			serving the interrupt for this chip.
> > +- interrupts:		Interrupt specification for the key
> > pressed interrupt. +- refresh-rate-hz:	Display update
> > interval in HZ. +- debounce-delay-ms:	Debouncing interval
> > time in microseconds. +- linux,keymap: 	The keymap for keys
> > as described in the binding
> > +			document
> > (devicetree/bindings/input/matrix-keymap.txt). +
> > +Optional properties:
> > +- linux,no-autorepeat:	Disable keyrepeat.
> > +- default-brightness-level: Initial brightness level [0-15]
> > (default: 15). +
> > +Example:
> > +
> > +&i2c1 {
> > +	ht16k33: ht16k33@70 {
> > +		compatible = "ht,ht16k33";
> > +		reg = <0x70>;
> > +		refresh-rate-hz = <20>;
> > +		debounce-delay-ms = <50>;
> > +		interrupt-parent = <&gpio4>;
> > +		interrupts = <5 (IRQ_TYPE_LEVEL_HIGH |
> > IRQ_TYPE_EDGE_RISING)>;
> > +		linux,keymap = <
> > +			MATRIX_KEY(2, 0, KEY_F6)
> > +			MATRIX_KEY(3, 0, KEY_F8)
> > +			MATRIX_KEY(4, 0, KEY_F0)
> > +			MATRIX_KEY(5, 0, KEY_F4)
> > +			MATRIX_KEY(6, 0, KEY_F2)
> > +			MATRIX_KEY(2, 1, KEY_F5)
> > +			MATRIX_KEY(3, 1, KEY_F7)
> > +			MATRIX_KEY(4, 1, KEY_F9)
> > +			MATRIX_KEY(5, 1, KEY_F3)
> > +			MATRIX_KEY(6, 1, KEY_F1)
> > +		>;
> > +	};
> > +};

Best regards,

-- 
Robin van der Gracht
Protonic Holland
