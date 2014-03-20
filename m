From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH v2] dt: platform driver: Fill the resources before probe and defer if needed
Date: Thu, 20 Mar 2014 16:11:18 +0000
Message-ID: <20140320161118.B7075C4067A@trevor.secretlab.ca>
References: <20140220153042.DF053C4050F@trevor.secretlab.ca> < CACh+v5P=tcc-h_9r7Btwyu+jWjwH2ocmW4VCgDYqY7VMWsHuOA@mail.gmail.com> < 20140317142443.A2447C40A85@trevor.secretlab.ca> < CACh+v5M+0+C2JJwLqcp6erWa81kt=j1HucHiE52ufj1SO9F75w@mail.gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACh+v5M+0+C2JJwLqcp6erWa81kt=j1HucHiE52ufj1SO9F75w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jean-Jacques Hiblot <jjhiblot-dLKeG7h1OhBDOHtkgc7UlQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, gregkh <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, robh+dt <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 17 Mar 2014 16:20:03 +0100, Jean-Jacques Hiblot <jjhiblot-dLKeG7h1OhBDOHtkgc7UlQ@public.gmane.org> wrote:
> 2014-03-17 15:24 GMT+01:00 Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>:
> > On Mon, 17 Mar 2014 12:07:37 +0100, Jean-Jacques Hiblot <jjhiblot-dLKeG7h1OhBDOHtkgc7UlQ@public.gmane.org> wrote:
> >> Hi Grant,
> >>
> >> Sorry for the delay, I was having nice vacations.
> >>
> >> 2014-03-08 8:37 GMT+01:00 Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>:
> >> > On Fri, 21 Feb 2014 14:18:40 +0100, Jean-Jacques Hiblot <jjhiblot-dLKeG7h1OhBDOHtkgc7UlQ@public.gmane.org> wrote:
> >> >> The goal of this patch is to allow drivers to be probed even if at the time of
> >> >> the DT parsing some of their ressources are not available yet.
> >> >
> >> > Hi Jean-Jacques
> >> >
> >> > [...]
> >> >> +int of_platform_device_prepare(struct platform_device *dev)
> >> >> +{
> >> >> +     struct device_node *np;
> >> >> +     int i, irq_index;
> >> >> +     struct resource *res;
> >> >> +
> >> >> +     /*
> >> >> +      * This function applies only devices described in the DT.
> >> >> +      * Other platform devices have their ressources already populated.
> >> >> +      */
> >> >> +     np = dev->dev.of_node;
> >> >> +     if (!np)
> >> >> +             return 0;
> >> >
> >> > I believe we already talked about the above test. This function must
> >> > only process devices created by of_platform_populate(). Merely checking
> >> > the of_node pointer is not a sufficient test because there are other
> >> > paths in the kernel for creating platform_devices that might get a node
> >> > pointer attached to it.
> >> Yes we talked about this, but only to move it into of_platform_device_prepare().
> >> Is there an existing way to know for sure that the device has been
> >> created by of_platform_populate() ? I could not find one.
> >
> > No there isn't. That information is used at population time and then
> > discarded. We'd need to add a flag or registry to mark those devices.
> OK. As I see it, this could be done either by adding a new flag to
> struct device or by maintaining a private list of "of created" devices
> in of/platform.c.
> I favor modifying struct device as it's is by far the simplest but
> it's also more intrusive. Any advice ?

I think that by far is the easiest. It is that, or
of_platform_populate() would need to maintain a list of devices that are
to be used as a platform bus.

g.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
