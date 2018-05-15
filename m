Return-Path: <SRS0=zB2I=IC=gmail.com=ykaneko0929@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20180515072618.r6ag2qe5c4xensqj@verge.net.au>
References: <1522759385-17661-1-git-send-email-ykaneko0929@gmail.com>
 <1522759385-17661-2-git-send-email-ykaneko0929@gmail.com> <20180509181110.56ylpjqtefwnau3r@verge.net.au>
 <CAH1o70JNjsgeb5CHPZs3UunGR6jg6_C3d+EZjWs_B0389Z2Y-A@mail.gmail.com> <20180515072618.r6ag2qe5c4xensqj@verge.net.au>
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Date: Wed, 16 May 2018 01:03:47 +0900
Message-ID: <CAH1o70LUsnQuvFPYzEusqGhUOKROrw5CJk83qHuq0VmNrN4fcA@mail.gmail.com>
Subject: Re: [PATCH/RFT v3 1/3] thermal: rcar_thermal: add r8a77995 support
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: Simon Horman <horms@verge.net.au>
Cc: Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, Zhang Rui <rui.zhang@intel.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

2018-05-15 16:26 GMT+09:00 Simon Horman <horms@verge.net.au>:
> On Mon, May 14, 2018 at 06:11:59AM +0900, Yoshihiro Kaneko wrote:
>> Hi Simon-san,
>>
>> 2018=E5=B9=B45=E6=9C=8810=E6=97=A5(=E6=9C=A8) 3:11 Simon Horman <horms@v=
erge.net.au>:
>>
>> > On Tue, Apr 03, 2018 at 09:43:03PM +0900, Yoshihiro Kaneko wrote:
>> > > Add support for R-Car D3 (r8a77995) thermal sensor.
>> > >
>> > > Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
>> > > ---
>> > >  drivers/thermal/rcar_thermal.c | 154
>> > ++++++++++++++++++++++++++++++++---------
>> > >  1 file changed, 122 insertions(+), 32 deletions(-)
>> > >
>> > > diff --git a/drivers/thermal/rcar_thermal.c
>> > b/drivers/thermal/rcar_thermal.c
>> > > index 73e5fee..5ec47a9 100644
>> > > --- a/drivers/thermal/rcar_thermal.c
>> > > +++ b/drivers/thermal/rcar_thermal.c
>> > > @@ -58,10 +58,43 @@ struct rcar_thermal_common {
>> > >       spinlock_t lock;
>> > >  };
>> > >
>> > > +struct rcar_thermal_chip {
>> > > +     unsigned int use_of_thermal : 1;
>> > > +     unsigned int has_filonoff : 1;
>> > > +     unsigned int irq_per_ch : 1;
>> > > +     unsigned int needs_suspend_resume : 1;
>> > > +     unsigned int nirqs;
>> > > +};
>> > > +
>> > > +static const struct rcar_thermal_chip rcar_thermal =3D {
>> > > +     .use_of_thermal =3D 0,
>> > > +     .has_filonoff =3D 1,
>> > > +     .irq_per_ch =3D 0,
>> > > +     .needs_suspend_resume =3D 0,
>> > > +     .nirqs =3D 1,
>> > > +};
>> > > +
>> > > +static const struct rcar_thermal_chip rcar_gen2_thermal =3D {
>> > > +     .use_of_thermal =3D 1,
>> > > +     .has_filonoff =3D 1,
>> > > +     .irq_per_ch =3D 0,
>> > > +     .needs_suspend_resume =3D 0,
>> > > +     .nirqs =3D 1,
>> > > +};
>> > > +
>> > > +static const struct rcar_thermal_chip rcar_gen3_thermal =3D {
>> > > +     .use_of_thermal =3D 1,
>> > > +     .has_filonoff =3D 0,
>> > > +     .irq_per_ch =3D 1,
>> > > +     .needs_suspend_resume =3D 1,
>> > > +     .nirqs =3D 2,
>> > > +};
>> >
>> > The binding and dts patches in this series describe 3 interrupts
>> > for R-Car D3. But the above specifies two. Am I missing something obvi=
ous?
>>
>>
>> R-Car D3 has 3 interrupts, but this driver uses only 2 interrupts to det=
ect
>> a temperature change, rise or fall.
>
> Thanks, that makes perfect sense.
>
> Perhaps a comment above ".nirqs =3D 2" would make it more obvious to the =
casual
> observer?

I agree with you.
I will update this patch.
