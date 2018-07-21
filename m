From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH] dt-bindings: iio: sigma-delta-modulator: fix
 unit-address in example
Date: Sat, 21 Jul 2018 17:16:26 +0100
Message-ID: <20180721171626.69fb20cf@archlinux>
References: <1532011910-11641-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1532011910-11641-1-git-send-email-fabrice.gasnier@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, arnaud.pouliquen@st.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 19 Jul 2018 16:51:50 +0200
Fabrice Gasnier <fabrice.gasnier@st.com> wrote:

> Device tree compiler gives a warning if a device node has "@"
> but no reg property.
> Fix the example in iio: adc: sigma-delta-modulator.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
Applied to the togreg branch of iio.git and pushed out as testing
to be completely ignored by the autobuilders.

Thanks,

Jonathan

> ---
>  Documentation/devicetree/bindings/iio/adc/sigma-delta-modulator.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/sigma-delta-modulator.txt b/Documentation/devicetree/bindings/iio/adc/sigma-delta-modulator.txt
> index ba24ca7..59b92cd 100644
> --- a/Documentation/devicetree/bindings/iio/adc/sigma-delta-modulator.txt
> +++ b/Documentation/devicetree/bindings/iio/adc/sigma-delta-modulator.txt
> @@ -7,7 +7,7 @@ Required properties:
>  
>  Example node:
>  
> -	ads1202: adc@0 {
> +	ads1202: adc {
>  		compatible = "sd-modulator";
>  		#io-channel-cells = <0>;
>  	};
