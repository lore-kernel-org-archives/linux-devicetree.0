From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] DT/arm,gic-v3: Update the ITS size in the examples
Date: Tue, 3 Oct 2017 15:53:33 +0100
Message-ID: <20171003145333.GE4931@leverpostej>
References: <20171003142027.23243-1-julien.grall@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171003142027.23243-1-julien.grall@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Julien Grall <julien.grall@linaro.org>, marc.zyngier@arm.com
Cc: robh+dt@kernel.org, jason@lakedaemon.net, tglx@linutronix.de, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 03, 2017 at 03:20:27PM +0100, Julien Grall wrote:
> Currently, the examples are using 2MB for the ITS size. Per the
> specification (section 8.18 in ARM IHI 0069D), the ITS address map is
> 128KB.
> 
> Update the examples to match the specification.
> 
> Signed-off-by: Julien Grall <julien.grall@linaro.org>

This looks sane to me, per my reading of that section of the spec.

Marc, was there some reason we used such a large size? Or was the extra
zero unintentional?

Thanks,
Mark.

> ---
>  .../devicetree/bindings/interrupt-controller/arm,gic-v3.txt         | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt
> index 4c29cdab0ea5..5eb108e180fa 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt
> @@ -99,7 +99,7 @@ Examples:
>  			compatible = "arm,gic-v3-its";
>  			msi-controller;
>  			#msi-cells = <1>;
> -			reg = <0x0 0x2c200000 0 0x200000>;
> +			reg = <0x0 0x2c200000 0 0x20000>;
>  		};
>  	};
>  
> @@ -124,14 +124,14 @@ Examples:
>  			compatible = "arm,gic-v3-its";
>  			msi-controller;
>  			#msi-cells = <1>;
> -			reg = <0x0 0x2c200000 0 0x200000>;
> +			reg = <0x0 0x2c200000 0 0x20000>;
>  		};
>  
>  		gic-its@2c400000 {
>  			compatible = "arm,gic-v3-its";
>  			msi-controller;
>  			#msi-cells = <1>;
> -			reg = <0x0 0x2c400000 0 0x200000>;
> +			reg = <0x0 0x2c400000 0 0x20000>;
>  		};
>  
>  		ppi-partitions {
> -- 
> 2.11.0
> 
