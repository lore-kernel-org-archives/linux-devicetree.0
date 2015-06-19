From: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH v2 3/5] extcon: arizona: Convert to gpiod
Date: Fri, 19 Jun 2015 09:14:33 +0100
Message-ID: <20150619081433.GR32730@opensource.wolfsonmicro.com>
References: <1434638631-16451-1-git-send-email-ckeepax@opensource.wolfsonmicro.com> <1434638631-16451-4-git-send-email-ckeepax@opensource.wolfsonmicro.com> <CAGTfZH0AsRwcFwevAiQeyL=VUxiCvCx+3OEFKQ4nV3DpRdsdoQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGTfZH0AsRwcFwevAiQeyL=VUxiCvCx+3OEFKQ4nV3DpRdsdoQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 19, 2015 at 11:36:47AM +0900, Chanwoo Choi wrote:
> Hi Charles,
> 
> On Thu, Jun 18, 2015 at 11:43 PM, Charles Keepax
> <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org> wrote:
> > Convert to using the newer gpiod interface for the micd_pol_gpio.
> > Although we still carry support for the old gpio interface from pdata.
> >
> > Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
> > ---
> > +                       mode = GPIOD_OUT_HIGH;
> > +               else
> > +                       mode = GPIOD_OUT_LOW;
> > +
> > +               info->micd_pol_gpio = gpiod_get_optional(arizona->dev,
> > +                                                        "wlf,micd-pol",
> > +                                                        GPIOD_OUT_LOW);
> 
> You can use the devm_gpiod_get_optional() to manage the system
> resource automatically.
> 

We can't actually use the devm call here, we need to pass
arizona->dev as that is where the DT will reside, which is the
device for the MFD. But if the devm is attached to the device for
the MFD then it will not clear up when the extcon driver is
unloaded. As such we have to do the put manually.

I will look at respinning for the other comments.

Thanks,
Charles
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
