Return-Path: <SRS0=KL/Q=RO=st.com=denis.ciocca@kernel.org>
From: Denis CIOCCA <denis.ciocca@st.com>
Subject: RE: [PATCH 1/2] dt-bindings: iio: accel: add LIS2DE12 sensor device
 binding
Date: Mon, 11 Mar 2019 23:02:16 +0000
Message-ID: <681ca9e5102c4b59a49c5db1789c366c@SFHDAG2NODE1.st.com>
References: <20190305203252.13647-1-rjones@gateworks.com>
	<20190305203252.13647-2-rjones@gateworks.com>
	<2671a590a8394e76bd795c6bb187bfd1@SFHDAG2NODE1.st.com>
	<20190309182026.6866b037@archlinux> <20190309182310.25409803@archlinux>
In-Reply-To: <20190309182310.25409803@archlinux>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Jonathan Cameron <jic23@jic23.retrosnub.co.uk>
Cc: Robert Jones <rjones@gateworks.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, "Lars-Peter Clausen  <lars@metafoo.de>, Peter Meerwald-Stadler" <pmeerw@pmeerw.net>
List-ID: <devicetree@vger.kernel.org>

Yes, you are right Jonathan.

I saw that before but since there are already 15 sensors that are not follo=
wing my initial convention anymore, I decided to let it go...Not sure I'll =
be able to catch all of the patches.
But your point is actually correct. I know it's a small thing but anyway wh=
at do you thing about?

Denis


-----Original Message-----
From: Jonathan Cameron <jic23@jic23.retrosnub.co.uk>=20
Sent: Saturday, March 9, 2019 10:23 AM
To: Denis CIOCCA <denis.ciocca@st.com>
Cc: Robert Jones <rjones@gateworks.com>; Rob Herring <robh+dt@kernel.org>; =
Mark Rutland <mark.rutland@arm.com>; devicetree@vger.kernel.org; linux-iio@=
vger.kernel.org; Hartmut Knaack <knaack.h@gmx.de>; Lars-Peter Clausen <lars=
@metafoo.de>; Peter Meerwald-Stadler <pmeerw@pmeerw.net>
Subject: Re: [PATCH 1/2] dt-bindings: iio: accel: add LIS2DE12 sensor devic=
e binding

On Sat, 9 Mar 2019 18:20:26 +0000
Jonathan Cameron <jic23@kernel.org> wrote:

> On Sat, 9 Mar 2019 01:14:14 +0000
> Denis CIOCCA <denis.ciocca@st.com> wrote:
>=20
> > Acked-by: Denis Ciocca <denis.ciocca@st.com>
> Applied to the togreg branch of iio.git and pushed out as testing for=20
> the autobuilders to play with it.
>=20
> Thanks
>=20
> Jonathan
Actually, sorry too fast to click send!

Why the -accel postfix?

That is normally only done for devices with multiple separate sensors withi=
n them.  That isn't true as far as I can see for this one.

Jonathan

>=20
> >=20
> > Thanks,
> > Denis
> >=20
> >=20
> > -----Original Message-----
> > From: linux-iio-owner@vger.kernel.org=20
> > <linux-iio-owner@vger.kernel.org> On Behalf Of Robert Jones
> > Sent: Tuesday, March 5, 2019 12:33 PM
> > To: Jonathan Cameron <jic23@kernel.org>; Rob Herring=20
> > <robh+dt@kernel.org>; Mark Rutland <mark.rutland@arm.com>
> > Cc: devicetree@vger.kernel.org; linux-iio@vger.kernel.org; Hartmut=20
> > Knaack <knaack.h@gmx.de>; Lars-Peter Clausen <lars@metafoo.de>;=20
> > Peter Meerwald-Stadler <pmeerw@pmeerw.net>; Robert Jones=20
> > <rjones@gateworks.com>
> > Subject: [PATCH 1/2] dt-bindings: iio: accel: add LIS2DE12 sensor=20
> > device binding
> >=20
> > Signed-off-by: Robert Jones <rjones@gateworks.com>
> > ---
> >  Documentation/devicetree/bindings/iio/st-sensors.txt | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/iio/st-sensors.txt=20
> > b/Documentation/devicetree/bindings/iio/st-sensors.txt
> > index 52ee4ba..7f24b33 100644
> > --- a/Documentation/devicetree/bindings/iio/st-sensors.txt
> > +++ b/Documentation/devicetree/bindings/iio/st-sensors.txt
> > @@ -49,6 +49,7 @@ Accelerometers:
> >  - st,lis2dw12
> >  - st,lis3dhh
> >  - st,lis3de
> > +- st,lis2de12-accel
> > =20
> >  Gyroscopes:
> >  - st,l3g4200d-gyro
>=20
