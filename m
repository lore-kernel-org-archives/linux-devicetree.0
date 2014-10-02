From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: vf500/vf610: support VF500 SoC
Date: Thu, 02 Oct 2014 17:28:48 +0200
Message-ID: <8882221.sfQOLcQs3p@wuerfel>
References: <1412261724-11073-1-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412261724-11073-1-git-send-email-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, b35083-KZfg59tc24xl57MIdRCFDg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 02 October 2014 16:55:23 Stefan Agner wrote:
> The VF500 is essentially the same SoC, but with only one core and
> without L1 cache. The VF610 is therefore a superset of the VF500.
> Move allmost all periperals to vf500.dtsi which is then included
> and enhanced by vf610.dtsi.
> 
> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> ---
> Somehow using -M -B switches create a unapplyable patch, hence I
> generated one without those options. Sorry about that.
> 
>  arch/arm/boot/dts/vf500.dtsi | 498 ++++++++++++++++++++++++++++++++++++++++++
>  arch/arm/boot/dts/vf610.dtsi | 507 +------------------------------------------
>  2 files changed, 510 insertions(+), 495 deletions(-)
>  create mode 100644 arch/arm/boot/dts/vf500.dtsi

I think it would be better to create one extra file that contains the common
parts and is included by both vf500 and vf610.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
