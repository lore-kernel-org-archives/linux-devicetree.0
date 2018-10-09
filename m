From: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 4/4] dts: arm64/sdm845: Enable iommu for WCN3990 wifi
 module device node
Date: Mon, 8 Oct 2018 18:30:27 -0700
Message-ID: <20181009013026.GA83814@ban.mtv.corp.google.com>
References: <20181001112636.31715-1-govinds@codeaurora.org>
 <20181001112636.31715-5-govinds@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20181001112636.31715-5-govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

+ linux-msm, linux-soc

On Mon, Oct 01, 2018 at 04:56:36PM +0530, Govind Singh wrote:
> WCN3990 wifi module can optionally make use of the IOMMU.
> Add phandle to the iommu and stream id of wifi iommu block.
> 
> Signed-off-by: Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 36c716cf3a0c..f02da46542cc 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -1225,6 +1225,7 @@
>  				<0 423 0 /* CE9 */ >,
>  				<0 424 0 /* CE10 */ >,
>  				<0 425 0 /* CE11 */ >;
> +			iommus = <&apps_smmu 0x0040 0x1>;

I don't see an apps_smmu label in any of the sdm845 files yet. I don't
think this piece has landed in any -next tree yet. So your patch won't
work.

I think maybe you should just defer sending this particular patch
upstream until the dependency is worked out.

Brian

>  		};
>  	};
>  };
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
