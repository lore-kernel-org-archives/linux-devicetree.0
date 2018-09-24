Return-Path: <robherring2@gmail.com>
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/4] Input: egalax_ts - add property for protocol version
Message-ID: <20180924222844.GA10118@bogus>
References: <20180920142256.2788-1-l.stach@pengutronix.de>
 <20180920142256.2788-3-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180920142256.2788-3-l.stach@pengutronix.de>
Date: Mon, 24 Sep 2018 15:28:56 -0700
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, patchwork-lst@pengutronix.de, kernel@pengutronix.de, Chris Healy <cphealy@gmail.com>
List-ID: <devicetree@vger.kernel.org>

On Thu, Sep 20, 2018 at 04:22:55PM +0200, Lucas Stach wrote:
> EETI changed the i2c protocol in an incompatible way at some point. The
> documentation doesn't state if there is a way to autodetect the used
> protocol. Thus we introduce a DT property to let the driver know about
> the protocol version used by the touch controller.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  .../devicetree/bindings/input/touchscreen/egalax-ts.txt   | 8 ++++++++
>  drivers/input/touchscreen/egalax_ts.c                     | 4 ++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/egalax-ts.txt b/Documentation/devicetree/bindings/input/touchscreen/egalax-ts.txt
> index 92fb2620f5e2..41be6287589d 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/egalax-ts.txt
> +++ b/Documentation/devicetree/bindings/input/touchscreen/egalax-ts.txt
> @@ -7,6 +7,13 @@ Required properties:
>  - wakeup-gpios: the gpio pin to be used for waking up the controller
>    and also used as irq pin
>  
> +Optional properties:
> +- eeti,protocol-version: protocol version used by the controller
> +	0: This is the default protocol used when the property is absent. This
> +	protocol supports up to 5 touch points with 1 points per report.
> +	1: Protocol supports up to 10 touch points with a maximum of 5 points
> +	per report.

This should be part of the compatible property. If we're not doing 
compatibles for each version of the chip, then we should at least do it 
for the protocol.

Rob
