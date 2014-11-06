From: Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v8 3/3] ARM: dts: add rk3288 power-domain node
Date: Thu, 06 Nov 2014 16:45:12 +0800
Message-ID: <545B3518.2090409@rock-chips.com>
References: <1415254961-5746-1-git-send-email-caesar.wang@rock-chips.com> <1415254961-5746-4-git-send-email-caesar.wang@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1415254961-5746-4-git-send-email-caesar.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Caesar Wang <caesar.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "jinkun.hong" <jinkun.hong-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, fzf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Jack Dai <jack.dai-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Caesar,

On 11/06/2014 02:22 PM, Caesar Wang wrote:
> Signed-off-by: Jack Dai <jack.dai-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> Signed-off-by: jinkun.hong <jinkun.hong-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> Signed-off-by: Caesar Wang <caesar.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
pls detail the reason why you need to add all the clocks into 
power-controller node.
> ---
>
> Changes in v8:
>      - DTS go back to v2
>
> Changes in v7: None
> Changes in v6: None
> Changes in v5: None
> Changes in v4: None
> Changes in v3:
>      - Decomposition power-controller, changed to multiple controller
>      (gpu-power-controller, hevc-power-controller)
>
> Changes in v2:
>      - make pd_vio clocks all one entry per line and alphabetize.
>      - power: power-controller move back to pinctrl: pinctrl.
>
>   arch/arm/boot/dts/rk3288.dtsi | 66 +++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 66 insertions(+)
>
> diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
> index cb18bb4..9cd269a 100644
> --- a/arch/arm/boot/dts/rk3288.dtsi
> +++ b/arch/arm/boot/dts/rk3288.dtsi
> @@ -989,4 +989,70 @@
>   			};
>   		};
>   	};
> +
> +	power: power-controller {
> +		compatible = "rockchip,rk3288-power-controller";
> +		#power-domain-cells = <1>;
> +		rockchip,pmu = <&pmu>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		pd_gpu {
> +			reg = <RK3288_PD_GPU>;
> +			clocks = <&cru ACLK_GPU>;
> +		};
> +
> +		pd_hevc {
> +			reg = <RK3288_PD_HEVC>;
> +			clocks = <&cru ACLK_HEVC>,
> +				 <&cru SCLK_HEVC_CABAC>,
> +				 <&cru SCLK_HEVC_CORE>,
> +				 <&cru HCLK_HEVC>;
> +		};
> +
> +		pd_vio {
> +			reg = <RK3288_PD_VIO>;
> +			clocks = <&cru ACLK_IEP>,
> +				 <&cru ACLK_ISP>,
> +				 <&cru ACLK_RGA_NIU>,
> +				 <&cru ACLK_RGA>,
> +				 <&cru ACLK_VIO0_NIU>,
> +				 <&cru ACLK_VIO1_NIU>,
> +				 <&cru ACLK_VIP>,
> +				 <&cru ACLK_VOP0>,
> +				 <&cru ACLK_VOP1>,
> +				 <&cru DCLK_VOP0>,
> +				 <&cru DCLK_VOP1>,
> +				 <&cru HCLK_IEP>,
> +				 <&cru HCLK_ISP>,
> +				 <&cru HCLK_RGA>,
> +				 <&cru HCLK_VIO_AHB_ARBI>,
> +				 <&cru HCLK_VIO_NIU>,
> +				 <&cru HCLK_VIO2_H2P>,
> +				 <&cru HCLK_VIP>,
> +				 <&cru HCLK_VOP0>,
> +				 <&cru HCLK_VOP1>,
> +				 <&cru PCLK_EDP_CTRL>,
> +				 <&cru PCLK_HDMI_CTRL>,
> +				 <&cru PCLK_LVDS_PHY>,
> +				 <&cru PCLK_MIPI_CSI>,
> +				 <&cru PCLK_MIPI_DSI0>,
> +				 <&cru PCLK_MIPI_DSI1>,
> +				 <&cru PCLK_VIO2_H2P>,
> +				 <&cru SCLK_EDP_24M>,
> +				 <&cru SCLK_EDP>,
> +				 <&cru SCLK_HDMI_CEC>,
> +				 <&cru SCLK_HDMI_HDCP>,
> +				 <&cru SCLK_ISP_JPE>,
> +				 <&cru SCLK_ISP>,
> +				 <&cru SCLK_RGA>;
> +		};
> +
> +		pd_video {
> +			reg = <RK3288_PD_VIDEO>;
> +			/* FIXME: add clocks */
remove the 'FIXME'.
> +			clocks = <&cru ACLK_VCODEC>,
> +				 <&cru HCLK_VCODEC>;
> +		};
> +	};
>   };

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
