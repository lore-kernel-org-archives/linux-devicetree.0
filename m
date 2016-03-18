From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 2/2] auxdisplay: ht16k33: Driver for LED controller
Date: Fri, 18 Mar 2016 16:42:17 -0500
Message-ID: <20160318214217.GA12811@rob-hp-laptop>
References: <cover.1458140954.git.robin@protonic.nl>
 <ae23cf26135a586440419aaa764f3a70de913c4a.1458140954.git.robin@protonic.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <ae23cf26135a586440419aaa764f3a70de913c4a.1458140954.git.robin-/Q/L1SwJa3aEVqv0pETR8A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robin van der Gracht <robin-/Q/L1SwJa3aEVqv0pETR8A@public.gmane.org>
Cc: Miguel Ojeda Sandonis <miguel.ojeda.sandonis-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 16, 2016 at 04:52:09PM +0100, Robin van der Gracht wrote:
> This is a driver for the Holtek HT16K33 RAM mapping LED controller with keyscan.

Wrap your lines to less than 80 chars.

> Signed-off-by: Robin van der Gracht <robin-/Q/L1SwJa3aEVqv0pETR8A@public.gmane.org>
> ---
> 
> Changes in v4:
>  - Removed trailing dot from patch title
>  - Removed unused defines
>  - Fixed brightness range (0 was presumed to be off but its 1/16 duty cycle)
>  - No longer checking 'reschedule' before setting it in ht16k33_keypad_scan()
>  - Use more efficient ffs() to find changed rows in ht16k33_keypad_scan()
>  - Use BIT macro in ht16k33_keypad_scan()
>  - Removed extra space in return line from ht16k33_bl_check_fb()
>  - Removed redundant 'Out of Memory' prints from ht16k33_probe()
>  - Changed bustype from BUS_HOST to BUS_I2C
> 
>  .../devicetree/bindings/display/ht16k33.txt        |  42 ++
>  drivers/auxdisplay/Kconfig                         |   9 +
>  drivers/auxdisplay/Makefile                        |   1 +
>  drivers/auxdisplay/ht16k33.c                       | 563 +++++++++++++++++++++
>  4 files changed, 615 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ht16k33.txt
>  create mode 100644 drivers/auxdisplay/ht16k33.c
> 
> diff --git a/Documentation/devicetree/bindings/display/ht16k33.txt b/Documentation/devicetree/bindings/display/ht16k33.txt
> new file mode 100644
> index 0000000..20ef996
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/ht16k33.txt
> @@ -0,0 +1,42 @@
> +Holtek ht16k33 RAM mapping 16*8 LED controller driver with keyscan
> +-------------------------------------------------------------------------------
> +
> +Required properties:
> +- compatible:		"ht,ht16k33"
> +- reg:			I2C slave address of the chip.
> +- interrupt-parent:	A phandle pointing to the interrupt controller\

Drop the \

> +			serving the interrupt for this chip.
> +- interrupts:		Interrupt specification for the key pressed interrupt.
> +- refresh-rate-hz:	Display update interval in HZ.
> +- debounce-delay-ms:	Debouncing interval time in microseconds.
> +- linux,keymap: 	The keymap for keys as described in the binding
> +			document (devicetree/bindings/input/matrix-keymap.txt).
> +
> +Optional properties:
> +- linux,no-autorepeat:	Disable keyrepeat.
> +- default-brightness-level: Initial brightness level [0-15] (default: 15).
> +
> +Example:
> +
> +&i2c1 {
> +	ht16k33: ht16k33@70 {
> +		compatible = "ht,ht16k33";
> +		reg = <0x70>;
> +		refresh-rate-hz = <20>;
> +		debounce-delay-ms = <50>;
> +		interrupt-parent = <&gpio4>;
> +		interrupts = <5 (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_EDGE_RISING)>;
> +		linux,keymap = <
> +			MATRIX_KEY(2, 0, KEY_F6)
> +			MATRIX_KEY(3, 0, KEY_F8)
> +			MATRIX_KEY(4, 0, KEY_F0)
> +			MATRIX_KEY(5, 0, KEY_F4)
> +			MATRIX_KEY(6, 0, KEY_F2)
> +			MATRIX_KEY(2, 1, KEY_F5)
> +			MATRIX_KEY(3, 1, KEY_F7)
> +			MATRIX_KEY(4, 1, KEY_F9)
> +			MATRIX_KEY(5, 1, KEY_F3)
> +			MATRIX_KEY(6, 1, KEY_F1)
> +		>;
> +	};
> +};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
