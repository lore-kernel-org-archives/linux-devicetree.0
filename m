Return-Path: <SRS0=CwX3=BE=leopardimaging.com=leonl@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20171005062901.ofexwxfnun45linq@valkosipuli.retiisi.org.uk>
References: <20171005000621.27841-1-leonl@leopardimaging.com>
 <20171005000621.27841-2-leonl@leopardimaging.com> <20171005062901.ofexwxfnun45linq@valkosipuli.retiisi.org.uk>
From: Leon Luo <leonl@leopardimaging.com>
Date: Thu, 5 Oct 2017 00:06:16 -0700
Message-ID: <CADu3m9y+GUaD3LXBO-TBpQj2VYR2Js_c85J9+B=ZZnpW7Jr9fQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] media:imx274 V4l2 driver for Sony imx274 CMOS sensor
Content-Type: multipart/alternative; boundary="001a113c3a1a477ef5055ac75caf"
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, hans.verkuil@cisco.com, sakari.ailus@linux.intel.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>
List-ID: <devicetree@vger.kernel.org>

--001a113c3a1a477ef5055ac75caf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

I just got an email saying the patch is accepted. Do I still need to do
anything here? Do I need to add  MEDIA_CAMERA_SUPPORT dependency to Kconfig
and submit a new version?

Regards,
Leon Luo
1130 Cadillac CT
Milpitas, CA 95035
Phone: (510)371-1169
Fax: (408) 217-1960
Email: leonl@leopardimaging.com
www.leopardimaging.com

On Wed, Oct 4, 2017 at 11:29 PM, Sakari Ailus <sakari.ailus@iki.fi> wrote:

> On Wed, Oct 04, 2017 at 05:06:21PM -0700, Leon Luo wrote:
> > The imx274 is a Sony CMOS image sensor that has 1/2.5 image size.
> > It supports up to 3840x2160 (4K) 60fps, 1080p 120fps. The interface
> > is 4-lane MIPI CSI-2 running at 1.44Gbps each.
> >
> > This driver has been tested on Xilinx ZCU102 platform with a Leopard
> > LI-IMX274MIPI-FMC camera board.
> >
> > Support for the following features:
> > -Resolutions: 3840x2160, 1920x1080, 1280x720
> > -Frame rate: 3840x2160 : 5 =E2=80=93 60fps
> >             1920x1080 : 5 =E2=80=93 120fps
> >             1280x720 : 5 =E2=80=93 120fps
> > -Exposure time: 16 =E2=80=93 (frame interval) micro-seconds
> > -Gain: 1x - 180x
> > -VFLIP: enable/disabledrivers/media/i2c/imx274.c
> > -Test pattern: 12 test patterns
> >
> > Signed-off-by: Leon Luo <leonl@leopardimaging.com>
> > Tested-by: S=C3=B6ren Brinkmann <soren.brinkmann@xilinx.com>
> > Acked-by: Sakari Ailus <sakari.ailus@iki.fi>
>
> Thanks!
>
> Applied with MEDIA_CAMERA_SUPPORT dependency to Kconfig.
>
> --
> Sakari Ailus
> e-mail: sakari.ailus@iki.fi
>

--001a113c3a1a477ef5055ac75caf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Sakari,<div><br></div><div><span style=3D"font-size:12.=
8px">I just got an email saying the patch is accepted.=C2=A0</span>Do I sti=
ll need to do anything here? Do I need to add=C2=A0<span style=3D"font-size=
:12.8px">=C2=A0</span><span style=3D"font-size:12.8px">MEDIA_CAMERA_SUPPORT=
 dependency to Kconfig and submit a new version?=C2=A0</span></div></div><d=
iv class=3D"gmail_extra"><br clear=3D"all"><div><div class=3D"gmail_signatu=
re" data-smartmail=3D"gmail_signature">Regards,<br>Leon Luo<br>1130 Cadilla=
c CT<br>Milpitas, CA 95035<br>Phone: (510)371-1169<br>Fax: (408) 217-1960<b=
r>Email: <a href=3D"mailto:leonl@leopardimaging.com" target=3D"_blank">leon=
l@leopardimaging.com</a><br><a href=3D"http://www.leopardimaging.com" targe=
t=3D"_blank">www.leopardimaging.com</a><br></div></div>
<br><div class=3D"gmail_quote">On Wed, Oct 4, 2017 at 11:29 PM, Sakari Ailu=
s <span dir=3D"ltr">&lt;<a href=3D"mailto:sakari.ailus@iki.fi" target=3D"_b=
lank">sakari.ailus@iki.fi</a>&gt;</span> wrote:<br><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex"><span class=3D"">On Wed, Oct 04, 2017 at 05:06:21PM -0700, Leon Luo =
wrote:<br>
&gt; The imx274 is a Sony CMOS image sensor that has 1/2.5 image size.<br>
&gt; It supports up to 3840x2160 (4K) 60fps, 1080p 120fps. The interface<br=
>
&gt; is 4-lane MIPI CSI-2 running at 1.44Gbps each.<br>
&gt;<br>
&gt; This driver has been tested on Xilinx ZCU102 platform with a Leopard<b=
r>
&gt; LI-IMX274MIPI-FMC camera board.<br>
&gt;<br>
&gt; Support for the following features:<br>
&gt; -Resolutions: 3840x2160, 1920x1080, 1280x720<br>
&gt; -Frame rate: 3840x2160 : 5 =E2=80=93 60fps<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01920x1080 : 5 =E2=80=93=
 120fps<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01280x720 : 5 =E2=80=93 =
120fps<br>
&gt; -Exposure time: 16 =E2=80=93 (frame interval) micro-seconds<br>
&gt; -Gain: 1x - 180x<br>
&gt; -VFLIP: enable/disabledrivers/media/<wbr>i2c/imx274.c<br>
&gt; -Test pattern: 12 test patterns<br>
&gt;<br>
&gt; Signed-off-by: Leon Luo &lt;<a href=3D"mailto:leonl@leopardimaging.com=
">leonl@leopardimaging.com</a>&gt;<br>
&gt; Tested-by: S=C3=B6ren Brinkmann &lt;<a href=3D"mailto:soren.brinkmann@=
xilinx.com">soren.brinkmann@xilinx.com</a>&gt;<br>
&gt; Acked-by: Sakari Ailus &lt;<a href=3D"mailto:sakari.ailus@iki.fi">saka=
ri.ailus@iki.fi</a>&gt;<br>
<br>
</span>Thanks!<br>
<br>
Applied with MEDIA_CAMERA_SUPPORT dependency to Kconfig.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Sakari Ailus<br>
e-mail: <a href=3D"mailto:sakari.ailus@iki.fi">sakari.ailus@iki.fi</a><br>
</font></span></blockquote></div><br></div>

--001a113c3a1a477ef5055ac75caf--
