From: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH v2 5/5] mfd: arizona: Update DT binding document for
 jack detection invert
Date: Mon, 12 Oct 2015 09:15:26 +0100
Message-ID: <20151012081526.GA8805@ck-lbox>
References: <1443803363-3251-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1443803363-3251-6-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <20151005100105.GJ3243@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151005100105.GJ3243@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 05, 2015 at 11:01:05AM +0100, Lee Jones wrote:
> On Fri, 02 Oct 2015, Charles Keepax wrote:
> 
> > Add additional binding for inverting the polarity of the detection on
> > the jack detection pins.
> > 
> > Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/mfd/arizona.txt |    2 ++
> >  1 files changed, 2 insertions(+), 0 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/mfd/arizona.txt b/Documentation/devicetree/bindings/mfd/arizona.txt
> > index b98a11b..ef59696 100644
> > --- a/Documentation/devicetree/bindings/mfd/arizona.txt
> > +++ b/Documentation/devicetree/bindings/mfd/arizona.txt
> > @@ -73,6 +73,8 @@ Optional properties:
> >      If this node is not mentioned or if the value is unknown, then
> >      headphone detection mode is set to HPDETL.
> >  
> > +  - wlf,jd-invert : Invert the polarity of the jack detection switch
> > +
> 
> There are other jack detection properties in the bindings docs.
> 
> Please generify.

Apologies but not sure I follow what you want me to do here? Do
you just want me to drop the wlf, prefix on this one?

Thanks,
Charles
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
