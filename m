From: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH v2 15/16] dmaengine: bcm-sba-raid: Add debugfs support
Date: Thu, 7 Sep 2017 21:37:32 +0200
Message-ID: <20170907193732.GB11006@kroah.com>
References: <1501583880-32072-1-git-send-email-anup.patel@broadcom.com>
 <1501583880-32072-16-git-send-email-anup.patel@broadcom.com>
 <20170817080142.GC3053@localhost>
 <CAALAos_SXTMms8XmhEC28gxx4qvvr0z3wqQ=o_-BohMpcXwQTw@mail.gmail.com>
 <20170818052613.GE3053@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170818052613.GE3053@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM Kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Device Tree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 18, 2017 at 10:56:13AM +0530, Vinod Koul wrote:
> On Fri, Aug 18, 2017 at 10:33:54AM +0530, Anup Patel wrote:
> > On Thu, Aug 17, 2017 at 1:31 PM, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> wrote:
> > > On Tue, Aug 01, 2017 at 04:07:59PM +0530, Anup Patel wrote:
> > > why fail, debugfs should be an optional thingy, why would you want to fail here?
> > 
> > Yes, we are handling the case when debugfs is not available
> > and skipping debugfs gracefully.
> > 
> > If debugfs is available then failure of debugfs_create_dir()
> > should be reported.
> 
> reported yes, bailing out on that err no..

Reported, no.  You should _never_ care about the return value of a
debugfs call.  Never check it, just move on ad keep on going.  It
doesn't matter.

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
