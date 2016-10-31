From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] ARM: bus: da8xx-mstpri: new driver
Date: Sun, 30 Oct 2016 23:30:16 -0500
Message-ID: <20161031043015.74ppaship5nqfaqt@rob-hp-laptop>
References: <1477503355-2600-1-git-send-email-bgolaszewski@baylibre.com>
 <1477503355-2600-3-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1477503355-2600-3-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Russell King <linux@armlinux.org.uk>, LKML <linux-kernel@vger.kernel.org>, arm-soc <linux-arm-kernel@lists.infradead.org>, linux-drm <dri-devel@lists.freedesktop.org>, linux-devicetree <devicetree@vger.kernel.org>, Jyri Sarha <jsarha@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, David Airlie <airlied@linux.ie>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 26, 2016 at 07:35:55PM +0200, Bartosz Golaszewski wrote:
> Create the driver for the da8xx master peripheral priority
> configuration and implement support for writing to the three
> Master Priority registers on da850 SoCs.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  .../devicetree/bindings/bus/ti,da850-mstpri.txt    |  20 ++
>  drivers/bus/Kconfig                                |   9 +
>  drivers/bus/Makefile                               |   2 +
>  drivers/bus/da8xx-mstpri.c                         | 266 +++++++++++++++++++++
>  4 files changed, 297 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bus/ti,da850-mstpri.txt
>  create mode 100644 drivers/bus/da8xx-mstpri.c
> 
> diff --git a/Documentation/devicetree/bindings/bus/ti,da850-mstpri.txt b/Documentation/devicetree/bindings/bus/ti,da850-mstpri.txt
> new file mode 100644
> index 0000000..225af09
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/ti,da850-mstpri.txt
> @@ -0,0 +1,20 @@
> +* Device tree bindings for Texas Instruments da8xx master peripheral
> +  priority driver
> +
> +DA8XX SoCs feature a set of registers allowing to change the priority of all
> +peripherals classified as masters.
> +
> +Documentation:
> +OMAP-L138 (DA850) - http://www.ti.com/lit/ug/spruh82c/spruh82c.pdf
> +
> +Required properties:
> +
> +- compatible:		"ti,da850-mstpri", "syscon" - for da850 based boards

Drop syscon. Doesn't look like it is needed and the example doesn't 
match.

> +- reg:			offset and length of the mstpri registers
> +
> +Example for da850-lcdk is shown below.
> +
> +mstpri {
> +	compatible = "ti,da850-mstpri";
> +	reg = <0x14110 0x0c>;
> +};
