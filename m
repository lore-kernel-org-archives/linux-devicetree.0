From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 0/3] arm64: dts: Support Mali450 on rk3328
Date: Sat, 16 Dec 2017 18:17:39 +0100
Message-ID: <1545865.1tkaHIZnpa@phil>
References: <20171209000738.32187-1-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171209000738.32187-1-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Samstag, 9. Dezember 2017, 01:07:35 CET schrieb Heiko Stuebner:
> Pretty standard setup. Tested with the kmscube demo running
> using the lima kernel and gallium driver.
> 
> 
> Heiko Stuebner (3):
>   dt-bindings: gpu: mali-utgard: add rockchip,rk3328-mali compatible
>   arm64: dts: rockchip: add rk3328 mali gpu node
>   arm64: dts: rockchip: enable gpu on rk3328-rock64

applied for 4.16 with Robs review and following his suggestion
of making the gpu simply always-on and thus droppping patch 3.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
