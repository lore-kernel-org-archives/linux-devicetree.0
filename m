From: Stefan Wahren <info-saaNCTdWVBT7BZbvpMY5sg@public.gmane.org>
Subject: Re: bcm2835 (Raspberry Pi) KMS driver
Date: Sun, 11 Oct 2015 14:39:25 +0200
Message-ID: <561A587D.6020009@lategoodbye.de>
References: <1444426068-15817-1-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444426068-15817-1-git-send-email-eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am 09.10.2015 um 23:27 schrieb Eric Anholt:
> This is a respin of the Raspberry Pi KMS series.  Now that we've got a
> real clock driver, I can actually set new video modes.  Also in this
> version, most of the custom DT stuff from before is gone, thanks to
> finding exynos's platform_driver component matching code (I have sent
> separate patches to drivers/base to make helpers for doing it).
>
> https://github.com/anholt/linux/tree/vc4-kms-squash-2
>
>

I want to point out that git format-patch could prepare a nice cover 
letter and usually the changelog should go there.

Regards
Stefan

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
