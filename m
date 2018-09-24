From: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 2/4] dts: arm64/sdm845: Add WCN3990 WLAN module device
 node
Date: Mon, 24 Sep 2018 10:11:49 -0700
Message-ID: <20180924171147.GA87119@ban.mtv.corp.google.com>
References: <20180921090907.25937-1-govinds@codeaurora.org>
 <20180921090907.25937-3-govinds@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180921090907.25937-3-govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, Sep 21, 2018 at 02:39:05PM +0530, Govind Singh wrote:
> Add device node for the ath10k SNOC platform driver probe
> and add resources required for WCN3990 on SDM845 soc.
> 
> Signed-off-by: Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-mtp.dts |  7 +++++++
>  arch/arm64/boot/dts/qcom/sdm845.dtsi    | 25 +++++++++++++++++++++++++
>  2 files changed, 32 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> index eedfaf8922e2..4de57f7df93c 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> @@ -440,3 +440,10 @@
>  		bias-pull-up;
>  	};
>  };
> +
> +&wifi {

As the bots have already told you, you missed adding a 'wifi' label to
sdm845.dtsi, so this reference doesn't compile.

> +	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
> +	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
> +	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
> +	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index e080072cdfdb..b0b107641e74 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -86,6 +86,11 @@
>  			reg = <0 0x86200000 0 0x2d00000>;
>  			no-map;
>  		};
> +
> +		wlan_msa_mem: reserved-memory@96700000 {
> +			no-map;
> +			reg = <0 0x96700000 0 0x100000>;
> +		};
>  	};
>  
>  	cpus {
> @@ -1200,5 +1205,25 @@
>  				status = "disabled";
>  			};
>  		};
> +
> +		qcom,wifi {

That's not a legit node name. Nodes should (a) have a generic name and
(b) include a unit address when the node contains a 'reg' property. [1]

So, how about 'wifi@18800000'? (And include the 'wifi:' label, since you
want to refer to it in other files.)

Also, this seems like the kind of device that should remain 'status =
"disabled"' in the top-level DTSI, and be overridden with 'status =
"okay"' in the child DTS.

Brian

[1] See:
https://elinux.org/Device_Tree_Usage#Node_Names
https://elinux.org/images/c/cf/Power_ePAPR_APPROVED_v1.1.pdf

> +			compatible = "qcom,wcn3990-wifi";
> +			reg = <0x18800000 0x800000>;
> +			reg-names = "membase";
> +			memory-region = <&wlan_msa_mem>;
> +			interrupts =
> +				<0 413 0 /* CE0 */ >,
> +				<0 414 0 /* CE1 */ >,
> +				<0 415 0 /* CE2 */ >,
> +				<0 416 0 /* CE3 */ >,
> +				<0 417 0 /* CE4 */ >,
> +				<0 418 0 /* CE5 */ >,
> +				<0 420 0 /* CE6 */ >,
> +				<0 421 0 /* CE7 */ >,
> +				<0 422 0 /* CE8 */ >,
> +				<0 423 0 /* CE9 */ >,
> +				<0 424 0 /* CE10 */ >,
> +				<0 425 0 /* CE11 */ >;
> +		};
>  	};
>  };
> -- 
> 2.17.0
> 
