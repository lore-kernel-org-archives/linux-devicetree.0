From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH v4 05/31] mtd: nand: pxa3xx: devicetree binding update
Date: Thu, 7 Nov 2013 12:54:08 -0500
Message-ID: <20131107175408.GL8308@titan.lakedaemon.net>
References: <1383837455-30721-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1383837455-30721-6-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131107153210.GK8308@titan.lakedaemon.net>
 <20131107164132.GA30917@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131107164132.GA30917@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Willy Tarreau <w@1wt.eu>, Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 07, 2013 at 01:41:33PM -0300, Ezequiel Garcia wrote:
> On Thu, Nov 07, 2013 at 10:32:10AM -0500, Jason Cooper wrote:
> > On Thu, Nov 07, 2013 at 12:17:09PM -0300, Ezequiel Garcia wrote:
> > > Since the driver supports the new compatible string, the binding
> > > documentation must be updated to reflect it.
> > > 
> > > Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > > ---
> > >  Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > Thanks for adding this, but please remember to update the Subject
> > string in the future.  Both this patch and the next one are changing the
> > Documentation/ portion of the tree, not drivers/.
> > 
> 
> Come again?
> 
> You mean "[PATCH] Documentation: mtd: nand: Do this"
> 
> In that case: sorry, I do it differently on purpose, it looks better
> to me (focus the affected driver), but maybe I'm wrong.

but it makes it more difficult for devicetree binding reviewers to find
the patch in the series.  Perhaps having 'binding' in the Subject is
sufficient.  We'll see how things unfold over the next few days.

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
