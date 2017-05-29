From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v7 00/34] i.MX Media Driver
Date: Mon, 29 May 2017 16:15:46 +0200
Message-ID: <1496067346.17695.91.camel@pengutronix.de>
References: <1495672189-29164-1-git-send-email-steve_longerbeam@mentor.com>
         <dd82968a-4c0b-12a4-f43b-7e63a255812d@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <dd82968a-4c0b-12a4-f43b-7e63a255812d-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Cc: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-medi
List-Id: devicetree@vger.kernel.org

On Mon, 2017-05-29 at 15:46 +0200, Hans Verkuil wrote:
> Hi Steve,
> 
> On 05/25/2017 02:29 AM, Steve Longerbeam wrote:
> > In version 7:
> > 
> > - video-mux: switched to Philipp's latest video-mux driver and updated
> >    bindings docs, that makes use of the mmio-mux framework.
> > 
> > - mmio-mux: includes Philipp's temporary patch that adds mmio-mux support
> >    to video-mux driver, until mux framework is merged.
> > 
> > - mmio-mux: updates to device tree from Philipp that define the i.MX6 mux
> >    devices and modifies the video-mux device to become a consumer of the
> >    video mmio-mux.
> > 
> > - minor updates to Documentation/media/v4l-drivers/imx.rst.
> > 
> > - ov5640: do nothing if entity stream count is greater than 1 in
> >    ov5640_s_stream().
> > 
> > - Previous versions of this driver had not tested the ability to enable
> >    multiple independent streams, for instance enabling multiple output
> >    pads from the imx6-mipi-csi2 subdevice, or enabling both prpenc and
> >    prpvf outputs. Marek Vasut tested this support and reported issues
> >    with it.
> > 
> >    v4l2_pipeline_inherit_controls() used the media graph walk APIs, but
> >    that walks both sink and source pads, so if there are multiple paths
> >    enabled to video capture devices, controls would be added to the wrong
> >    video capture device, and no controls added to the other enabled
> >    capture devices.
> > 
> >    These issues have been fixed. Control inheritance works correctly now
> >    even with multiple enabled capture paths, and (for example)
> >    simultaneous capture from prpenc and prpvf works also, and each with
> >    independent scaling, CSC, and controls. For example prpenc can be
> >    capturing with a 90 degree rotation, while prpvf is capturing with
> >    vertical flip.
> > 
> >    So the v4l2_pipeline_inherit_controls() patch has been dropped. The
> >    new version of control inheritance could be made generically available,
> >    but it would be more involved to incorporate it into v4l2-core.
> > 
> > - A new function imx_media_fill_default_mbus_fields() is added to setup
> >    colorimetry at sink pads, and these are propagated to source pads.
> > 
> > - Ensure that the current sink and source rectangles meet alignment
> >    restrictions before applying a new rotation control setting in
> >    prp-enc/vf subdevices.
> > 
> > - Chain the s_stream() subdev calls instead of implementing a custom
> >    stream on/off function that attempts to call a fixed set of subdevices
> >    in a pipeline in the correct order. This also simplifies imx6-mipi-csi2
> >    subdevice, since the correct MIPI CSI-2 startup sequence can be
> >    enforced completely in s_stream(), and s_power() is no longer
> >    required. This also paves the way for more arbitrary OF graphs
> >    external to the i.MX6.
> > 
> > - Converted the v4l2_subdev and media_entity ops structures to const.
> 
> What is the status as of v7?
>
>  From what I can tell patch 2/34 needs an Ack from Rob Herring, patches
> 4-14 are out of scope for the media subsystem, patches 20-25 and 27-34
> are all staging (so fine to be merged from my point of view).
> 
> I'm not sure if patch 26 (defconfig) should be applied while the imx
> driver is in staging. I would suggest that this patch is moved to the end
> of the series.
> 
> That leaves patches 15-19. I replied to patch 15 with a comment, patches
> 16-18 look good to me, although patches 17 and 18 should be combined to one
> patch since patch 17 won't compile otherwise.

Is this a problem? It won't break any builds as patch 17 depends on
CONFIG_MULTIPLEXER, which doesn't exist yet. I'm fine with merging the
two patches, though.

> Any idea when the multiplexer is expected to be merged? (just curious)

I have no idea. v15 of the multiplexer framework patchset was posted on
2017-05-14, is still waiting for comments.

> I would really like to get this merged for 4.13, so did I miss anything?

Seconded, and not that I can tell.

>  From what I can tell it is really just an Ack for patch 2/34.

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
