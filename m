From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 3/4] mtd: nand: pxa3xx: Use ECC strength and step size
 devicetree binding
Date: Tue, 13 May 2014 16:37:52 -0700
Message-ID: <20140513233752.GE28907@ld-irv-0074>
References: <1395401690-25221-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1395401690-25221-4-git-send-email-ezequiel.garcia@free-electrons.com>
 <20140512180104.GJ28907@ld-irv-0074>
 <20140512191841.GA3064@arch.cereza>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140512191841.GA3064-nAQHv47ARr+vIlHkl8J1cg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Simon Guinot <sguinot-D+JDLXUtGQkAvxtiuMwx3w@public.gmane.org>, Willy Tarreau <w@1wt.eu>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Seif Mazareeb <seif-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 12, 2014 at 04:18:41PM -0300, Ezequiel Garcia wrote:
> On 12 May 11:01 AM, Brian Norris wrote:
> > On Fri, Mar 21, 2014 at 08:34:49AM -0300, Ezequiel Garcia wrote:
> > > Also, if there is an ONFI-specified minimum ECC strength requirement,
> > > and the DT-specified ECC strength is weaker, print a warning and try to
> > > select a strength compatible with the ONFI requirement.
> > 
> > Are you sure you want to override? That seems contrary to the idea of a
> > DT property for specifying ECC. But maybe you have a good reason?
> > 
> 
> Actually, on IRC discussions you enforced the idea that the kernel shouldn't
> allow a weaker ECC strength than the datasheet (ONFI or ID table) specified.
> Hence, following your request, the implementation considers such devicetree
> setting as illegal and tries to find another one.

Hmm, I don't recall saying that exactly, although I might have said
something similar that could have been misconstrued as such.

I mostly recall discussing setting the ECC strength *without* device
tree (as pxa3xx_nand currently does), which is a different case, since
we don't have any outside input.

But anyway...

> > If you'd rather just warn the user, it's possible we could move that to
> > common code in nand_base.c.
> > 
> 
> Now that you mention this, I think you're right: it's very stupid to try to
> match an ECC scheme, different from the requested.
> 
> So, we either just warn the user (nosily) or we fail to probe the driver.
> If you ask me, I'd say let's just WARN() and let the user take the blame.

...yes, I (regardless of what "IRC Brian" said!) think that is the
correct approach when given an ECC scheme via device-tree. We should
honor it, and blame the user loudly.

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
