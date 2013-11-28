From: Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH v3 5/9] usb: gadget: s3c-hsotg: use generic
 phy_init()/phy_exit() support
Date: Thu, 28 Nov 2013 18:02:22 +0100
Message-ID: <033a01ceec5b$9bc1c6f0$d34554d0$%debski@samsung.com>
References: <1385403367-18144-1-git-send-email-matt.porter@linaro.org>
 <1385403367-18144-6-git-send-email-matt.porter@linaro.org>
 <529476A4.8080600@ti.com> <20131127171325.GD31091@beef>
 <20131127223650.GP31091@beef> <5296DA70.8010409@ti.com>
 <20131128164138.GS31091@beef>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20131128164138.GS31091@beef>
Content-language: pl
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Matt Porter' <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, 'Kishon Vijay Abraham I' <kishon-l0cyMroinI0@public.gmane.org>
Cc: 'Felipe Balbi' <balbi-l0cyMroinI0@public.gmane.org>, 'Greg Kroah-Hartman' <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, 'Rob Herring' <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, 'Pawel Moll' <pawel.moll-5wv7dgnIgG8@public.gmane.org>, 'Mark Rutland' <mark.rutland-5wv7dgnIgG8@public.gmane.org>, 'Kumar Gala' <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, 'Ian Campbell' <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, 'Christian Daudt' <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, 'Paul Zimmerman' <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Kyungmin Park' <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Linux USB List' <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, 'Linux ARM Kernel List' <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, 'Linux Kernel Mailing List' <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, 'Devicetree List' <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, 'Linaro Patches' <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Matt,

> From: Matt Porter [mailto:matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org]
> Sent: Thursday, November 28, 2013 5:42 PM
> 
> On Thu, Nov 28, 2013 at 11:23:52AM +0530, Kishon Vijay Abraham I wrote:
> > On Thursday 28 November 2013 04:06 AM, Matt Porter wrote:
> > > On Wed, Nov 27, 2013 at 12:13:25PM -0500, Matt Porter wrote:
> > >> On Tue, Nov 26, 2013 at 03:53:32PM +0530, Kishon Vijay Abraham I
> wrote:
> > >>> Hi,
> > >>>
> > >>> On Monday 25 November 2013 11:46 PM, Matt Porter wrote:
> > >>>> If a generic phy is present, call phy_init()/phy_exit(). This
> > >>>> supports generic phys that must be soft reset before power on.
> > >>>>
> > >>>> Signed-off-by: Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > >>>> ---
> > >>>>  drivers/usb/gadget/s3c-hsotg.c | 5 +++++
> > >>>>  1 file changed, 5 insertions(+)
> > >>>>
> > >>>> diff --git a/drivers/usb/gadget/s3c-hsotg.c
> > >>>> b/drivers/usb/gadget/s3c-hsotg.c index da3879b..8dfe33f 100644
> > >>>> --- a/drivers/usb/gadget/s3c-hsotg.c
> > >>>> +++ b/drivers/usb/gadget/s3c-hsotg.c
> > >>>> @@ -3622,6 +3622,9 @@ static int s3c_hsotg_probe(struct
> platform_device *pdev)
> > >>>>  		goto err_supplies;
> > >>>>  	}
> > >>>>
> > >>>> +	if (hsotg->phy)
> > >>>
> > >>> IS_ERR? If your phy_get fails *phy* will have a error value..
> > >>
> > >> Yes, thanks. I'll fix these and also note that the same issue
> > >> exists in Kamil's patch for these same hsotg->phy conditional uses.
> > >> I'll work with Kamil to either get those addressed there or in a
> follow on fix.
> > >
> > > I spoke too soon. If devm_phy_get fails, we don't set hsotg->phy
> and
> > > probe defer thus not reaching this point. Since hsotg->phy is
> either
> > > NULL or a valid struct phy *, this is correct as is throughout the
> driver.
> > >
> > >>>
> > >>>> +		phy_init(hsotg->phy);
> > >>>> +
> > >>>>  	/* usb phy enable */
> > >>>>  	s3c_hsotg_phy_enable(hsotg);
> > >>>>
> > >>>> @@ -3715,6 +3718,8 @@ static int s3c_hsotg_remove(struct
> platform_device *pdev)
> > >>>>  	}
> > >>>>
> > >>>>  	s3c_hsotg_phy_disable(hsotg);
> > >>>> +	if (hsotg->phy)
> > >>>
> > >>> same here.
> > >>
> > >> Ok.
> > >
> > > Same above, this will be NULL on failure (but is only applicable at
> > > this point on the platform data path.
> >
> > Ah ok.. Btw where is phy_get being called? Is it not part of this
> series?
> 
> It's in the Kamil's Exynos USB Phy -> generic phy series [1] which I
> depend on here. I mentioned it in the cover letter toward the end so
> it's a bit buried.
> 
> I have some outstanding, but trivial, comments on that series but I
> hear Kamil will be posting an update in the coming days. I'll wait a
> few days to post v4 addressing your comments so I can hopefully rebase
> against his updated s3c-hsotg patch.
> 

I am sorry to keep you waiting. I was doing some urgent non USB work 
lately and that is the reason for the delay. Thank you for the review of
the last version, by the way. I should post the new version on Wednesday
(or Tuesday afternoon, time permitting). Also, I will have no access to
my Samsung email until Tuesday.

Best wishes,
Kamil Debski


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
