From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] spi: dw-mmio: add oftree support
Date: Fri, 14 Mar 2014 16:14:03 +0000
Message-ID: <20140314161403.GN25870@e106331-lin.cambridge.arm.com>
References: <1394787326-14520-1-git-send-email-s.trumtrar@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1394787326-14520-1-git-send-email-s.trumtrar@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Rob Landley <rob@landley.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 14, 2014 at 08:55:26AM +0000, Steffen Trumtrar wrote:
> Allow probing the dw-mmio from devicetree.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
> This was tested on Socfpga and v3.14-rc6
> 
>  .../devicetree/bindings/spi/spi-dw-mmio.txt        | 25 ++++++++++++++++++++++
>  drivers/spi/spi-dw-mmio.c                          | 19 +++++++++++++++-
>  2 files changed, 43 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/spi/spi-dw-mmio.txt
> 
> diff --git a/Documentation/devicetree/bindings/spi/spi-dw-mmio.txt b/Documentation/devicetree/bindings/spi/spi-dw-mmio.txt
> new file mode 100644
> index 0000000..2b9bb90
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/spi-dw-mmio.txt
> @@ -0,0 +1,25 @@
> +Synopsys DesignWare SPI master controller.
> +
> +Required properties:
> +- compatible : "snps,dw-spi-mmio"

Is there not a better name than "dw-spi-mmio"?

What's the full name of the device, as on a datasheet? Is there no model
number?

Otherwise this looks ok.

> +- reg : The register base for the controller.
> +- interrupts : One interrupt, used by the controller.
> +- #address-cells : <1>, as required by generic SPI binding.
> +- #size-cells : <0>, also as required by generic SPI binding.
> +
> +Optional properties:
> +- num-chipselects : The number of chipselects.

If this is optional, when wuold I need to set this? What's the default
assumption?

Mark: I see some bindings have "num-chipselects", and some have
"num-cs". Do you have a preferred form that people could align on?

Cheers,
Mark.
