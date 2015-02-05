From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH] media: i2c: add support for omnivision's ov2659 sensor
Date: Thu, 5 Feb 2015 11:55:28 +0000
Message-ID: <CA+V-a8vhRLC2EsKJRjuf1ZyABnSyeLBg+OTOKetzA62Eybqv3w@mail.gmail.com>
References: <1421365163-29394-1-git-send-email-prabhakar.csengg@gmail.com>
 <2517945.eGhlRo2yDj@avalon> <CA+V-a8uTzo3DL+rCGK2wPHtwqQTDxfzNOBXB+RVszJnThSBMqQ@mail.gmail.com>
 <3110055.vYzQi51GtK@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3110055.vYzQi51GtK@avalon>
Sender: linux-kernel-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: LMML <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Mauro Carvalho Chehab <m.chehab@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Sakari Ailus <sakari.ailus@iki.fi>, Hans Verkuil <hverkuil@xs4all.nl>
List-Id: devicetree@vger.kernel.org

Hi Laurent,

On Thu, Feb 5, 2015 at 11:53 AM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> Hi Prabhakar,
>
> On Wednesday 04 February 2015 20:55:02 Lad, Prabhakar wrote:
>> On Wed, Feb 4, 2015 at 5:03 PM, Laurent Pinchart wrote:
>> > On Thursday 15 January 2015 23:39:23 Lad, Prabhakar wrote:
>> >> From: Benoit Parrot <bparrot@ti.com>
>> >>
>> >> this patch adds support for omnivision's ov2659
>> >> sensor.
>> >>
>> >> Signed-off-by: Benoit Parrot <bparrot@ti.com>
>> >> Signed-off-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>
>> >> ---
>> >>
>> >>  .../devicetree/bindings/media/i2c/ov2659.txt       |   33 +
>> >>  .../devicetree/bindings/vendor-prefixes.txt        |    1 +
>> >>  MAINTAINERS                                        |   10 +
>> >>  drivers/media/i2c/Kconfig                          |   11 +
>> >>  drivers/media/i2c/Makefile                         |    1 +
>> >>  drivers/media/i2c/ov2659.c                         | 1623
>> >>  +++++++++++++++++
>> >>  include/media/ov2659.h                             |   33 +
>> >>  7 files changed, 1712 insertions(+)
>> >>  create mode 100644
>> >>  Documentation/devicetree/bindings/media/i2c/ov2659.txt
>> >>  create mode 100644 drivers/media/i2c/ov2659.c
>> >>  create mode 100644 include/media/ov2659.h
>
> [snip]
>
>> >> diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov265=
9.c
>> >> new file mode 100644
>> >> index 0000000..ce8ec8d
>> >> --- /dev/null
>> >> +++ b/drivers/media/i2c/ov2659.c
>> >> @@ -0,0 +1,1623 @@
>
> [snip]
>
>> >> +static const struct ov2659_framesize ov2659_framesizes[] =3D {
>> >> +     { /* QVGA */
>> >> +             .width          =3D 320,
>> >> +             .height         =3D 240,
>> >> +             .regs           =3D ov2659_qvga,
>> >> +             .max_exp_lines  =3D 248,
>> >> +     }, { /* VGA */
>> >> +             .width          =3D 640,
>> >> +             .height         =3D 480,
>> >> +             .regs           =3D ov2659_vga,
>> >> +             .max_exp_lines  =3D 498,
>> >> +     }, { /* SVGA */
>> >> +             .width          =3D 800,
>> >> +             .height         =3D 600,
>> >> +             .regs           =3D ov2659_svga,
>> >> +             .max_exp_lines  =3D 498,
>> >> +     }, { /* XGA */
>> >> +             .width          =3D 1024,
>> >> +             .height         =3D 768,
>> >> +             .regs           =3D ov2659_xga,
>> >> +             .max_exp_lines  =3D 498,
>> >> +     }, { /* 720P */
>> >> +             .width          =3D 1280,
>> >> +             .height         =3D 720,
>> >> +             .regs           =3D ov2659_720p,
>> >> +             .max_exp_lines  =3D 498,
>> >> +     }, { /* SXGA */
>> >> +             .width          =3D 1280,
>> >> +             .height         =3D 1024,
>> >> +             .regs           =3D ov2659_sxga,
>> >> +             .max_exp_lines  =3D 1048,
>> >> +     }, { /* UXGA */
>> >> +             .width          =3D 1600,
>> >> +             .height         =3D 1200,
>> >> +             .regs           =3D ov2659_uxga,
>> >> +             .max_exp_lines  =3D 498,
>> >> +     },
>> >> +};
>> >
>> > That's what bothers me the most about drivers for Omnivision senso=
rs. For
>> > some reason (I'd bet on lack of proper documentation) they list a =
couple
>> > of supported resolutions with corresponding register values, inste=
ad of
>> > computing the register values from the format configured by usersp=
ace.
>> > That's not the way we want to go. Prabhakar, do you have enough
>> > documentation to fix that ?
>>
>> I am afraid I have limited documentation here.
>
> How limited ? :-) I assume someone has documentation, given that the =
patch
> contains a larger number of #define's with register names.
>
Yea I don=E2=80=99t have NDA signed with TI/Omnivision :( because I whi=
ch I
lack the documentation.

Regards,
--Prabhakar
