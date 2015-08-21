From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] dmaengine: xgene-dma: Fix holding lock while calling tx
 callback in cleanup path
Date: Fri, 21 Aug 2015 14:21:46 +0530
Message-ID: <20150821085146.GP13546@localhost>
References: <1440066656-15516-1-git-send-email-rsahu@apm.com>
 <20150821083946.GO13546@localhost>
 <CAFd313wEAWjzJa82R1ujh3vyMasDvicQ4nZHq1qqZ5y7D4ixzQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAFd313wEAWjzJa82R1ujh3vyMasDvicQ4nZHq1qqZ5y7D4ixzQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rameshwar Sahu <rsahu-qTEPVZfXA3Y@public.gmane.org>
Cc: dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 21, 2015 at 02:15:08PM +0530, Rameshwar Sahu wrote:
> Hi Vinod,
> 
> On Fri, Aug 21, 2015 at 2:09 PM, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> wrote:
> > On Thu, Aug 20, 2015 at 04:00:56PM +0530, Rameshwar Prasad Sahu wrote:
> >> This patch fixes the an locking issue where client callback performs
> >                 ^^^^^^^^^^^^
> > ??
> >
> >> further submission.
> > Do you men you are preventing that or fixing for this to be allowed?
> 
> Fixing lock to allow client to submit further request in there
> callback routine if they would like.

Okay please fix the changelog to make it clear :)

-- 
~Vinod

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
