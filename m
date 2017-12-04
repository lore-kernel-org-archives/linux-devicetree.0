From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] arm: dts: rockchip: fix errors in IOMMU interrupts property cells
Date: Mon, 04 Dec 2017 11:46:30 +0100
Message-ID: <1650017.SLWRlyvIpe@phil>
References: <20171109223535.17368-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171109223535.17368-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Donnerstag, 9. November 2017, 16:35:35 CET schrieb Rob Herring:
> The interrupts property in the IOMMU node for Rockchip dts file has a
> spurious extra cell causing a dtc warning:
> 
> Warning (interrupts_property): interrupts size is (16), expected multiple of 12 in /iommu@ff900800
> 
> Remove the extra cell.
> 
> Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  arch/arm/boot/dts/rk3288.dtsi            | 2 +-
>  arch/arm64/boot/dts/rockchip/rk3368.dtsi | 2 +-

Arnd fixed the rk3368 variant in a patch already, so I've dropped that
and applied the rk3288 fix as fix for 4.15.


Thanks
Heiko

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
