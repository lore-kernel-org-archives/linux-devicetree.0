From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH] dt-bindings: iio: accel: use a generic node name for
 lis302
Date: Sat, 8 Dec 2018 11:09:17 +0000
Message-ID: <20181208110917.2dfc438f@archlinux>
References: <20181203114740.637091-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181203114740.637091-1-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Lubomir Rintel <lkundrak@v3.sk>
Cc: Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon,  3 Dec 2018 12:47:40 +0100
Lubomir Rintel <lkundrak@v3.sk> wrote:

> The example should follow the practice or using a generic node name
> instead of the precise programming model, as recommended by the DTSpec.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
Applied to the togreg branch of iio.git and pushed out as testing
to be largely ignored.

Thanks,

Jonathan

> ---
>  Documentation/devicetree/bindings/iio/accel/lis302.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/accel/lis302.txt b/Documentation/devicetree/bindings/iio/accel/lis302.txt
> index dfdce67826ba..764e28ec1a0a 100644
> --- a/Documentation/devicetree/bindings/iio/accel/lis302.txt
> +++ b/Documentation/devicetree/bindings/iio/accel/lis302.txt
> @@ -64,7 +64,7 @@ Optional properties for all bus drivers:
>  
>  Example for a SPI device node:
>  
> -	lis302@0 {
> +	accelerometer@0 {
>  		compatible = "st,lis302dl-spi";
>  		reg = <0>;
>  		spi-max-frequency = <1000000>;
> @@ -89,7 +89,7 @@ Example for a SPI device node:
>  
>  Example for a I2C device node:
>  
> -	lis331dlh: lis331dlh@18 {
> +	lis331dlh: accelerometer@18 {
>  		compatible = "st,lis331dlh", "st,lis3lv02d";
>  		reg = <0x18>;
>  		Vdd-supply = <&lis3_reg>;
