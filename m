From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/9] dt-bindings: Add root properties for Raspberry Pi
 2.
Date: Thu, 23 Apr 2015 22:27:14 -0600
Message-ID: <5539C622.2020208@wwwdotorg.org>
References: <1429639796-2169-1-git-send-email-eric@anholt.net> <1429639796-2169-2-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429639796-2169-2-git-send-email-eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/21/2015 12:09 PM, Eric Anholt wrote:
> Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/bcm2836.txt | 10 ++++++++++

In next-20150423 at least, the bcm2835 equivalent of this file is:
Documentation/devicetree/bindings/arm/bcm/brcm,bcm2835.txt

The file added by this patch should be named consistently. I might be
tempted to put the new values into the existing file?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
