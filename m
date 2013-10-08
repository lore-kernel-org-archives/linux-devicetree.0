From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] ARM: Dove: Add the audio devices in DT
Date: Tue, 08 Oct 2013 20:03:44 +0200
Message-ID: <52544900.3020600@gmail.com>
References: <20131008194119.0cebbe26@armhf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131008194119.0cebbe26@armhf>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/08/2013 07:41 PM, Jean-Francois Moine wrote:
> This patch adds the nodes to instantiate the audio devices of the Dove
> boards.
>
> Signed-off-by: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
> ---
>   arch/arm/boot/dts/dove.dtsi | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
>
> diff --git a/arch/arm/boot/dts/dove.dtsi b/arch/arm/boot/dts/dove.dtsi
> index cc27916..e177e66 100644
> --- a/arch/arm/boot/dts/dove.dtsi
> +++ b/arch/arm/boot/dts/dove.dtsi
> @@ -505,5 +505,23 @@
>   				phy-handle = <&ethphy>;
>   			};
>   		};
> +
> +		audio0: audio-controller@b0000 {
> +			compatible = "marvell,dove-audio";
> +			reg = <0xb0000 0x2210>;
> +			interrupts = <19>, <20>;
> +			clocks = <&gate_clk 12>;
> +			clock-names = "internal";
> +			status = "disabled";
> +		};
> +
> +		audio1: audio-controller@b4000 {
> +			compatible = "marvell,dove-audio";
> +			reg = <0xb4000 0x2210>;
> +			interrupts = <21>, <22>;
> +			clocks = <&gate_clk 13>;
> +			clock-names = "internal";
> +			status = "disabled";
> +		};
>   	};
>   };
>

Thanks for the series,

Acked-by: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
