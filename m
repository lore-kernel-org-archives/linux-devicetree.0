Return-Path: <robherring2@gmail.com>
Date: Tue, 14 May 2019 13:19:22 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: leds: Add binding for spi-byte LED.
Message-ID: <20190514181922.GA24534@bogus>
References: <20190513193307.11591-1-oss@c-mauderer.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190513193307.11591-1-oss@c-mauderer.de>
To: oss@c-mauderer.de
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

On Mon, 13 May 2019 21:33:06 +0200, oss@c-mauderer.de wrote:
> From: Christian Mauderer <oss@c-mauderer.de>
> 
> This patch adds the binding documentation for a simple SPI based LED
> controller which use only one byte for setting the brightness.
> 
> Signed-off-by: Christian Mauderer <oss@c-mauderer.de>
> ---
> 
> Changes compared to v3:
> - rename binding to ubnt,acb-spi-led
> - rewrite description to fit the new binding
> - remove off-value and max-value - now determined depending on the compatible
>   string
> - add 'default-state'
> 
> Changes compared to v2:
> - None
> 
> Changes compared to v1:
> - rename ubnt-spi to leds-spi-byte
> - rename "ubnt-spi,off_bright" and "ubnt-spi,max_bright" to
>   "leds-spi-byte,off-value" and "leds-spi-byte,max-value" and mark them required
> - rename led-controller node to "led-controller"
> - extend description
> - remove SPI controller
> - use "white:status" for the example label
> 
>  .../bindings/leds/leds-spi-byte.txt           | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-spi-byte.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
