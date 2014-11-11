From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/3] ARM: dts: vf610: USB/GPIO fixes
Date: Tue, 11 Nov 2014 22:14:21 +0800
Message-ID: <20141111141419.GC2704@dragon>
References: <1415106430-6271-1-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1415106430-6271-1-git-send-email-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 04, 2014 at 02:07:07PM +0100, Stefan Agner wrote:
> Hi Shawn,
> 
> This patchset collects some vf610 device tree fixes. The first patch
> was part of the "vf610: Add GPIO support" patchset. GPIO support is
> merged by know, so I rebased that on top of your for-next branch.
> 
> The second patch is a USB fix I uncovered while testing the 3rd patch,
> which adds regulators, mainly for proper USB VBUS support, as we have
> them on our carrier boards.
> 
> Stefan Agner (3):
>   ARM: dts: vf610: use new GPIO support
>   ARM: dts: vf610: enable USB misc/phy nodes where necessary

Applied the first two, thanks.

Shawn

>   ARM: dts: vf-colibri: add USB regulators
> 
>  arch/arm/boot/dts/vf-colibri-eval-v3.dtsi | 45 ++++++++++++++++++++++++++++++-
>  arch/arm/boot/dts/vf-colibri.dtsi         | 37 +++++++++++++++++++++++++
>  arch/arm/boot/dts/vf610-twr.dts           |  9 +++++++
>  arch/arm/boot/dts/vfxxx.dtsi              |  1 +
>  4 files changed, 91 insertions(+), 1 deletion(-)
> 
> -- 
> 2.1.3
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
