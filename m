From: Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 5/9] usb: gadget: s3c-hsotg: use generic
 phy_init()/phy_exit() support
Date: Wed, 27 Nov 2013 17:36:50 -0500
Message-ID: <20131127223650.GP31091@beef>
References: <1385403367-18144-1-git-send-email-matt.porter@linaro.org>
 <1385403367-18144-6-git-send-email-matt.porter@linaro.org>
 <529476A4.8080600@ti.com>
 <20131127171325.GD31091@beef>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131127171325.GD31091@beef>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Paul Zimmerman <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM Kernel List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linaro Patches <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 27, 2013 at 12:13:25PM -0500, Matt Porter wrote:
> On Tue, Nov 26, 2013 at 03:53:32PM +0530, Kishon Vijay Abraham I wrote:
> > Hi,
> > 
> > On Monday 25 November 2013 11:46 PM, Matt Porter wrote:
> > > If a generic phy is present, call phy_init()/phy_exit(). This supports
> > > generic phys that must be soft reset before power on.
> > > 
> > > Signed-off-by: Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > > ---
> > >  drivers/usb/gadget/s3c-hsotg.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > > 
> > > diff --git a/drivers/usb/gadget/s3c-hsotg.c b/drivers/usb/gadget/s3c-hsotg.c
> > > index da3879b..8dfe33f 100644
> > > --- a/drivers/usb/gadget/s3c-hsotg.c
> > > +++ b/drivers/usb/gadget/s3c-hsotg.c
> > > @@ -3622,6 +3622,9 @@ static int s3c_hsotg_probe(struct platform_device *pdev)
> > >  		goto err_supplies;
> > >  	}
> > >  
> > > +	if (hsotg->phy)
> > 
> > IS_ERR? If your phy_get fails *phy* will have a error value..
> 
> Yes, thanks. I'll fix these and also note that the same issue exists in
> Kamil's patch for these same hsotg->phy conditional uses. I'll work with
> Kamil to either get those addressed there or in a follow on fix.

I spoke too soon. If devm_phy_get fails, we don't set hsotg->phy and probe
defer thus not reaching this point. Since hsotg->phy is either NULL or a
valid struct phy *, this is correct as is throughout the driver.

> > 
> > > +		phy_init(hsotg->phy);
> > > +
> > >  	/* usb phy enable */
> > >  	s3c_hsotg_phy_enable(hsotg);
> > >  
> > > @@ -3715,6 +3718,8 @@ static int s3c_hsotg_remove(struct platform_device *pdev)
> > >  	}
> > >  
> > >  	s3c_hsotg_phy_disable(hsotg);
> > > +	if (hsotg->phy)
> > 
> > same here.
> 
> Ok.

Same above, this will be NULL on failure (but is only applicable at this
point on the platform data path.

-Matt
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
