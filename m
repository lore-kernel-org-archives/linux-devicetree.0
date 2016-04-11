From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 2/2] auxdisplay: ht16k33: Driver for LED controller
Date: Mon, 11 Apr 2016 09:49:56 -0500
Message-ID: <20160411144956.GA26808@rob-hp-laptop>
References: <cover.1460018947.git.robin@protonic.nl>
 <e5324c8257d2ed8e464552a0900271a4f76bff9d.1460018947.git.robin@protonic.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <e5324c8257d2ed8e464552a0900271a4f76bff9d.1460018947.git.robin-/Q/L1SwJa3aEVqv0pETR8A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robin van der Gracht <robin-/Q/L1SwJa3aEVqv0pETR8A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Miguel Ojeda Sandonis <miguel.ojeda.sandonis-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Apr 07, 2016 at 10:54:01AM +0200, Robin van der Gracht wrote:
> Added a driver for the Holtek HT16K33 LED controller with keyscan.
> 
> Signed-off-by: Robin van der Gracht <robin-/Q/L1SwJa3aEVqv0pETR8A@public.gmane.org>
> ---
> Changes in v5:
>  - Updated compatible string
>  - the HT16K33_FB_SIZE define now uses BYTES_PER_ROW as multiplier instead of 2
>  - Dropped a trailing '\' in ht16k33.txt
>  - Shortened commit message (exceeded 80 chars in v4) 
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
> index 0000000..d9694b7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/ht16k33.txt
> @@ -0,0 +1,42 @@
> +Holtek ht16k33 RAM mapping 16*8 LED controller driver with keyscan
> +-------------------------------------------------------------------------------
> +
> +Required properties:
> +- compatible:		"holtek,ht16k33"
> +- reg:			I2C slave address of the chip.
> +- interrupt-parent:	A phandle pointing to the interrupt controller
> +			serving the interrupt for this chip.
> +- interrupts:		Interrupt specification for the key pressed interrupt.
> +- refresh-rate-hz:	Display update interval in HZ.
> +- debounce-delay-ms:	Debouncing interval time in microseconds.

'-ms' is milliseconds, but you have usec...         ^^^^^^^^^^^^

Otherwise,

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
