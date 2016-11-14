From: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Subject: RE: [PATCH 3/5] media: Add new SDR formats SC16, SC18 & SC20
Date: Mon, 14 Nov 2016 16:20:11 +0000
Message-ID: <SG2PR06MB1038A5C7419F6EDE6B880A1BC3BC0@SG2PR06MB1038.apcprd06.prod.outlook.com>
References: <1478706284-59134-1-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
 <1478706284-59134-4-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
 <502a606c-2d66-4257-af17-7b7f35f2c839@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <502a606c-2d66-4257-af17-7b7f35f2c839@xs4all.nl>
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "mchehab@kernel.org" <mchehab@kernel.org>, "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, "crope@iki.fi" <crope@iki.fi>
Cc: Chris Paterson <Chris.Paterson2@renesas.com>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Hans,

Thanks for the review comments.

> Subject: Re: [PATCH 3/5] media: Add new SDR formats SC16, SC18 & SC20
>=20
> On 11/09/2016 04:44 PM, Ramesh Shanmugasundaram wrote:
> > This patch adds support for the three new SDR formats. These formats
> > were prefixed with "sliced" indicating I data constitutes the top half
> > and Q data constitutes the bottom half of the received buffer.
>=20
> The standard terminology for video formats is "planar". I am leaning
> towards using that here as well.
>=20
> Any opinions on this?

Shall I rename the formats as "PC16", "PC18" & "PC20"?
For formats that do IQ IQ IQ... I shall use the regular formats "CUXX" when=
 I introduce them.

Thanks,
Ramesh

>=20
> 	Hans
>=20
> >
> > V4L2_SDR_FMT_SCU16BE - 14-bit complex (I & Q) unsigned big-endian
> > sample inside 16-bit. V4L2 FourCC: SC16
> >
> > V4L2_SDR_FMT_SCU18BE - 16-bit complex (I & Q) unsigned big-endian
> > sample inside 18-bit. V4L2 FourCC: SC18
> >
> > V4L2_SDR_FMT_SCU20BE - 18-bit complex (I & Q) unsigned big-endian
> > sample inside 20-bit. V4L2 FourCC: SC20
> >
> > Signed-off-by: Ramesh Shanmugasundaram
> > <ramesh.shanmugasundaram@bp.renesas.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-ioctl.c | 3 +++
> >  include/uapi/linux/videodev2.h       | 3 +++
> >  2 files changed, 6 insertions(+)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c
> > b/drivers/media/v4l2-core/v4l2-ioctl.c
> > index 181381d..d36b386 100644
> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > @@ -1207,6 +1207,9 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc
> *fmt)
> >  	case V4L2_SDR_FMT_CS8:		descr =3D "Complex S8"; break;
> >  	case V4L2_SDR_FMT_CS14LE:	descr =3D "Complex S14LE"; break;
> >  	case V4L2_SDR_FMT_RU12LE:	descr =3D "Real U12LE"; break;
> > +	case V4L2_SDR_FMT_SCU16BE:	descr =3D "Sliced Complex U16BE"; break;
> > +	case V4L2_SDR_FMT_SCU18BE:	descr =3D "Sliced Complex U18BE"; break;
> > +	case V4L2_SDR_FMT_SCU20BE:	descr =3D "Sliced Complex U20BE"; break;
> >  	case V4L2_TCH_FMT_DELTA_TD16:	descr =3D "16-bit signed deltas"; break=
;
> >  	case V4L2_TCH_FMT_DELTA_TD08:	descr =3D "8-bit signed deltas"; break;
> >  	case V4L2_TCH_FMT_TU16:		descr =3D "16-bit unsigned touch data";
> break;
> > diff --git a/include/uapi/linux/videodev2.h
> > b/include/uapi/linux/videodev2.h index 4364ce6..34a9c30 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -666,6 +666,9 @@ struct v4l2_pix_format {
> >  #define V4L2_SDR_FMT_CS8          v4l2_fourcc('C', 'S', '0', '8') /*
> complex s8 */
> >  #define V4L2_SDR_FMT_CS14LE       v4l2_fourcc('C', 'S', '1', '4') /*
> complex s14le */
> >  #define V4L2_SDR_FMT_RU12LE       v4l2_fourcc('R', 'U', '1', '2') /*
> real u12le */
> > +#define V4L2_SDR_FMT_SCU16BE	  v4l2_fourcc('S', 'C', '1', '6') /*
> sliced complex u16be */
> > +#define V4L2_SDR_FMT_SCU18BE	  v4l2_fourcc('S', 'C', '1', '8') /*
> sliced complex u18be */
> > +#define V4L2_SDR_FMT_SCU20BE	  v4l2_fourcc('S', 'C', '2', '0') /*
> sliced complex u20be */
> >
> >  /* Touch formats - used for Touch devices */
> >  #define V4L2_TCH_FMT_DELTA_TD16	v4l2_fourcc('T', 'D', '1', '6') /* 16-
> bit signed deltas */
> >
