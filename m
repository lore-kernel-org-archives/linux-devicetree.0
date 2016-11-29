From: Javi Merino <javi.merino-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] v4l: async: make v4l2 coexists with devicetree nodes in
 a dt overlay
Date: Tue, 29 Nov 2016 10:14:18 +0000
Message-ID: <20161129101418.GA1708@ct-lt-587>
References: <1479895797-7946-1-git-send-email-javi.merino@kernel.org>
 <20161123151042.GD16630@valkosipuli.retiisi.org.uk>
 <20161123161511.GB1753@ct-lt-587>
 <20161125082121.GB16630@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161125082121.GB16630-S+BSfZ9RZZmRSg0ZkenSGLdO1Tsj/99ntUK59QYPAWc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 25, 2016 at 10:21:21AM +0200, Sakari Ailus wrote:
Hi Sakari,

> On Wed, Nov 23, 2016 at 04:15:11PM +0000, Javi Merino wrote:
> > On Wed, Nov 23, 2016 at 05:10:42PM +0200, Sakari Ailus wrote:
> > > Hi Javi,
> > 
> > Hi Sakari,
> > 
> > > On Wed, Nov 23, 2016 at 10:09:57AM +0000, Javi Merino wrote:
> > > > In asd's configured with V4L2_ASYNC_MATCH_OF, if the v4l2 subdev is in
> > > > a devicetree overlay, its of_node pointer will be different each time
> > > > the overlay is applied.  We are not interested in matching the
> > > > pointer, what we want to match is that the path is the one we are
> > > > expecting.  Change to use of_node_cmp() so that we continue matching
> > > > after the overlay has been removed and reapplied.
> > > > 
> > > > Cc: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > > > Cc: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
> > > > Cc: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> > > > Signed-off-by: Javi Merino <javi.merino-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > > > ---
> > > > Hi,
> > > > 
> > > > I feel it is a bit of a hack, but I couldn't think of anything better.
> > > > I'm ccing devicetree@ and Pantelis because there may be a simpler
> > > > solution.
> > > 
> > > First I have to admit that I'm not an expert when it comes to DT overlays.
> > > 
> > > That said, my understanding is that the sub-device and the async sub-device
> > > are supposed to point to the exactly same DT node. I wonder if there's
> > > actually anything wrong in the current code.
> > > 
> > > If the overlay has changed between probing the driver for the async notifier
> > > and the async sub-device, there should be no match here, should there? The
> > > two nodes actually point to a node in a different overlay in that case.
> > 
> > Overlays are parts of the devicetree that can be added and removed.
> > When the overlay is applied, the camera driver is probed and does
> > v4l2_async_register_subdev().  However, v4l2_async_belongs() fails.
> > The problem is with comparing pointers.  I haven't looked at the
> > implementation of overlays in detail, but what I see is that the
> > of_node pointer changes when you remove and reapply an overlay (I
> > guess it's dynamically allocated and when you remove the overlay, it's
> > freed).
> 
> The concern here which we were discussing was whether the overlay should be
> relied on having compliant configuration compared to the part which was not
> part of the overlay.
> 
> As external components are involved, quite possibly also the ISP DT node
> will require changes, not just the image source (TV tuner, camera sensor
> etc.). This could be because of number of CSI-2 lanes or parallel bus width,
> for instance.
> 
> I'd also be interested in having an actual driver implement support for
> removing and adding a DT overlay first so we'd see how this would actually
> work. We need both in order to be able to actually remove and add DT
> overlays _without_ unbinding the ISP driver. Otherwise it should already
> work in the current codebase.

Unfortunately, the driver I'm working on is not upstream and I can't
submit it to mainline.  This patch fixes the issue for me, so I
thought it could be useful fix for the kernel.

Cheers,
Javi

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
