From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] input: keyboard: Add devicetree support for lm8333
Date: Mon, 31 Oct 2016 00:32:27 -0500
Message-ID: <20161031053227.n7lsmo6fgxbl2qze@rob-hp-laptop>
References: <1477595854-9059-1-git-send-email-gordan.markus@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1477595854-9059-1-git-send-email-gordan.markus-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gordan Markus <gordan.markus-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 27, 2016 at 09:17:34PM +0200, Gordan Markus wrote:
> This adds LM8333 devicetree parsing for the keypad part.
> Optional properties to specify the keypad driver active
> time and debounce time.
> 
> Signed-off-by: Gordan Markuš <gordan.markus-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  .../devicetree/bindings/input/ti,lm8333.txt        | 45 ++++++++++++++++++

It is preferred that bindings be a separate patch.

>  drivers/input/keyboard/lm8333.c                    | 54 ++++++++++++++++++++++
>  2 files changed, 99 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/ti,lm8333.txt
> 
> diff --git a/Documentation/devicetree/bindings/input/ti,lm8333.txt b/Documentation/devicetree/bindings/input/ti,lm8333.txt
> new file mode 100644
> index 0000000..4100d48
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/ti,lm8333.txt
> @@ -0,0 +1,45 @@
> +LM8333 Keypad
> +
> +Required properties:
> +- compatible: Compatible property value should be "ti,lm8333".
> +
> +- reg: Physical base address of the peripheral and length of memory mapped
> +  region.
> +
> +- interrupts: The interrupt number for the peripheral.
> +
> +- linux,keymap: The keymap to use
> +	(see Documentation/devicetree/bindings/input/matrix-keymap.txt)
> +
> +Optional properties:
> +- ti,active-time: Specify the time during which the keypad is scanned after
> +	the last key is released, before entering Halt mode.
> +	The active time must be longer than the debounce time.
> +	Default 500 ms.

Add a unit suffix.

> +
> +- ti,debounce-time: Specify the keypad debounce time.
> +	This can be used for reliable scanning of keyboards with noisy contacts.
> +	Default 10 ms.

Don't we have a common property for this?

> +
> +Example:
> +input {
> +	compatible = "ti,lm8333";
> +	reg = <0x51>;
> +	interrupts = <5>;
> +
> +	ti,active-time = <750>;
> +	ti,debounce-time = <20>;
> +
> +	linux,keymap = <
> +			0x0001001e
> +			0x00020030
> +			0x0003002e
> +			0x00040020
> +			0x00050012
> +			0x00060021
> +			0x00070022
> +			0x00080023
> +			0x01010017
> +			0x01020024
> +			0x01030025>;
> +};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
