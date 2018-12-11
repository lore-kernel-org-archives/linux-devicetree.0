From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V3 1/2] dt-bindings: iio: light: isl29018: update power
 supply name
Date: Tue, 11 Dec 2018 09:18:33 -0600
Message-ID: <CAL_Jsq+sP_fsQaoT6FpZNRxjhPAhCcE8e-0xffUUxShcC2LuHw@mail.gmail.com>
References: <1544425521-775-1-git-send-email-Anson.Huang@nxp.com>
 <20181210232358.GA11621@bogus> <DB3PR0402MB3916E1651ABC07F6F788B265F5A60@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DB3PR0402MB3916E1651ABC07F6F788B265F5A60@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald <pmeerw@pmeerw.net>, Mark Rutland <mark.rutland@arm.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, NXP Linux Team <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 10, 2018 at 7:40 PM Anson Huang <anson.huang@nxp.com> wrote:
>
> Hi, Rob
>
> Best Regards!
> Anson Huang
>
> > -----Original Message-----
> > From: Rob Herring [mailto:robh@kernel.org]
> > Sent: 2018=E5=B9=B412=E6=9C=8811=E6=97=A5 7:24
> > To: Anson Huang <anson.huang@nxp.com>
> > Cc: jic23@kernel.org; knaack.h@gmx.de; lars@metafoo.de;
> > pmeerw@pmeerw.net; mark.rutland@arm.com; linux-iio@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; dl-linux-imx
> > <linux-imx@nxp.com>
> > Subject: Re: [PATCH V3 1/2] dt-bindings: iio: light: isl29018: update p=
ower
> > supply name
> >
> > On Mon, Dec 10, 2018 at 07:11:19AM +0000, Anson Huang wrote:
> > > According to datasheet, the isl29018 has "vddd/vdda" power supply, an=
d
> > > isl29023/isl29035 ONLY has "vdd" power supply, update the power suppl=
y
> > > name with "vdd" and "vdda" according to datasheet to cover all device=
s
> > > and avoid confusion.
> > >
> > > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> > > ---
> > >  Documentation/devicetree/bindings/iio/light/isl29018.txt | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/iio/light/isl29018.txt
> > > b/Documentation/devicetree/bindings/iio/light/isl29018.txt
> > > index b9bbde3..36f737d 100644
> > > --- a/Documentation/devicetree/bindings/iio/light/isl29018.txt
> > > +++ b/Documentation/devicetree/bindings/iio/light/isl29018.txt
> > > @@ -15,7 +15,9 @@ Optional properties:
> > >    Refer to interrupt-controller/interrupts.txt for generic interrupt=
 client
> > >    node bindings.
> > >
> > > -  - vcc-supply: phandle to the regulator that provides power to the =
sensor.
> > > +  - vdd-supply: phandle to the regulator that provides vdd power to =
the
> > sensor.
> > > +
> > > +  - vdda-supply: phandle to the regulator that provides vdda power t=
o the
> > sensor.
> >
> > Is this in use? You can't just change things if it is.
>
> I did NOT see any "vcc" in folder drivers/iio/light/, so I think it is NO=
T used at all,
> so I take this chance to update it according to datasheet. Thanks.

arch/arm/boot/dts/exynos5420-peach-pit.dts-629- light-sensor@44 {
arch/arm/boot/dts/exynos5420-peach-pit.dts:630:         compatible =3D
"isil,isl29018";
arch/arm/boot/dts/exynos5420-peach-pit.dts-631-         reg =3D <0x44>;
arch/arm/boot/dts/exynos5420-peach-pit.dts-632-         vcc-supply =3D
<&tps65090_fet5>;
arch/arm/boot/dts/exynos5420-peach-pit.dts-633- };

arch/arm/boot/dts/exynos5800-peach-pi.dts-629-  light-sensor@44 {
arch/arm/boot/dts/exynos5800-peach-pi.dts:630:          compatible =3D
"isil,isl29018";
arch/arm/boot/dts/exynos5800-peach-pi.dts-631-          reg =3D <0x44>;
arch/arm/boot/dts/exynos5800-peach-pi.dts-632-          vcc-supply =3D
<&tps65090_fet5>;
arch/arm/boot/dts/exynos5800-peach-pi.dts-633-  };

The rest of the dts files using this don't have a supply it seems. So
you need permission from the Exynos folks if you want to just drop
this. And also update their dts files.

Rob
