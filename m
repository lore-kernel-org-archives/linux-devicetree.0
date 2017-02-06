From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v3 12/24] add mux and video interface bridge entity
 functions
Date: Mon, 06 Feb 2017 11:27:20 +0100
Message-ID: <1486376840.3005.28.camel@pengutronix.de>
References: <1483755102-24785-1-git-send-email-steve_longerbeam@mentor.com>
         <1483755102-24785-13-git-send-email-steve_longerbeam@mentor.com>
         <6948005.DnfziI9GIJ@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6948005.DnfziI9GIJ@avalon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-m1Uo1GnMJf0b1SvskN2V4Q@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, 2017-02-05 at 17:36 +0200, Laurent Pinchart wrote:
> Hi Steve,
> 
> Thank you for the patch
> 
> On Friday 06 Jan 2017 18:11:30 Steve Longerbeam wrote:
> > From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > 
> > Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > ---
> >  Documentation/media/uapi/mediactl/media-types.rst | 22 ++++++++++++++++++++
> >  include/uapi/linux/media.h                        |  6 ++++++
> >  2 files changed, 28 insertions(+)
> > 
> > diff --git a/Documentation/media/uapi/mediactl/media-types.rst
> > b/Documentation/media/uapi/mediactl/media-types.rst index 3e03dc2..023be29
> > 100644
> > --- a/Documentation/media/uapi/mediactl/media-types.rst
> > +++ b/Documentation/media/uapi/mediactl/media-types.rst
> > @@ -298,6 +298,28 @@ Types and flags used to represent the media graph
> > elements received on its sink pad and outputs the statistics data on
> >  	  its source pad.
> > 
> > +    -  ..  row 29
> > +
> > +       ..  _MEDIA-ENT-F-MUX:
> > +
> > +       -  ``MEDIA_ENT_F_MUX``
> > +
> > +       - Video multiplexer. An entity capable of multiplexing must have at
> > +         least two sink pads and one source pad, and must pass the video
> > +         frame(s) received from the active sink pad to the source pad.
> > Video
> > +         frame(s) from the inactive sink pads are discarded.
> 
> Apart from the comment made by Hans regarding the macro name, this looks good 
> to me.
> 
> > +    -  ..  row 30
> > +
> > +       ..  _MEDIA-ENT-F-VID-IF-BRIDGE:
> > +
> > +       -  ``MEDIA_ENT_F_VID_IF_BRIDGE``
> > +
> > +       - Video interface bridge. A video interface bridge entity must have
> > at
> > +         least one sink pad and one source pad. It receives video frame(s)
> > on
> > +         its sink pad in one bus format (HDMI, eDP, MIPI CSI-2, ...) and
> > +         converts them and outputs them on its source pad in another bus
> > format
> > +         (eDP, MIPI CSI-2, parallel, ...).
> 
> 
> The first sentence mentions *at least* one sink pad and one source pad, and 
> the second one refers to "its sink pad" and "its source pad". This is a bit 
> confusing. An easy option would be to require a single sink and a single 
> source pad, but that would exclude bridges that combine a multiplexer.

Would it be enough to just switch to plural?

"It receives video frame(s) on its sink pads in one bus format and
converts them and outputs them on its source pads in another bus
format"?

I fear if this is made too specific to single-input single-output
devices, a whole lot of multi-input devices will have to be split up
unnecessarily. Although in cases of freely configurable multiplexers, it
might also make sense to describe them as multiple entities. Especially
if they can run in parallel with different configurations.

> I also wonder whether "bridge" is the appropriate word here. Transceiver might 
> be a better choice, to insist on the fact that one of the two pads corresponds 
> to a physical interface that has special electrical properties (such as HDMI, 
> eDP, or CSI-2 that all require PHYs).

What media entity function would you suggest to use for the IPU CSI,
which basically is
 - a video interface bridge, because it converts media bus formats from
   an external (up to) 20-bit parallel bus to an internal 128-bit bus,
   with the option to either expand/compand/pack >8-bit per component
   pixel formats (so parts of a write pixel formatter)
 - also a video scaler, because it can crop and reduce width and/or
   height to 1/2 the original size

I wouldn't call it a transceiver, as it is completely contained inside
the SoC.

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
