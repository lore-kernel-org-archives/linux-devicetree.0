Return-Path: <SRS0=iPPE=SA=gmail.com=groeck7@kernel.org>
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 29 Mar 2019 09:52:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] dt-bindings: hwmon: (adc128d818) Specify ti,mode
 property size
Message-ID: <20190329165221.GA28218@roeck-us.net>
References: <20190313141125.GA26062@carlosaurelio.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190313141125.GA26062@carlosaurelio.net>
To: Carlos Menin <menin@carlosaurelio.net>
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, Mar 13, 2019 at 11:11:26AM -0300, Carlos Menin wrote:
> By default, cells in DT are 32-bit in size. The driver reads "ti,mode"
> using the function of_property_read_u8() which causes the value to be
> read incorrectly in little-endian architectures if the size is not
> specified.
> 
> Make it explicit in the binding documentation that this prorperty must
> be set as a 8-bit value.
> 
> Signed-off-by: Carlos Menin <menin@carlosaurelio.net>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied.

Thanks,
Guenter

> ---
>  Documentation/devicetree/bindings/hwmon/adc128d818.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/adc128d818.txt b/Documentation/devicetree/bindings/hwmon/adc128d818.txt
> index 08bab0e..d0ae46d 100644
> --- a/Documentation/devicetree/bindings/hwmon/adc128d818.txt
> +++ b/Documentation/devicetree/bindings/hwmon/adc128d818.txt
> @@ -26,7 +26,7 @@ Required node properties:
>  
>  Optional node properties:
>  
> - - ti,mode:     Operation mode (see above).
> + - ti,mode:     Operation mode (u8) (see above).
>  
>  
>  Example (operation mode 2):
> @@ -34,5 +34,5 @@ Example (operation mode 2):
>  	adc128d818@1d {
>  		compatible = "ti,adc128d818";
>  		reg = <0x1d>;
> -		ti,mode = <2>;
> +		ti,mode = /bits/ 8 <2>;
>  	};
