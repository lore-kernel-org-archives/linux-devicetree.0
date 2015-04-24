From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 3/9] ARM: Make a copy of the 2835 dts for the 2836.
Date: Thu, 23 Apr 2015 22:35:59 -0600
Message-ID: <5539C82F.7000002@wwwdotorg.org>
References: <1429639796-2169-1-git-send-email-eric@anholt.net> <1429639796-2169-4-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429639796-2169-4-git-send-email-eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/21/2015 12:09 PM, Eric Anholt wrote:
> This is not hooked up to anything yet, but it means that our later
> 2836-specific changes will be more obvious.  The bcm2836-rpi-2-b.dts
> actually comes from bcm2835-rpi-2-b-plus, which apparently is the
> closest.

>  arch/arm/boot/dts/bcm2836-rpi-2-b.dts | 30 +++++++++++++++++++++
>  arch/arm/boot/dts/bcm2836-rpi.dtsi    | 51 +++++++++++++++++++++++++++++++++++
>  arch/arm/boot/dts/bcm2836.dtsi        | 31 +++++++++++++++++++++

So we obviously need a new top-level bcm2836-rpi-2-b.dts for the new
board, and a new bcm2836.dtsi for the new SoC. However, do we really
need to duplicate bcm2836-rpi.dtsi? It should be identical between the
bcm2835/6 RPis, so I'd expect to just rename it to bcm283x-rpi.dtsi and
share it? The include of the SoC .dtsi file could be moved one level up
since that's the one difference?

Eventually, I'd like to get around to revamping the bcm283x DTs so
there's a DT for each separate board model, which would match the DT
filenames that U-Boot is looking for. Still, that's separate from these
patches.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
