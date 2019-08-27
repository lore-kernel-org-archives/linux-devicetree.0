Return-Path: <SRS0=vyAp=WX=xilinx.com=michals@kernel.org>
Subject: Re: [PATCH 1/2] dt-binding: iio: Add optional label property
References: <1566876924-63608-1-git-send-email-preid@electromag.com.au>
 <1566876924-63608-2-git-send-email-preid@electromag.com.au>
From: Michal Simek <michal.simek@xilinx.com>
Message-ID: <b4b8d01f-67c3-2a6f-e7f6-ead6cbaa6d46@xilinx.com>
Date: Tue, 27 Aug 2019 08:10:55 +0200
MIME-Version: 1.0
In-Reply-To: <1566876924-63608-2-git-send-email-preid@electromag.com.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Phil Reid <preid@electromag.com.au>, jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, robh+dt@kernel.org, mark.rutland@arm.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, michal.simek@xilinx.com
List-ID: <devicetree@vger.kernel.org>

On 27. 08. 19 5:35, Phil Reid wrote:
> This optional property defines a symbolic name for the device.
> 
> Signed-off-by: Phil Reid <preid@electromag.com.au>
> ---
>  Documentation/devicetree/bindings/iio/iio-bindings.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/iio-bindings.txt b/Documentation/devicetree/bindings/iio/iio-bindings.txt
> index 68d6f8ce063b..ffeae5aad8b5 100644
> --- a/Documentation/devicetree/bindings/iio/iio-bindings.txt
> +++ b/Documentation/devicetree/bindings/iio/iio-bindings.txt
> @@ -18,12 +18,17 @@ Required properties:
>  		   with a single IIO output and 1 for nodes with multiple
>  		   IIO outputs.
>  
> +Optional properties:
> +label:		   A symbolic name for the device.
> +
> +
>  Example for a simple configuration with no trigger:
>  
>  	adc: voltage-sensor@35 {
>  		compatible = "maxim,max1139";
>  		reg = <0x35>;
>  		#io-channel-cells = <1>;
> +		label = "adc_voltage_sensor";
>  	};
>  
>  Example for a configuration with trigger:
> 

Suggested-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal
