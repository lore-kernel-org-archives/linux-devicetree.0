From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: qcom: add SMEM device node to IPQ806x dts
Date: Thu, 13 Aug 2015 16:57:50 -0700
Message-ID: <55CD2EFE.8040606@codeaurora.org>
References: <1439501620-24073-1-git-send-email-mathieu@codeaurora.org> <1439501620-24073-3-git-send-email-mathieu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439501620-24073-3-git-send-email-mathieu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mathieu Olivari <mathieu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/13/2015 02:33 PM, Mathieu Olivari wrote:
> @@ -79,6 +79,15 @@
>   
>   			#hwlock-cells = <1>;
>   		};
> +
> +		smem {
> +			compatible = "qcom,smem";
> +
> +			memory-region = <&smem>;
> +			reg = <0x41000000 0x4000>;

Does this reg property do something? I thought we were supposed to leave 
this out when not using the rpm msg ram. Also, if there's no reg, it 
should be at the root /.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
