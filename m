From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC/PATCH] of: platform: Remove unique device name enforcement
Date: Fri, 23 May 2014 11:48:40 +0900
Message-ID: <20140523024840.461FFC41625@trevor.secretlab.ca>
References: <1400432516-6802-1-git-send-email-ezequiel@vanguardiasur.com.ar>
	<CAL_JsqJKDFJDsGbhB-=W=ujgoRpnJGcJ9a74uhHjj4KFvRK=gg@mail.gmail.com>
	<20140520065014.493C3C412E3@trevor.secretlab.ca>
	<CAL_JsqJHhJ1ba5tOGnsNNp1DhPwnJWh8F9f2xL8b3FYj=kC1hA@mail.gmail.com>
	<20140521005357.4CAE4C418EF@trevor.secretlab.ca>
	<20140521074353.C8B79C4198A@trevor.secretlab.ca>
	<CAL_Jsq+pratjukD77FJHyHG5WST=zB=zcUgbpo-sA8X=uCojpA@mail.gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+pratjukD77FJHyHG5WST=zB=zcUgbpo-sA8X=uCojpA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Guido =?iso-8859-1?q?Mart=EDnez?= <guido-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 22 May 2014 13:31:37 -0500, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Wed, May 21, 2014 at 2:43 AM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> > On Wed, 21 May 2014 09:53:57 +0900, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> >> On Tue, 20 May 2014 13:30:02 -0500, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >> > On Tue, May 20, 2014 at 1:50 AM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> 
> [...]
> 
> >> > > Another way to handle it is to only add the suffix when a conflict
> >> > > actually occurs. That requires checking first whether or not a name will
> >> > > conflict and ammending it only when that happens. I don't know if that
> >> > > can be done nicely. I'll take a look.
> >> >
> >> > That was my idea as well and to move to a local number so you have
> >> > something like deviceA, deviceA.1, deviceB, deviceB.1 (maybe the
> >> > number is always appended). Perhaps a random number instead so no one
> >> > expects the names to be an ABI. ;)
> >>
> >> Another idea: how about fix the name to alwasy be the final component of
> >> the path name, followed by phandle. Anything that doesn't have a phandle
> >> can be assigned one at boot. That would guarantee uniqueness without the
> >> cost of trying to find duplicates.
> >>
> >> for example:
> >>       uart@10043000:0012
> >
> > Yet another approach. How about this patch? If the unit address cannot
> > be translated, then append the translated name of the parent.
> 
> I Ilke this, but...
> 
> > diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> > index 9c121819e813..e74fccbeb177 100644
> > --- a/drivers/of/platform.c
> > +++ b/drivers/of/platform.c
> > +               reg = of_get_property(node, "reg", NULL);
> > +               if (reg && of_can_translate_address(node)) {
> >                         addr = of_translate_address(node, reg);
> 
> This needs to be rebased on my fix and killing off of of_can_translate_address.

Done. I've rebased this and all the other stuff I've got queued up for
v3.16 on top of your for-next tree.

g.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
