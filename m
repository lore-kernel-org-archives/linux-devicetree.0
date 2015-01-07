From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dts: berlin: fix io clk and add missing core
 clk for BG2Q sdhci2 host
Date: Wed, 07 Jan 2015 15:22:30 +0100
Message-ID: <54AD4126.6030807@gmail.com>
References: <1420016272-6789-1-git-send-email-jszhang@marvell.com> <1420016272-6789-2-git-send-email-jszhang@marvell.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1420016272-6789-2-git-send-email-jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 31.12.2014 09:57, Jisheng Zhang wrote:
> On BG2Q, the sdhci2 host uses nfcecc for "io" clk and nfc for "core" clk.
> The shdci2 can't work Without this patch due to the "core" clk is gated.
>
> Signed-off-by: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org # 3.16+

Applied to berlin/fixes.

Thanks!

> ---
>   arch/arm/boot/dts/berlin2q.dtsi | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/berlin2q.dtsi b/arch/arm/boot/dts/berlin2q.dtsi
> index 35253c9..903f3bb 100644
> --- a/arch/arm/boot/dts/berlin2q.dtsi
> +++ b/arch/arm/boot/dts/berlin2q.dtsi
> @@ -83,7 +83,8 @@
>   			compatible = "mrvl,pxav3-mmc";
>   			reg = <0xab1000 0x200>;
>   			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&chip CLKID_SDIO1XIN>;
> +			clocks = <&chip CLKID_NFC_ECC>, <&chip CLKID_NFC>;
> +			clock-names = "io", "core";
>   			status = "disabled";
>   		};
>
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
