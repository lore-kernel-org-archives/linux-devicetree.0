From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 7/7] dt-bindings: iio: adc: max1027: Document max12xx
 series compatibles
Date: Sun, 6 Oct 2019 11:27:51 +0100
Message-ID: <20191006112751.775fc849@archlinux>
References: <20191003173401.16343-1-miquel.raynal@bootlin.com>
        <20191003173401.16343-8-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191003173401.16343-8-miquel.raynal@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: devicetree@vger.kernel.org

On Thu,  3 Oct 2019 19:34:01 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Update the bindings documentation with new Maxim ADCs compatibles.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Both DT patches look fine to me... 

If you happened to fancy doing the yaml conversion it would be
appreciated... :) 

If not we'll get to this one one day.

Anyhow, a few trivial bits in the earlier patches so v3 should be
good to go.

Thanks,

Jonathan

> ---
>  .../devicetree/bindings/iio/adc/max1027-adc.txt        | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/max1027-adc.txt b/Documentation/devicetree/bindings/iio/adc/max1027-adc.txt
> index 7b23d68f655c..1b703a01d882 100644
> --- a/Documentation/devicetree/bindings/iio/adc/max1027-adc.txt
> +++ b/Documentation/devicetree/bindings/iio/adc/max1027-adc.txt
> @@ -1,7 +1,13 @@
> -* Maxim 1027/1029/1031 Analog to Digital Converter (ADC)
> +* Maxim 1027/1029/1031/1227/1229/1231 Analog to Digital Converter (ADC)
>  
>  Required properties:
> -  - compatible: Should be "maxim,max1027" or "maxim,max1029" or "maxim,max1031"
> +  - compatible: Should be one of:
> +    * "maxim,max1027"
> +    * "maxim,max1029"
> +    * "maxim,max1031"
> +    * "maxim,max1227"
> +    * "maxim,max1229"
> +    * "maxim,max1231"
>    - reg: SPI chip select number for the device
>  
>  Optional properties:
