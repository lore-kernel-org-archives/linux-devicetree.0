From: Richard Fitzgerald <rf-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH v2] mfd: arizona: Add DT options for
 max_channels_clocked and PDM speaker config
Date: Mon, 5 Sep 2016 10:22:36 +0100
Message-ID: <1473067356.4359.13.camel@rf-debian.wolfsonmicro.main>
References: <1472635543-21577-1-git-send-email-rf@opensource.wolfsonmicro.com>
         <20160902153458.GA28352@rob-hp-laptop>
         <1472831784.4359.6.camel@rf-debian.wolfsonmicro.main>
         <CAL_JsqJpO0U3KggMddM4HB5ZNN4V2RW1ih9iQYUuvFihhS_jkA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJpO0U3KggMddM4HB5ZNN4V2RW1ih9iQYUuvFihhS_jkA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2016-09-02 at 12:51 -0500, Rob Herring wrote:
> On Fri, Sep 2, 2016 at 10:56 AM, Richard Fitzgerald
> <rf-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org> wrote:
> > On Fri, 2016-09-02 at 10:34 -0500, Rob Herring wrote:
> >> On Wed, Aug 31, 2016 at 10:25:43AM +0100, Richard Fitzgerald wrote:
> >> > This patch adds DT settings for the max_channels_clocked, spk_fmt and
> >> > spk_mute pdata.
> >> >
> >> > Signed-off-by: Richard Fitzgerald <rf-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
> >> > ---
> >> >  Documentation/devicetree/bindings/mfd/arizona.txt | 11 ++++++++
> >>
> >> Binding looks fine, but...
> >>
> >> >  drivers/mfd/arizona-core.c                        | 31 +++++++++++++++++++++++
> >> >  2 files changed, 42 insertions(+)
> >>
> >> > diff --git a/drivers/mfd/arizona-core.c b/drivers/mfd/arizona-core.c
> >> > index b95ff2d..36a9633 100644
> >> > --- a/drivers/mfd/arizona-core.c
> >> > +++ b/drivers/mfd/arizona-core.c
> >> > @@ -816,6 +816,37 @@ static int arizona_of_get_core_pdata(struct arizona *arizona)
> >> >             count++;
> >> >     }
> >> >
> >> > +   count = 0;
> >> > +   of_property_for_each_u32(arizona->dev->of_node,
> >> > +                            "wlf,max-channels-clocked",
> >> > +                            prop, cur, val) {
> >> > +           if (count == ARRAY_SIZE(pdata->max_channels_clocked))
> >> > +                   break;
> >> > +
> >> > +           pdata->max_channels_clocked[count] = val;
> >> > +           count++;
> >> > +   }
> >>
> >> of_property_read_u32_array doesn't work for you?
> >
> > No, it doesn't, because it doesn't read a variable-sized array.
> 
> But the next 2 loops are fixed with 2 elements, right? They should be

Ok, that's true the code is flexible size (because the number of AIFs
and the number of outputs varies between codecs, and the number actually
in use also varies) but the binding documentation I pulled in hasn't
been updated to match the code.

> converted. If not fixed size, you have the same pattern repeated 3
> times.

We originally had duplicated DT code in our driver factored out into
functions but this was rejected by mfd maintainer in favour of only
using the standard functions and duplicating code if necessary. I didn't
upstream that original patch so I don't know now what the justification
was.

> 
> Maybe we should fix of_property_read_u32_array to be more flexible and
> return an array less than a max size. Not sure if anyone relies on
> that case failing though, so leaving the 1st loop is fine.
> 
> Rob
> 
> >> > +   count = 0;
> >> > +   of_property_for_each_u32(arizona->dev->of_node, "wlf,spk-fmt", prop,
> >> > +                            cur, val) {
> >> > +           if (count == ARRAY_SIZE(pdata->spk_fmt))
> >> > +                   break;
> >> > +
> >> > +           pdata->spk_fmt[count] = val;
> >> > +           count++;
> >> > +   }
> >> > +
> >> > +   count = 0;
> >> > +   of_property_for_each_u32(arizona->dev->of_node, "wlf,spk-mute", prop,
> >> > +                            cur, val) {
> >> > +           if (count == ARRAY_SIZE(pdata->spk_mute))
> >> > +                   break;
> >> > +
> >> > +           pdata->spk_mute[count] = val;
> >> > +           count++;
> >> > +   }
> >> > +
> >> >     return 0;
> >> >  }
> >> >
> >> > --
> >> > 1.9.1
> >> >
> >> > --
> >> > To unsubscribe from this list: send the line "unsubscribe devicetree" in
> >> > the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> >> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
> >


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
