From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v2 2/2] [media] platform: add video-multiplexer
 subdevice driver
Date: Thu, 04 May 2017 11:26:18 +0200
Message-ID: <1493889978.2381.11.camel@pengutronix.de>
References: <20170502150913.2168-1-p.zabel@pengutronix.de>
         <20170502150913.2168-2-p.zabel@pengutronix.de>
         <20170503192836.GN7456@valkosipuli.retiisi.org.uk>
         <1493881652.2381.6.camel@pengutronix.de>
         <20170504071703.GS7456@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170504071703.GS7456-S+BSfZ9RZZmRSg0ZkenSGLdO1Tsj/99ntUK59QYPAWc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Steve Longerbeam <steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Sakari,

On Thu, 2017-05-04 at 10:17 +0300, Sakari Ailus wrote:
> Hi Philipp,
> 
> On Thu, May 04, 2017 at 09:07:32AM +0200, Philipp Zabel wrote:
> > On Wed, 2017-05-03 at 22:28 +0300, Sakari Ailus wrote:
> > > Hi Philipp,
> > > 
> > > Thanks for continuing working on this!
> > > 
> > > I have some minor comments below...
> > 
> > Thank you for the comments.
> > 
> > [...]
> > > Could you rebase this on the V4L2 fwnode patchset here, please?
> > > 
> > > <URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=v4l2-acpi>
> > >
> > > The conversion is rather simple, as shown here:
> > > 
> > > <URL:https://git.linuxtv.org/sailus/media_tree.git/commit/?h=v4l2-acpi&id=679035e11bfdbea146fed5d52fb794b34dc9cea6>
> > 
> > What is the status of this patchset? Will this be merged soon?
> 
> I intend to send a pull request once the next rc1 tag is pulled on
> media-tree master. It depends on patches in linux-pm tree that aren't in
> media-tree yet.

I get conflicts trying to merge v4l2-acpi into v4.11 or media-tree
master. Could you provide an updated version?

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
