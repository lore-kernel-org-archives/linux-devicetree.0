From: Vishal Sagar <vsagar@xilinx.com>
Subject: RE: [PATCH 2/2] media: v4l: xilinx: Add Xilinx UHD-SDI Rx Subsystem
 driver
Date: Fri, 14 Jun 2019 12:15:24 +0000
Message-ID: <CH2PR02MB60885E9B81D89073BC451FC9A7EE0@CH2PR02MB6088.namprd02.prod.outlook.com>
References: <1559656556-79174-1-git-send-email-vishal.sagar@xilinx.com>
         <1559656556-79174-3-git-send-email-vishal.sagar@xilinx.com>
         <20190613220507.GA2473@smtp.xilinx.com>
 <39e6c0f7d7529da9906a17450a8bcdf416297520.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <39e6c0f7d7529da9906a17450a8bcdf416297520.camel@perches.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>, Vishal Sagar <vishal.sagar@xilinx.com>
Cc: Hyun Kwon <hyunk@xilinx.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Michal Simek <michals@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Dinesh Kumar <dineshk@xilinx.com>, Sandip Kothari <sandipk@xilinx.com>
List-Id: devicetree@vger.kernel.org

Hi Joe,

Thanks for reviewing.=20

> -----Original Message-----
> From: linux-media-owner@vger.kernel.org [mailto:linux-media-
> owner@vger.kernel.org] On Behalf Of Joe Perches
> Sent: Friday, June 14, 2019 4:02 AM
> To: Hyun Kwon <hyunk@xilinx.com>; Vishal Sagar <vishal.sagar@xilinx.com>
> Cc: Hyun Kwon <hyunk@xilinx.com>; Laurent Pinchart
> <laurent.pinchart@ideasonboard.com>; Mauro Carvalho Chehab
> <mchehab@kernel.org>; Michal Simek <michals@xilinx.com>; Rob Herring
> <robh+dt@kernel.org>; Mark Rutland <mark.rutland@arm.com>; linux-
> kernel@vger.kernel.org; linux-media@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; devicetree@vger.kernel.org; Dinesh Kumar
> <dineshk@xilinx.com>; Sandip Kothari <sandipk@xilinx.com>
> Subject: Re: [PATCH 2/2] media: v4l: xilinx: Add Xilinx UHD-SDI Rx Subsys=
tem
> driver
>=20
> EXTERNAL EMAIL
>=20
> On Thu, 2019-06-13 at 15:05 -0700, Hyun Kwon wrote:
> > On Tue, 2019-06-04 at 06:55:56 -0700, Vishal Sagar wrote:
>=20
> trivia:
>=20
> > > diff --git a/drivers/media/platform/xilinx/xilinx-sdirxss.c
> b/drivers/media/platform/xilinx/xilinx-sdirxss.c
> []
> > > +static int xsdirx_get_stream_properties(struct xsdirxss_state *state=
)
> > > +{
> []
> > > +   if (valid & XSDIRX_ST352_VALID_DS1_MASK) {
> > > +           payload =3D xsdirxss_read(core, XSDIRX_ST352_DS1_REG);
> > > +           byte1 =3D (payload >> XST352_PAYLOAD_BYTE1_SHIFT) &
> > > +                           XST352_PAYLOAD_BYTE_MASK;
>=20
> Is XST352_PAYLOAD_BYTE_MASK correct ?
> Should it be XST352_PAYLOAD_BYTE1_MASK ?
>=20

I had thought of it to be a generic mask to extract a byte out of 4 bytes i=
n a ST352 packet.
Hence named it as XST352_PAYLOAD_BYTE_MASK

> > > +           active_luma =3D (payload &
> XST352_BYTE3_ACT_LUMA_COUNT_MASK) >>
> > > +                           XST352_BYTE3_ACT_LUMA_COUNT_OFFSET;
> > > +           pic_type =3D (payload & XST352_BYTE2_PIC_TYPE_MASK) >>
> > > +                           XST352_BYTE2_PIC_TYPE_OFFSET;
> > > +           framerate =3D (payload >> XST352_BYTE2_FPS_SHIFT) &
> > > +                           XST352_BYTE2_FPS_MASK;
> > > +           tscan =3D (payload & XST352_BYTE2_TS_TYPE_MASK) >>
> > > +                           XST352_BYTE2_TS_TYPE_OFFSET;
> >
> > Please align consistently throughout the patch. I believe the checkpatc=
h
> > --strict warns on these.
>=20
> I believe not.
>=20
> Another possibility would be to use a macro like:
>=20
> #define mask_and_shift(val, type)       \
>         ((val) & (XST352_ ## type ## _MASK)) >> (XST352_ ## type ## _OFFS=
ET))
>=20
> > > +           sampling =3D (payload & XST352_BYTE3_COLOR_FORMAT_MASK) >=
>
> > > +                      XST352_BYTE3_COLOR_FORMAT_OFFSET;
>=20
> So these could be something like:
>=20
>                 sampling =3D mask_and_shift(payload, BYTE3_COLOR_FORMAT);
>=20

This looks like a good way. I will modify this in v2.=20
I will also modify the XST352_PAYLOAD_BYTE_MASK to=20
XST352_PAYLOAD_BYTE1_MASK so that this aligns with the macro.

Regards
Vishal Sagar
