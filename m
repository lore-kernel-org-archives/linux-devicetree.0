From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v2 06/10] usb: chipidea: add ahb burst configuration
 interface
Date: Wed, 5 Aug 2015 09:25:51 +0800
Message-ID: <20150805012550.GG25143@shlinux2>
References: <1438577238-10153-1-git-send-email-peter.chen@freescale.com>
 <1438577238-10153-7-git-send-email-peter.chen@freescale.com>
 <CAL_JsqJn16OvfL_Ggf1wSi2XkJkjDMrmuRit3q8eVY5bNp8oYw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJn16OvfL_Ggf1wSi2XkJkjDMrmuRit3q8eVY5bNp8oYw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 03, 2015 at 09:04:27AM -0500, Rob Herring wrote:
> On Sun, Aug 2, 2015 at 11:47 PM, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> > The users can change it through dts or platform data if they
> > want to change the default value.
> >
> > Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > ---
> >  drivers/usb/chipidea/bits.h  |  3 +++
> >  drivers/usb/chipidea/core.c  | 14 ++++++++++++++
> >  include/linux/usb/chipidea.h |  2 ++
> >  3 files changed, 19 insertions(+)
> >
> > diff --git a/drivers/usb/chipidea/bits.h b/drivers/usb/chipidea/bits.h
> > index 831a8f6..462ad02 100644
> > --- a/drivers/usb/chipidea/bits.h
> > +++ b/drivers/usb/chipidea/bits.h
> > @@ -25,6 +25,9 @@
> >  #define VERSION                      (0xF << 25)
> >  #define CIVERSION            (0x7 << 29)
> >
> > +/* SBUSCFG */
> > +#define AHBBRST_MASK           0x7
> > +
> >  /* HCCPARAMS */
> >  #define HCCPARAMS_LEN         BIT(17)
> >
> > diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> > index 38bd036..f60cbf6 100644
> > --- a/drivers/usb/chipidea/core.c
> > +++ b/drivers/usb/chipidea/core.c
> > @@ -439,6 +439,9 @@ void ci_platform_configure(struct ci_hdrc *ci)
> >
> >         hw_write(ci, OP_USBCMD, 0xff0000, ci->platdata->itc_setting << 16);
> >
> > +       if (ci->platdata->flags & CI_HDRC_OVERRIDE_AHB_BURST)
> > +               hw_write_id_reg(ci, ID_SBUSCFG, AHBBRST_MASK,
> > +                       ci->platdata->ahb_burst_config);
> >  }
> >
> >  /**
> > @@ -647,6 +650,17 @@ static int ci_get_platdata(struct device *dev,
> >                 }
> >         }
> >
> > +       if (of_find_property(dev->of_node, "ahb-burst-config", NULL)) {
> > +               ret = of_property_read_u32(dev->of_node, "ahb-burst-config",
> > +                       &platdata->ahb_burst_config);
> > +               if (ret) {
> > +                       dev_err(dev,
> > +                               "failed to get ahb-burst-config\n");
> > +                       return ret;
> > +               }
> > +               platdata->flags |= CI_HDRC_OVERRIDE_AHB_BURST;
> > +       }
> > +
> 
> This can be simplified to:
> 
> ret = of_property_read_u32(dev->of_node, "ahb-burst-config",
> &platdata->ahb_burst_config);
> if (!ret)
>   platdata->flags |= CI_HDRC_OVERRIDE_AHB_BURST;
> 
> The error condition can't really happen.
> 

Why the error condition can't really happen? If the value of
this property at dts is invalid, we would like return error.

For non-exist property, it is normal case; for invalid property,
we would like return error, and quit.

-- 

Best Regards,
Peter Chen
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
