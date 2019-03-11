Return-Path: <SRS0=uWyh=RO=gateworks.com=rjones@kernel.org>
MIME-Version: 1.0
References: <20190305203252.13647-1-rjones@gateworks.com> <20190305203252.13647-2-rjones@gateworks.com>
 <2671a590a8394e76bd795c6bb187bfd1@SFHDAG2NODE1.st.com> <20190309182026.6866b037@archlinux>
 <20190309182310.25409803@archlinux>
In-Reply-To: <20190309182310.25409803@archlinux>
From: Bobby Jones <rjones@gateworks.com>
Date: Mon, 11 Mar 2019 09:31:48 -0700
Message-ID: <CALAE=UA=jALQ=6-Qitw5DX7_JfUctFrGGJ=qK4cMtDROoDwD2Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: iio: accel: add LIS2DE12 sensor device binding
Content-Type: text/plain; charset="UTF-8"
To: Jonathan Cameron <jic23@jic23.retrosnub.co.uk>
Cc: Denis CIOCCA <denis.ciocca@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>
List-ID: <devicetree@vger.kernel.org>

On Sat, Mar 9, 2019 at 10:23 AM Jonathan Cameron
<jic23@jic23.retrosnub.co.uk> wrote:
>
> On Sat, 9 Mar 2019 18:20:26 +0000
> Jonathan Cameron <jic23@kernel.org> wrote:
>
> > On Sat, 9 Mar 2019 01:14:14 +0000
> > Denis CIOCCA <denis.ciocca@st.com> wrote:
> >
> > > Acked-by: Denis Ciocca <denis.ciocca@st.com>
> > Applied to the togreg branch of iio.git and pushed
> > out as testing for the autobuilders to play with it.
> >
> > Thanks
> >
> > Jonathan
> Actually, sorry too fast to click send!
>
> Why the -accel postfix?
>
> That is normally only done for devices with multiple
> separate sensors within them.  That isn't true as
> far as I can see for this one.

To be completely honest, I simply mimicked the commit for the
st,lis2dh12-accel which appeared to be the closest equivalent after
comparing datasheets.
If this is incorrect I have no issues with removing the postfix.

Thanks,
Robert

> Jonathan
>
> >
> > >
> > > Thanks,
> > > Denis
> > >
> > >
> > > -----Original Message-----
> > > From: linux-iio-owner@vger.kernel.org <linux-iio-owner@vger.kernel.org> On Behalf Of Robert Jones
> > > Sent: Tuesday, March 5, 2019 12:33 PM
> > > To: Jonathan Cameron <jic23@kernel.org>; Rob Herring <robh+dt@kernel.org>; Mark Rutland <mark.rutland@arm.com>
> > > Cc: devicetree@vger.kernel.org; linux-iio@vger.kernel.org; Hartmut Knaack <knaack.h@gmx.de>; Lars-Peter Clausen <lars@metafoo.de>; Peter Meerwald-Stadler <pmeerw@pmeerw.net>; Robert Jones <rjones@gateworks.com>
> > > Subject: [PATCH 1/2] dt-bindings: iio: accel: add LIS2DE12 sensor device binding
> > >
> > > Signed-off-by: Robert Jones <rjones@gateworks.com>
> > > ---
> > >  Documentation/devicetree/bindings/iio/st-sensors.txt | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/iio/st-sensors.txt b/Documentation/devicetree/bindings/iio/st-sensors.txt
> > > index 52ee4ba..7f24b33 100644
> > > --- a/Documentation/devicetree/bindings/iio/st-sensors.txt
> > > +++ b/Documentation/devicetree/bindings/iio/st-sensors.txt
> > > @@ -49,6 +49,7 @@ Accelerometers:
> > >  - st,lis2dw12
> > >  - st,lis3dhh
> > >  - st,lis3de
> > > +- st,lis2de12-accel
> > >
> > >  Gyroscopes:
> > >  - st,l3g4200d-gyro
> >
>
