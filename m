From: Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 05/10] media: v4l: Add definitions for
 MPEG2 frame format and header metadata
Date: Fri, 04 May 2018 10:24:03 +0200
Message-ID: <1e27232735a0375f78f819c5f6b201aec475b1cd.camel@bootlin.com>
References: <20180419154124.17512-1-paul.kocialkowski@bootlin.com>
	 <20180419154536.17846-1-paul.kocialkowski@bootlin.com>
	 <CAAFQd5Dq4OeshtFaoxFK2357+-_=hzh0C7W=zksTWtaDuDCiGg@mail.gmail.com>
Reply-To: paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-U4fIwvrA8kmLG9u793QO"
Return-path: <linux-sunxi+bncBCOO3QWNR4KRB7VRWDLQKGQEB5JY5FQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAAFQd5Dq4OeshtFaoxFK2357+-_=hzh0C7W=zksTWtaDuDCiGg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "list-Y9sIeH5OGRo@public.gmane.org:IOMMU DRIVERS
 <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>,	Joerg   Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>," <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, wens-jdAy2FN1RRM@public.gmane.org, Pawel Osciak <pawel-FA/gS7QP4orQT0dZR+AlfA@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Alexandre Courbot <acourbot-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--=-U4fIwvrA8kmLG9u793QO
Content-Type: text/plain; charset="UTF-8"

Hi,

On Fri, 2018-04-20 at 09:51 +0000, Tomasz Figa wrote:
> Hi Paul,
> 
> On Fri, Apr 20, 2018 at 12:46 AM Paul Kocialkowski <
> paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
> [snip]
> > +struct v4l2_ctrl_mpeg2_frame_hdr {
> > +       __u32 slice_len;
> > +       __u32 slice_pos;
> > +       enum { MPEG1, MPEG2 } type;
> 
> Is enum suitable for UAPI?

As it turns out, it's not :)

> > +
> > +       __u16 width;
> > +       __u16 height;
> > +
> > +       enum { PCT_I = 1, PCT_P, PCT_B, PCT_D } picture_coding_type;
> 
> Ditto.
> 
> > +       __u8 f_code[2][2];
> > +
> > +       __u8 intra_dc_precision;
> > +       __u8 picture_structure;
> > +       __u8 top_field_first;
> > +       __u8 frame_pred_frame_dct;
> > +       __u8 concealment_motion_vectors;
> > +       __u8 q_scale_type;
> > +       __u8 intra_vlc_format;
> > +       __u8 alternate_scan;
> > +
> > +       __u8 backward_ref_index;
> > +       __u8 forward_ref_index;
> > +};
> > +
> >   #endif
> > diff --git a/include/uapi/linux/videodev2.h
> 
> b/include/uapi/linux/videodev2.h
> > index 31b5728b56e9..4b8336f7bcf0 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -635,6 +635,7 @@ struct v4l2_pix_format {
> >   #define V4L2_PIX_FMT_VC1_ANNEX_L v4l2_fourcc('V', 'C', '1', 'L')
> > /*
> 
> SMPTE 421M Annex L compliant stream */
> >   #define V4L2_PIX_FMT_VP8      v4l2_fourcc('V', 'P', '8', '0') /*
> > VP8 */
> >   #define V4L2_PIX_FMT_VP9      v4l2_fourcc('V', 'P', '9', '0') /*
> > VP9 */
> > +#define V4L2_PIX_FMT_MPEG2_FRAME v4l2_fourcc('M', 'G', '2', 'F') /*
> 
> MPEG2 frame */
> 
> >   /*  Vendor-specific formats   */
> >   #define V4L2_PIX_FMT_CPIA1    v4l2_fourcc('C', 'P', 'I', 'A') /*
> > cpia1
> 
> YUV */
> > @@ -1586,6 +1587,7 @@ struct v4l2_ext_control {
> >                  __u8 __user *p_u8;
> >                  __u16 __user *p_u16;
> >                  __u32 __user *p_u32;
> > +               struct v4l2_ctrl_mpeg2_frame_hdr __user
> 
> *p_mpeg2_frame_hdr;
> >                  void __user *ptr;
> >          };
> >   } __attribute__ ((packed));
> > @@ -1631,6 +1633,7 @@ enum v4l2_ctrl_type {
> >          V4L2_CTRL_TYPE_U8            = 0x0100,
> >          V4L2_CTRL_TYPE_U16           = 0x0101,
> >          V4L2_CTRL_TYPE_U32           = 0x0102,
> > +       V4L2_CTRL_TYPE_MPEG2_FRAME_HDR = 0x0109,
> 
> Why 0x0109?

Good catch. I see no reason in particular, so I'll probably make it
0x0103 eventually.

Cheers and thanks for the review!

-- 
Paul Kocialkowski, Bootlin (formerly Free Electrons)
Embedded Linux and kernel engineering
https://bootlin.com
--=-U4fIwvrA8kmLG9u793QO--
