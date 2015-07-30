From: Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v8 00/23] usb gadget update for OTG 2.0
Date: Thu, 30 Jul 2015 09:46:58 +0800
Message-ID: <20150730014657.GB8175@shlinux2>
References: <1437622667-6735-1-git-send-email-jun.li@freescale.com>
 <20150727072157.GA20654@shlinux2>
 <20150729150427.GA32418@saruman.tx.rr.com>
 <20150729232401.GA8175@shlinux2>
 <20150730021141.GB3811@saruman.tx.rr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150730021141.GB3811-HgARHv6XitJaoMGHk7MhZQC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh+d-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rogerq-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 29, 2015 at 09:11:41PM -0500, Felipe Balbi wrote:
> On Thu, Jul 30, 2015 at 07:24:03AM +0800, Li Jun wrote:
> > On Wed, Jul 29, 2015 at 10:04:27AM -0500, Felipe Balbi wrote:
> > > On Mon, Jul 27, 2015 at 03:21:59PM +0800, Peter Chen wrote:
> > > > On Thu, Jul 23, 2015 at 11:37:24AM +0800, Li Jun wrote:
> > > > > Change for v8:
> > > > > - Add Peter's ACk for chipidea driver; and Roger's Reviewed-by for patch
> > > > >   07, 21~23.
> > > > > - Add ci->is_otg condition before enable ci->gadget.is_otg for chipidea
> > > > >   driver in patch 8.
> > > > > 
> > > > 
> > > > Hi Felipe,
> > > > 
> > > > For chipidea patches in this series, help to queue them in your tree 
> > > > please, thanks.
> > > 
> > > all there, please make sure they're correct. There were so many versions
> > > of this series that I might have picked up the wrong one :-p
> > > 
> > 
> > Patch [8/23]: "usb: chipidea: set usb otg capabilities", you picked up the V7,
> > I have a small change for V8, others are correct.
> 
> Can you send an incremental diff, please ?
> 

diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index 61fde89..c6d1595 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -1838,8 +1838,8 @@ static int udc_start(struct ci_hdrc *ci)
 	ci->gadget.name         = ci->platdata->name;
 	ci->gadget.otg_caps	= otg_caps;
 
-	if (otg_caps->hnp_support || otg_caps->srp_support ||
-					otg_caps->adp_support)
+	if (ci->is_otg && (otg_caps->hnp_support || otg_caps->srp_support ||
+						otg_caps->adp_support))
 		ci->gadget.is_otg = 1;
 
 	INIT_LIST_HEAD(&ci->gadget.ep_list);

thanks
Li Jun
> -- 
> balbi


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
