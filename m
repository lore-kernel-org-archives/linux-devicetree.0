From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 2/7] bcm47xx-nvram: add new broadcom nvram driver with dt support
Date: Sun, 24 Aug 2014 21:45:38 +0000
Message-ID: <CACna6rx_V46wAAkRFA+XnZNX80tAdWkaYrTUV5VHxLwbC6GvfQ@mail.gmail.com>
References: <1408915485-8078-1-git-send-email-hauke@hauke-m.de>
	<1408915485-8078-4-git-send-email-hauke@hauke-m.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1408915485-8078-4-git-send-email-hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Cc: "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org" <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 24 August 2014 21:24, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org> wrote:
> This was copied from arch/mips/bcm47xx/nvram.c and modified to interact
> with device tree. My plan is to make the MIPS bcm47xx also use this new
> driver some time later.

I don't like this.

First, you change API (_getenv call), without explanation why/if we
really need this. We decided we're very unlikely to ever find devices
with multiple (separated) NVRAMs. So what's the point of having nvram
per device?

Secondly, don't duplicate the code. If you're going to switch bcm47xx
to this new code, handle it smarter. Modify bcm47xx mode, move it to
the "misc" and re-use in bcm53xx.
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
