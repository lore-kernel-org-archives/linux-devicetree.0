From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v4 8/8] dt-bindings: Add max12xx SPI ADC series as
 trivial devices
Date: Sat, 12 Oct 2019 12:32:58 +0100
Message-ID: <20191012123258.67734ca7@archlinux>
References: <20191011144347.19146-1-miquel.raynal@bootlin.com>
        <20191011144347.19146-9-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191011144347.19146-9-miquel.raynal@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: devicetree@vger.kernel.org

On Fri, 11 Oct 2019 16:43:47 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Update the compatible list with three Maxim ADCs compatibles.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Applied to the togreg branch of iio.git and pushed out as testing
for the autobuilders to poke at it.

Thanks,

Jonathan

> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> index e0095ecb472f..765fd1c170df 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -120,6 +120,12 @@ properties:
>            - maxim,max1029
>              # 10-bit 16 channels 300ks/s SPI ADC with temperature sensor
>            - maxim,max1031
> +            # 12-bit 8 channels 300ks/s SPI ADC with temperature sensor
> +          - maxim,max1227
> +            # 12-bit 12 channels 300ks/s SPI ADC with temperature sensor
> +          - maxim,max1229
> +            # 12-bit 16 channels 300ks/s SPI ADC with temperature sensor
> +          - maxim,max1231
>              # Low-Power, 4-/12-Channel, 2-Wire Serial, 12-Bit ADCs
>            - maxim,max1237
>              # PECI-to-I2C translator for PECI-to-SMBus/I2C protocol conversion
