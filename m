From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH 1/2] Documentation: devicetree: m25p80: add "nor-jedec" binding
Date: Wed, 11 Mar 2015 23:22:46 +0100
Message-ID: <201503112322.46491.marex@denx.de>
References: <1426111046-29900-1-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426111046-29900-1-git-send-email-computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday, March 11, 2015 at 10:57:25 PM, Brian Norris wrote:
> Almost all flash that are "compatible" with m25p80 support the JEDEC
> READ ID opcode (0x95)

On the 2/2 patch, you claim READ ID is 0x9F . You might want to sort
this inconsistency :) Otherwise ...

Reviewed-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>

Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
