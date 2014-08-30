From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v6 2/2] dt-bindings: document Rockchip saradc
Date: Sat, 30 Aug 2014 14:41:33 +0200
Message-ID: <1737237.SiLPTrUivB@diego>
References: <1984475.34C1XMW1q3@diego> <8132020.MqcOnlblHg@diego> <53E38A18.5090203@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53E38A18.5090203-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, =?utf-8?B?ZWRkaWUo6JSh5p6rKQ==?= <cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Donnerstag, 7. August 2014, 15:15:52 schrieb Jonathan Cameron:
> On 23/07/14 22:24, Heiko St=FCbner wrote:
> > This add the necessary binding documentation for the saradc found i=
n all
> > recent processors from Rockchip.
> >=20
> > Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
>=20
> Applied to the togreg branch of iio.git.
> I have exercised a small amount of discretion wrt to the standard 3 w=
eeks
> as there really is very little different in here from previous versio=
ns
> and no one has raised any comments on them.

Did the binding patch make it into any tree? Because when I grep for sa=
radc in=20
either linux-next or the iio tree I only get patch 1/2 (the driver itse=
lf) but=20
the binding document is somehow missing.


Thanks
Heiko


>=20
> It's nearly 3 weeks anyway!
>=20
> J
>=20
> > ---
> > changes since v5:
> > - remove clock-frquency property as described in patch 1/2
> >=20
> >  .../bindings/iio/adc/rockchip-saradc.txt           | 24
> >  ++++++++++++++++++++++ 1 file changed, 24 insertions(+)
> >  create mode 100644
> >  Documentation/devicetree/bindings/iio/adc/rockchip-saradc.txt>=20
> > diff --git a/Documentation/devicetree/bindings/iio/adc/rockchip-sar=
adc.txt
> > b/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.txt new=
 file
> > mode 100644
> > index 0000000..5d3ec1d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.txt
> > @@ -0,0 +1,24 @@
> > +Rockchip Successive Approximation Register (SAR) A/D Converter bin=
dings
> > +
> > +Required properties:
> > +- compatible: Should be "rockchip,saradc"
> > +- reg: physical base address of the controller and length of memor=
y
> > mapped
> > +       region.
> > +- interrupts: The interrupt number to the cpu. The interrupt speci=
fier
> > format +              depends on the interrupt controller.
> > +- clocks: Must contain an entry for each entry in clock-names.
> > +- clock-names: Shall be "saradc" for the converter-clock, and "apb=
_pclk"
> > for +               the peripheral clock.
> > +- vref-supply: The regulator supply ADC reference voltage.
> > +- #io-channel-cells: Should be 1, see ../iio-bindings.txt
> > +
> > +Example:
> > +	saradc: saradc@2006c000 {
> > +		compatible =3D "rockchip,saradc";
> > +		reg =3D <0x2006c000 0x100>;
> > +		interrupts =3D <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> > +		clocks =3D <&cru SCLK_SARADC>, <&cru PCLK_SARADC>;
> > +		clock-names =3D "saradc", "apb_pclk";
> > +		#io-channel-cells =3D <1>;
> > +		vref-supply =3D <&vcc18>;
> > +	};
