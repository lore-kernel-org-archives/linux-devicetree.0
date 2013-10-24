From: Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] mtd: gpmi: fix the ecc regression
Date: Thu, 24 Oct 2013 16:38:38 +0800
Message-ID: <5268DC8E.1040908@freescale.com>
References: <1382418628-4521-1-git-send-email-b32955@freescale.com> <20131022185639.GK23337@ld-irv-0074.broadcom.com> <5268C56E.8050806@freescale.com> <20131024075249.GB9863@norris.computersforpeace.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131024075249.GB9863-7ciq9WCbhwJWVhifINYOO1poFGfAdsVx5NbjCUgZEJk@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

=E4=BA=8E 2013=E5=B9=B410=E6=9C=8824=E6=97=A5 15:52, Brian Norris =E5=86=
=99=E9=81=93:
> David seemed to suggest that something like your current binding migh=
t
> be OK. (I still thing it was too vague, but if you can describe it
> better, it may be sufficient.) A possible starting point:
> "fsl,use-minimum-ecc". Does this properly reflect your intention of
> using the datasheet's minimum required ECC (from ONFI or from the
> driver's full ID table)?
yes, it's okay to me.

thanks
Huang Shijie

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
