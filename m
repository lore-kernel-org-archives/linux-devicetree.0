From: Alexander Stein <alexanders83-S0/GAf8tV78@public.gmane.org>
Subject: Re: Re: BCM2836 (Raspberry Pi 2) port
Date: Tue, 12 May 2015 17:39:28 +0200
Message-ID: <1701192.WcfjCoBWQN@kongar>
References: <1429639796-2169-1-git-send-email-eric@anholt.net> <4137213.WVJY1et48u@kongar> <55516738.306@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55516738.306-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday 11 May 2015, 20:36:40 wrote Stephen Warren:
> On 05/08/2015 10:14 AM, Alexander Stein wrote:
> > On Thursday 23 April 2015, 22:25:08 wrote Stephen Warren:
> >>> Hit any key to stop autoboot:  0 
> >>> U-Boot> setenv fdt_high fffffff
> > 
> > Any specific reason to set fdt_high to fffffff?
> 
> Yes, it prevents U-Boot's annoying habit of moving the DTB from where it
> was loaded to some other place. This was especially important in this
> case since I was trying to find out exactly which piece of RAM being
> over-written caused the issues I was seeing.

Shouldn't this then be part of the default raspberry (2 only?) environment?

Regards,
Alexander

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
