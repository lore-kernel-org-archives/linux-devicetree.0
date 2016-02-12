From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] auxdisplay: ht16k33: Driver for LED controller.
Date: Fri, 12 Feb 2016 09:12:43 -0600
Message-ID: <20160212151243.GA21022@rob-hp-laptop>
References: <1455017468-4431-1-git-send-email-robin@protonic.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1455017468-4431-1-git-send-email-robin-/Q/L1SwJa3aEVqv0pETR8A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robin van der Gracht <robin-/Q/L1SwJa3aEVqv0pETR8A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Miguel Ojeda Sandonis <miguel.ojeda.sandonis-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 09, 2016 at 12:31:08PM +0100, Robin van der Gracht wrote:
> This is a driver for the Holtek HT16K33 LED controller with keyscan.
> 
> Signed-off-by: Robin van der Gracht <robin-/Q/L1SwJa3aEVqv0pETR8A@public.gmane.org>
> ---
> Changes in v2:
>   - Fixed build error reported by kbuild test robot by including mm.h
> 
>  .../devicetree/bindings/display/ht16k33.txt        |  42 ++
>  drivers/auxdisplay/Kconfig                         |   9 +
>  drivers/auxdisplay/Makefile                        |   1 +
>  drivers/auxdisplay/ht16k33.c                       | 573 +++++++++++++++++++++
>  4 files changed, 625 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ht16k33.txt
>  create mode 100644 drivers/auxdisplay/ht16k33.c
> 
> diff --git a/Documentation/devicetree/bindings/display/ht16k33.txt b/Documentation/devicetree/bindings/display/ht16k33.txt
> new file mode 100644
> index 0000000..45fbabb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/ht16k33.txt
> @@ -0,0 +1,42 @@
> +Holtek ht16k33 RAM mapping 16*8 LED controller driver with keyscan
> +-------------------------------------------------------------------------------
> +
> +Required properties:
> +- compatible:			"ht,ht16k33"
> +- reg:					I2C slave address of the chip.
> +- interrupt-parent: 	A phandle pointing to the interrupt controller
> +						serving the interrupt for this chip.
> +- interrupts:			Interrupt specification for the key pressed interrupt.
> +- refresh-rate:			Display update interval in HZ.

Add units: "-hz"

> +- debounce-delay-ms:	Debouncing interval time in microseconds.
> +- linux,keymap:			The keymap for keys as described in the binding
> +						document (devicetree/bindings/input/matrix-keymap.txt).

The alignment of the descriptions here seem to be random. Please line 
them up.

> +
> +Optional properties:
> +- linux,no-autorepeat:	Disable keyrepeat.
> +- default-brightness:	Initial brightness setting [0-15] (15 if not set).

default-brightness-level seem a bit more common.

> +
> +Example:
> +
> +&i2c1 {
> +	ht16k33: ht16k33@70 {
> +		compatible = "ht,ht16k33";
> +		reg = <0x70>;
> +		refresh-rate = <20>;
> +		debounce-delay-ms = <50>;
> +		interrupt-parent = <&gpio4>;
> +		interrupts = <5 (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_EDGE_RISING)>;
> +		linux,keymap = <
> +			   MATRIX_KEY(2, 0, KEY_F6)
> +			   MATRIX_KEY(3, 0, KEY_F8)
> +			   MATRIX_KEY(4, 0, KEY_F0)
> +			   MATRIX_KEY(5, 0, KEY_F4)
> +			   MATRIX_KEY(6, 0, KEY_F2)
> +			   MATRIX_KEY(2, 1, KEY_F5)
> +			   MATRIX_KEY(3, 1, KEY_F7)
> +			   MATRIX_KEY(4, 1, KEY_F9)
> +			   MATRIX_KEY(5, 1, KEY_F3)
> +			   MATRIX_KEY(6, 1, KEY_F1)
> +			   >;
> +	   };
> +};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
