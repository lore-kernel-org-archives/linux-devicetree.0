From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v7 15/34] add mux and video interface bridge entity
 functions
Date: Mon, 29 May 2017 15:51:17 +0200
Message-ID: <1496065877.17695.82.camel@pengutronix.de>
References: <1495672189-29164-1-git-send-email-steve_longerbeam@mentor.com>
         <1495672189-29164-16-git-send-email-steve_longerbeam@mentor.com>
         <3d3f0c9f-7315-69f0-877e-04b33c498c46@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3d3f0c9f-7315-69f0-877e-04b33c498c46-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Cc: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-medi
List-Id: devicetree@vger.kernel.org

On Mon, 2017-05-29 at 15:37 +0200, Hans Verkuil wrote:
> On 05/25/2017 02:29 AM, Steve Longerbeam wrote:
> > From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > 
> > Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > 
> > - renamed MEDIA_ENT_F_MUX to MEDIA_ENT_F_VID_MUX
> > 
> > Signed-off-by: Steve Longerbeam <steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
> > ---
> >   Documentation/media/uapi/mediactl/media-types.rst | 22 ++++++++++++++++++++++
> >   include/uapi/linux/media.h                        |  6 ++++++
> >   2 files changed, 28 insertions(+)
> > 
> > diff --git a/Documentation/media/uapi/mediactl/media-types.rst b/Documentation/media/uapi/mediactl/media-types.rst
> > index 2a5164a..47ee003 100644
> > --- a/Documentation/media/uapi/mediactl/media-types.rst
> > +++ b/Documentation/media/uapi/mediactl/media-types.rst
> > @@ -299,6 +299,28 @@ Types and flags used to represent the media graph elements
> >   	  received on its sink pad and outputs the statistics data on
> >   	  its source pad.
> >   
> > +    -  ..  row 29
> > +
> > +       ..  _MEDIA-ENT-F-VID-MUX:
> > +
> > +       -  ``MEDIA_ENT_F_VID_MUX``
> > +
> > +       - Video multiplexer. An entity capable of multiplexing must have at
> > +         least two sink pads and one source pad, and must pass the video
> > +         frame(s) received from the active sink pad to the source pad. Video
> > +         frame(s) from the inactive sink pads are discarded.
> > +
> > +    -  ..  row 30
> > +
> > +       ..  _MEDIA-ENT-F-VID-IF-BRIDGE:
> > +
> > +       -  ``MEDIA_ENT_F_VID_IF_BRIDGE``
> > +
> > +       - Video interface bridge. A video interface bridge entity must have at
> > +         least one sink pad and one source pad. It receives video frame(s) on
> > +         its sink pad in one bus format (HDMI, eDP, MIPI CSI-2, ...) and
> > +         converts them and outputs them on its source pad in another bus format
> > +         (eDP, MIPI CSI-2, parallel, ...).
> 
> I'm unhappy with the term 'bus format'. It's too close to 'mediabus format'.
> How about calling it "bus protocol"?

How about:

   "It receives video frames on its sink pad from an input video bus
    of one type (HDMI, eDP, MIPI CSI-2, ...), and outputs them on its
    source pad to an output video bus of another type (eDP, MIPI
    CSI-2, parallel, ...)."

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
