From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: bcm2835: dt: Add a fall-back Raspberry Pi tree
Date: Mon, 25 Jan 2016 13:55:27 -0700
Message-ID: <56A68BBF.4060405@wwwdotorg.org>
References: <1453754394-3639-1-git-send-email-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1453754394-3639-1-git-send-email-lkundrak-NGH9Lh4a5iE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/25/2016 01:39 PM, Lubomir Rintel wrote:
> U-Boot falls back to "bcm2835-rpi-other.dtb" for boards of unknown
> identification. Let's do a bare minimum for them so that they at leat
> boot.
>
> Signed-off-by: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
> ---
>   arch/arm/boot/dts/Makefile              | 1 +
>   arch/arm/boot/dts/bcm2835-rpi-other.dts | 7 +++++++

This DT shouldn't ever be used, except when a new unidentified board 
appears. In that case, I believe the correct solution is to add support 
for that new board to U-Boot and the kernel, rather than add fall-backs. 
Prior to that being done, a user can always copy whichever DT they want 
into filename bcm2835-rpi-other.dts for temporary testing/development, 
if they have reason to believe their new model is compatible with 
something else. In general, I don't think we have any reason to believe 
that even this new minimal DT is guaranteed to be compatible with any 
possible future hardware, so it seems a little risky to ship this file 
in anticipation.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
