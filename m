From: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Subject: Re: [PATCH v2 1/3] devicetree: mfd: Add binding for the TI LM3533
Date: Fri, 30 Oct 2015 14:16:46 -0700
Message-ID: <20151030211646.GE24668@usrtlx11787.corpusers.net>
References: <1445796586-28683-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1445963373-27790-1-git-send-email-bjorn.andersson@sonymobile.com>
 <20151030184220.GJ4058@x1>
 <20151030194150.GD24668@usrtlx11787.corpusers.net>
 <CAL_Jsq+d+_JgiEfQpgD29AnD+bM7Nq94-5NTjK=LFHNg162UOw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+d+_JgiEfQpgD29AnD+bM7Nq94-5NTjK=LFHNg162UOw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Johan Hovold <jhovold-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri 30 Oct 13:18 PDT 2015, Rob Herring wrote:

> On Fri, Oct 30, 2015 at 2:41 PM, Bjorn Andersson
> <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org> wrote:
> > On Fri 30 Oct 11:42 PDT 2015, Lee Jones wrote:
> >
> > Rob, please see the discussion regarding ti,boost-freq-khz below. Should
> > we both specify unit at the same time as we use standard units? (This is
> > not the first time I have to change this back and forth)
> >
> >> On Tue, 27 Oct 2015, Bjorn Andersson wrote:
> >>
[..]
> > The ti,boost-low-freq from the bq25890 binding is the only other
> > property I can find that describes the same thing. So I'm not sure I
> > follow you here.
> >
> >> Perhaps we need to create a set of generic bindings.
> >>
> >> Also, we usually measure DT bindings in HZ, not kHz.
> 
> Surprisingly, there are not enough examples to draw much conclusion.
> 
> > I thought we had defined frequencies to be in HZ and HZ only, but then
> > Rob's comment that I need to actually specify the unit doesn't make any
> > sense.
> 
> I don't think we decided, but let's decide now. Go with Hz.
> 

+1

> Really, I first prefer the property name has units and second having
> standardized units. But if there is a common property without units, I
> prefer that even more.
> 

You can find this property in a variety of hardware, but I don't think
it would make much sense to define this single property in a common
place today.

This seems to be the first case where we specify the unit on one of
these properties though.

> > Do we want these properties in a standard unit or do we want them
> > specifying the unit? Having both seems excessive.
> 
> You mean "freq" would imply the units? No, we want the actual units in
> the property.
> 

You're right, frequency can be measured in other units than Hz, I can't
think of one that would be applicable here though.

Either way, I'll slap on a unit to the property name - Hz that is...

Thanks for your input.

Regards,
Bjorn
