From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: BCM2836 (Raspberry Pi 2) port
Date: Tue, 28 Apr 2015 20:38:52 -0600
Message-ID: <5540443C.8070604@wwwdotorg.org>
References: <1429639796-2169-1-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429639796-2169-1-git-send-email-eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/21/2015 12:09 PM, Eric Anholt wrote:
> This is my first submission of a Raspberry Pi 2 port.  It can be found
> at https://github.com/anholt/linux/tree/bcm2836
> 
> I'm using the 2835 interrupt controller support, without adding the
> checks for ARM local interrupts first.  That means no support for IPIs
> (and thus no SMP), no PMU events, and no local timer (I'm using the
> same 2835 peripheral one).
> 
> It supports a similar featureset to Pi 1 at this point.  Serial and SD
> cards work.  Just one CPU supported.  USB (ethernet) works if you use
> U-Boot, or my mailbox series
> (https://github.com/anholt/linux/tree/bcm2836-mbox).

Tested-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>

I applied the patches on top of korg's linux-rpi.git for-rpi-next,
resolved the io_map conflicts, and tested without U-Boot.

I'll try to work out why it doesn't work with U-Boot. I can't
immediately see anything in /proc/device-tree that indicates the RPi
firmware is modifying the DT that's passed to the kernel to exclude any
CPU1..3 spin tables, so either the kernel isn't hitting those purely by
luck, or I'm guessing wrong re: the issue with U-Boot.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
