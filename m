From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: bcm2835: Add the auxiliary clocks to the device
 tree.
Date: Mon, 21 Sep 2015 19:19:47 -0700
Message-ID: <5600BAC3.70506@wwwdotorg.org>
References: <1441923750-19404-1-git-send-email-eric@anholt.net>
 <1441923750-19404-4-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441923750-19404-4-git-send-email-eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/10/2015 03:22 PM, Eric Anholt wrote:
> These will be used for enabling UART1, SPI1, and SPI2.

> diff --git a/arch/arm/boot/dts/bcm2835.dtsi b/arch/arm/boot/dts/bcm2835.dtsi

> +		aux_clocks: aux-clocks@0x7e215004 {
> +			compatible = "brcm,bcm2835-aux-clock";
> +			#clock-cells = <1>;
> +			reg = <0x7e215004 0x4>;

Actually, I take back the ack on this patch. This HW module has two
registers. The reg property should include both of those registers so
that if SW needs to start using the other register at some time in the
future, the entire set of registers is already represented in DT.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
