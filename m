From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mtd: gpmi: fix the ecc regression
Date: Thu, 24 Oct 2013 00:52:49 -0700
Message-ID: <20131024075249.GB9863@norris.computersforpeace.net>
References: <1382418628-4521-1-git-send-email-b32955@freescale.com>
 <20131022185639.GK23337@ld-irv-0074.broadcom.com>
 <5268C56E.8050806@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5268C56E.8050806-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 24, 2013 at 02:59:58PM +0800, Huang Shijie wrote:
> Hi David & Mark & Brian:
> 
>    thanks for your review and comments.
> >... so why don't you just add a DT property to actually specify the ECC
> >selection itself, rather than indirectly specifying it through a vague
> Do you mean i should add a DT property like "fsl, gpmi-use-new-ecclayout" ?
> 
> I am not understand "the ECC selection itself".

Sorry if that was unclear. I was recommending that the DT property
actually specify what the properties of the ECC layout were. Like ECC
strength (as an integer). Or spare area/step size/whatever else needed
to specify what these legacy and new layouts actually are. Your binding
was too vague; it wasn't describing what the layout is.

David seemed to suggest that something like your current binding might
be OK. (I still thing it was too vague, but if you can describe it
better, it may be sufficient.) A possible starting point:
"fsl,use-minimum-ecc". Does this properly reflect your intention of
using the datasheet's minimum required ECC (from ONFI or from the
driver's full ID table)?

But all that beside, I think your first priority is to fix the
regression for the current release cycle. I'm not keen on trying to
agree on a good DT binding and get it merged immediately.

Can you resend in two patches? The first one will default to using
legacy_set_geometry() to retain the old behavior and prevent
regressions. The second one can add a DT binding to re-introduce support
for your new layout. That way we can take the first one with no
question, and the second one can be taken when it's ready: either for
3.12 or 3.13.

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
