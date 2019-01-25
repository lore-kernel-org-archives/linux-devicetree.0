From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v2 2/4] dt-bindings: gnss: add mediatek binding
Date: Fri, 25 Jan 2019 10:07:55 +0100
Message-ID: <20190125090755.GB3691@localhost>
References: <1547744074-28308-1-git-send-email-lollivier@baylibre.com>
 <1547744074-28308-3-git-send-email-lollivier@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1547744074-28308-3-git-send-email-lollivier@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Loys Ollivier <lollivier@baylibre.com>
Cc: devicetree@vger.kernel.org, Johan Hovold <johan@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 17, 2019 at 05:54:32PM +0100, Loys Ollivier wrote:
> Add binding for Mediatek-based GNSS receivers.
> 
> Signed-off-by: Loys Ollivier <lollivier@baylibre.com>
> ---
> 
> v2:
> Renamed bindings from Globaltop/gtop to Mediatek/mtk.
> Moved current-speed as an optional propertie.
> Removed the status line in the example.
> Added "mediatek,mt3339" compatible.
> 
>  .../devicetree/bindings/gnss/mediatek.txt          | 39 ++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gnss/mediatek.txt
> 
> diff --git a/Documentation/devicetree/bindings/gnss/mediatek.txt b/Documentation/devicetree/bindings/gnss/mediatek.txt
> new file mode 100644
> index 000000000000..fd984b4a9a6d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gnss/mediatek.txt
> @@ -0,0 +1,39 @@
> +Mediatek-based GNSS Receiver DT binding
> +
> +Mediatek chipsets are used in GNSS-receiver modules produced by several
> +vendors and can use UART, SPI or I2C interfaces.
> +
> +Please see Documentation/devicetree/bindings/gnss/gnss.txt for generic
> +properties.
> +
> +Required properties:
> +
> +- compatible	: Must be one of
> +
> +			"globaltop,pa6h"
> +			"mediatek,mt3339"

I'm not sure it makes sense to add the GPS chip itself as it cannot be
used stand-alone AFAIU, and either not way would require a lot more
resources to be defined than what you add to this binding.

> +
> +- vcc-supply	: Main voltage regulator (pin name: 3V3_IN, VCC, VDD)

The pin names in parenthesis were copied from the sirf-star binding and
were used to capture the various names given to this supply by different
vendors. Please drop as it doesn't apply here.

> +
> +Required properties (I2C):
> +- reg		: I2C slave address
> +
> +Required properties (SPI):
> +- reg		: SPI chip select address

While the mt3339 appears to support these interfaces, the globaltop one
does not.

Have you looked around for a small sample of mt3339-based receivers, to
see whether anyone actually provides these?

> +Optional properties:
> +
> +- timepulse-gpios	: Time pulse GPIO
> +- v-bckp-supply		: Backup voltage regulator
> +- current-speed		: Default UART baud rate

Looks like you forgot the optional NRESET input and 3D-FIX output (even
if the latter might be of limited use).

> +
> +Example:
> +
> +serial@1234 {
> +	compatible = "ns16550a";
> +
> +	gnss {
> +		compatible = "globaltop,pa6h";
> +		vcc-supply = <&vcc_3v3>;
> +	};
> +};

Johan
