From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] mtd: powernv: Support MTD_NO_ERASE
Date: Mon, 16 Oct 2017 17:55:17 +0200
Message-ID: <20171016175517.264e710a@bbrezillon>
References: <20170905202339.20732-1-wak@google.com>
        <20170921095930.4b473f91@bbrezillon>
        <CAPnigKmBujCoKdtXwnK6YsU=YvXM+MaDvDvKpUXEVgHzOC-VEw@mail.gmail.com>
        <8760cbv090.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8760cbv090.fsf-W0DJWXSxmBNbyGPkN3NxC2scP1bn1w/D@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: William Kennington <wak-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Cyril Bur <cyrilbur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stewart Smith <stewart-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Michael,

Sorry for the late reply.

On Fri, 22 Sep 2017 14:13:47 +1000
Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org> wrote:

> William Kennington <wak-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org> writes:
> 
> > +Cyril Bur and
> >
> > Not sure what you mean by mainline, but the commit is in the master branch
> > at
> > https://github.com/open-power/skiboot/commit/ba99af9b149d02438347b055e6e7d6bd15e33551  
> 
> I suspect Boris missed that you were referring to a skiboot commit and
> looked in Linux?
> 
> > I'm unsure about the documentation of the properties as I'm not really the
> > maintainer of any of the code on either side. I just added this DT property
> > for plumbing through the NO_ERASE flag. I added Cyril and Michael as they
> > both work closely with this driver and could comment better than I could.
> >
> > - William
> >
> > On Thu, Sep 21, 2017 at 12:59 AM Boris Brezillon <
> > boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> >  
> >> +the DT maintainers
> >>
> >> On Tue,  5 Sep 2017 13:23:39 -0700
> >> "William A. Kennington III" <wak-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org> wrote:
> >>  
> >> > As of skiboot@ba99af9b149d02438347b055e6e7d6bd15e33551, we now support  
> >>
> >> I didn't find this commit in mainline.
> >>  
> >> > adding a device tree entry which marks a flash device as not needing
> >> > erase. This patch adds support for setting MTD_NO_ERASE on powernvflash
> >> > devices which have the property no-erase.
> >> >
> >> > Signed-off-by: William A. Kennington III <wak-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> >> > ---
> >> >  drivers/mtd/devices/powernv_flash.c | 2 ++
> >> >  1 file changed, 2 insertions(+)
> >> >
> >> > diff --git a/drivers/mtd/devices/powernv_flash.c  
> >> b/drivers/mtd/devices/powernv_flash.c  
> >> > index f5396f26ddb4..fab9f9121b4c 100644
> >> > --- a/drivers/mtd/devices/powernv_flash.c
> >> > +++ b/drivers/mtd/devices/powernv_flash.c
> >> > @@ -196,6 +196,8 @@ static int powernv_flash_set_driver_info(struct  
> >> device *dev,  
> >> >       mtd->name = of_get_property(dev->of_node, "name", NULL);
> >> >       mtd->type = MTD_NORFLASH;
> >> >       mtd->flags = MTD_WRITEABLE;
> >> > +     if (of_property_read_bool(dev->of_node, "no-erase"))
> >> > +             mtd->flags |= MTD_NO_ERASE;  
> >>
> >> I don't see this property document in a DT binding doc, which is
> >> mandatory. Actually, there's no DT bindings doc at all for the
> >> 'ibm,opal-flash' device in mainline, is this normal?  
> 
> The binding doc is here:
> 
>   https://github.com/open-power/skiboot/blob/master/doc/device-tree/ibm%2Copal/flash.rst
> 
> But that property is not documented :(

Would be good to update the doc then :-).

> 
> We have some of the skiboot bindings also in the kernel tree, but there
> was talk of moving all the binding docs *out* of the kernel, so we never
> made an effort to put more in. I've lost track of whether there are
> still plans to move the binding docs out or not.


Okay, I don't know what's the policy for external DT bindings doc, but
maybe you can add a file in Document/devicetree/bindings/mtd pointing
to the skiboot doc.

Rob, what's your opinion?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
