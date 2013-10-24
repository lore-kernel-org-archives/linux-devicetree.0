From: Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] mtd: gpmi: fix the ecc regression
Date: Thu, 24 Oct 2013 14:59:58 +0800
Message-ID: <5268C56E.8050806@freescale.com>
References: <1382418628-4521-1-git-send-email-b32955@freescale.com> <20131022185639.GK23337@ld-irv-0074.broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131022185639.GK23337-bU/DPfM3abD4WzifrMjOTkcViWtcw2C0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi David & Mark & Brian:

    thanks for your review and comments.
> ... so why don't you just add a DT property to actually specify the ECC
> selection itself, rather than indirectly specifying it through a vague
Do you mean i should add a DT property like "fsl, gpmi-use-new-ecclayout" ?

I am not understand "the ECC selection itself".



thanks
Huang Shijie



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
