From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v10 01/11] remoteproc: st_slim_rproc: add a slimcore
 rproc driver
Date: Wed, 16 Nov 2016 22:36:46 -0800
Message-ID: <20161117063646.GE28340@tuxbot>
References: <1476783556-2501-1-git-send-email-peter.griffin@linaro.org>
 <1476783556-2501-2-git-send-email-peter.griffin@linaro.org>
 <20161103213703.GA15449@tuxbot>
 <20161107135735.GA27280@griffinp-ThinkPad-X1-Carbon-2nd>
 <20161114051854.GW3000@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161114051854.GW3000@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun 13 Nov 21:18 PST 2016, Vinod Koul wrote:

> On Mon, Nov 07, 2016 at 01:57:35PM +0000, Peter Griffin wrote:
> > > 
> > > As you now make changes to the entire remoteproc Kconfig file, rather
> > > than simply add a Kconfig symbol we can't bring this in via Vinod's tree
> > > without providing Linus with a messy merge conflict.
> > > 
> > > So the remoteproc parts now has to go through my tree.
> > 
> > OK, I think the best approach is for Vinod to create an immutable
> > branch with the entire fdma series on, and then both of you merge that branch into
> > your respective trees.
> 
> my topic/st_fdma is immutable branch. You cna merge it, if you need a signed
> tag, please do let me know
> 

Hi Vinod,

It looks like you reverted the wrong Kconfig fix, the one I objected to
was the change in drivers/remoteproc, not the one in drivers/dma.

The ST_FMDA depends on functions exposed by REMOTEPROC and
ST_SLIM_REMOTEPROC, the latter in turn depends on REMOTEPROC, which you
guys made user selectable - and as such should not be selected - but I
think we should move forward and get everything merged and then we can
go back and figure out how this should be addressed (or left alone?).

I have merged "topic/st_fdma" into rproc-next, so that I can fix up the
now broken drivers/remoteproc/Kconfig.

We do however both need to revert the revert or there will be link
errors if you build the dma driver with remoteproc=n. If you do this I
can merge the topic once more and we'll keep the set of changes in sync.

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
