From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] ARM: BCM5301X: Add IRQs to Broadcom's bus-axi in DTS file
Date: Tue, 02 Dec 2014 10:38:37 +0100
Message-ID: <2676777.ByaIh4AdF3@wuerfel>
References: <1417470667-15679-1-git-send-email-hauke@hauke-m.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417470667-15679-1-git-send-email-hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday 01 December 2014 22:51:07 Hauke Mehrtens wrote:
> IRQ support for Broadcom's bus-axi driver bcma was merged into John
> Linville's wireless tree and will show up in 3.19. This patch makes use
> of this feature in the DTS file for the the BCM5301X SoCs. I left the
> PCIe controller out, because this still needs some discussion.
> 
> Signed-off-by: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>

Looks good to me.

Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

I assume you are going to send this together with some other patches
you have queued up?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
