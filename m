From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: qcom: add SFPB nodes to IPQ806x dts
Date: Thu, 13 Aug 2015 16:18:14 -0700
Message-ID: <55CD25B6.6050901@codeaurora.org>
References: <1439501620-24073-1-git-send-email-mathieu@codeaurora.org> <1439501620-24073-2-git-send-email-mathieu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439501620-24073-2-git-send-email-mathieu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mathieu Olivari <mathieu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/13/2015 02:33 PM, Mathieu Olivari wrote:
> Add one new node to the ipq806x.dtsi file to declare & register the
> hardware spinlock devices. This mechanism is required to be used by
> other drivers such as SMEM.
>
> Signed-off-by: Mathieu Olivari <mathieu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
>   arch/arm/boot/dts/qcom-ipq8064.dtsi | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> index 9f727d8..ea7b959 100644
> --- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> @@ -67,6 +67,18 @@
>   			clock-frequency = <32768>;
>   			#clock-cells = <0>;
>   		};
> +
> +		sfpb_mutex_block: syscon@01200600 {

I think you can drop the leading 0 here. Also this should be moved into 
the soc node.

> +			compatible = "syscon";
> +			reg = <0x01200600 0x100>;
> +		};
> +
> +		sfpb_mutex: sfpb-mutex {
> +			compatible = "qcom,sfpb-mutex";
> +			syscon = <&sfpb_mutex_block 4 4>;
> +
> +			#hwlock-cells = <1>;
> +		};

And this node should be moved to the root /.
>   	};
>   
>   	soc: soc {


-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
