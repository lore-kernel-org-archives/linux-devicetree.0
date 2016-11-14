From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v10 01/11] remoteproc: st_slim_rproc: add a slimcore
 rproc driver
Date: Mon, 14 Nov 2016 10:48:54 +0530
Message-ID: <20161114051854.GW3000@localhost>
References: <1476783556-2501-1-git-send-email-peter.griffin@linaro.org>
 <1476783556-2501-2-git-send-email-peter.griffin@linaro.org>
 <20161103213703.GA15449@tuxbot>
 <20161107135735.GA27280@griffinp-ThinkPad-X1-Carbon-2nd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161107135735.GA27280@griffinp-ThinkPad-X1-Carbon-2nd>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 07, 2016 at 01:57:35PM +0000, Peter Griffin wrote:
> > 
> > As you now make changes to the entire remoteproc Kconfig file, rather
> > than simply add a Kconfig symbol we can't bring this in via Vinod's tree
> > without providing Linus with a messy merge conflict.
> > 
> > So the remoteproc parts now has to go through my tree.
> 
> OK, I think the best approach is for Vinod to create an immutable
> branch with the entire fdma series on, and then both of you merge that branch into
> your respective trees.

my topic/st_fdma is immutable branch. You cna merge it, if you need a signed
tag, please do let me know

> 
> That way there won't be any conflicts and you can both accept further changes
> for v4.9 release. Trying to take half the series via rproc, and half via dma trees won't work
> because they have dependencies on each other.
> 
> I will send a v11 series in a moment which includes the feedback in this email
> and also include the additional fixes which Vinod has applied since the driver
> has been in linux-next.

WHY.. Stuff is already merged twice! Please send updated on top of already
merged code! This is how kernel developement is done...

-- 
~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
