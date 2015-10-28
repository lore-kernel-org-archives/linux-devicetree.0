From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/2] arm64: dts: Add BRCM IPROC NAND DT node for NS2
Date: Tue, 27 Oct 2015 17:19:20 -0700
Message-ID: <20151028001920.GY13239@google.com>
References: <1445577373-21252-1-git-send-email-anup.patel@broadcom.com>
 <1445577373-21252-3-git-send-email-anup.patel@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1445577373-21252-3-git-send-email-anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Linux MTD <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pramod KUMAR <pramodku-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Vikram Prakash <vikramp-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Sandeep Tripathy <tripathy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Linux ARM Kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Device Tree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 23, 2015 at 10:46:13AM +0530, Anup Patel wrote:
> The NAND controller on NS2 SoC is compatible with existing
> BRCM IPROC NAND driver so let's enable it in NS2 DT and
> NS2 SVK DT.
> 
> This patch also fixes use of node labels in ns2-svk.dts.
> 
> Signed-off-by: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Reviewed-by: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Reviewed-by: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> ---
>  arch/arm64/boot/dts/broadcom/ns2-svk.dts | 30 ++++++++++++++++++++----------
>  arch/arm64/boot/dts/broadcom/ns2.dtsi    | 14 ++++++++++++++
>  2 files changed, 34 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/broadcom/ns2-svk.dts b/arch/arm64/boot/dts/broadcom/ns2-svk.dts
> index e5950d5..6bb3d4d 100644
> --- a/arch/arm64/boot/dts/broadcom/ns2-svk.dts
> +++ b/arch/arm64/boot/dts/broadcom/ns2-svk.dts
> @@ -50,18 +50,28 @@
>  		device_type = "memory";
>  		reg = <0x000000000 0x80000000 0x00000000 0x40000000>;
>  	};
> +};
>  
> -	soc: soc {
> -		i2c0: i2c@66080000 {
> -			status = "ok";
> -		};
> +&i2c0 {
> +	status = "ok";
> +};
>  
> -		i2c1: i2c@660b0000 {
> -			status = "ok";
> -		};
> +&i2c1 {
> +	status = "ok";
> +};
> +
> +&uart3 {
> +	status = "ok";
> +};
>  
> -		uart3: serial@66130000 {
> -			status = "ok";
> -		};
> +&nand {
> +	nandcs@0 {
> +		compatible = "brcm,nandcs";
> +		reg = <0>;
> +		nand-ecc-mode = "hw";
> +		nand-ecc-strength = <8>;
> +		nand-ecc-step-size = <512>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
>  	};
>  };
> diff --git a/arch/arm64/boot/dts/broadcom/ns2.dtsi b/arch/arm64/boot/dts/broadcom/ns2.dtsi
> index f603277..9610822 100644
> --- a/arch/arm64/boot/dts/broadcom/ns2.dtsi
> +++ b/arch/arm64/boot/dts/broadcom/ns2.dtsi
> @@ -212,5 +212,19 @@
>  			compatible = "brcm,iproc-rng200";
>  			reg = <0x66220000 0x28>;
>  		};
> +
> +		nand: nand@66460000 {
> +			compatible = "brcm,nand-iproc", "brcm,brcmnand-v6.1";

Technically, the binding says you should also have "brcm,brcmnand" as a
last resort. Otherwise (for the NAND parts):

Reviewed-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

> +			reg = <0x66460000 0x600>,
> +			      <0x67015408 0x600>,
> +			      <0x66460f00 0x20>;
> +			reg-names = "nand", "iproc-idm", "iproc-ext";
> +			interrupts = <GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			brcm,nand-has-wp;
> +		};
>  	};
>  };
> -- 
> 1.9.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
