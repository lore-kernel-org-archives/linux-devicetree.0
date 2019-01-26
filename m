From: =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>
Subject: Re: [PATCH 1/2] drm: panel: Add Samsung s6e63m0 panel documentation
Date: Sat, 26 Jan 2019 22:23:07 +0100
Message-ID: <1914204.IzKZliLL3I@acerlaptop>
References: <20190125164645.19208-1-pawel.mikolaj.chmiel@gmail.com> <20190126205501.GA31182@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190126205501.GA31182@ravnborg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sam Ravnborg <sam@ravnborg.org>
Cc: thierry.reding@gmail.com, mark.rutland@arm.com, devicetree@vger.kernel.org, airlied@linux.ie, Jonathan Bakker <xc-racer2@live.ca>, linux-kernel@vger.kernel.org, krzk@kernel.org, robh+dt@kernel.org, dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com
List-Id: devicetree@vger.kernel.org

On sobota, 26 stycznia 2019 21:55:01 CET Sam Ravnborg wrote:
Hi
> Hi Pawel.
>=20
> Thanks for the patch, some comments follows.
> Please judge what comments you chose to follow, see this as suggestions.
>=20
> According to Documentation/devicetree/bindings/submitting-patches.rst:
>=20
> 	The preferred subject prefix for binding patches is:
> 	"dt-bindings: <binding dir>: ..."
>=20
> It would be a good idea to follow this practice in next revision.
I don't know how I forgot about this (will be fixed in next version).
>=20
> On Fri, Jan 25, 2019 at 05:46:44PM +0100, Pawe=C5=82 Chmiel wrote:
> > From: Jonathan Bakker <xc-racer2@live.ca>
> >=20
> > This commit adds documentation for Samsung s6e63m0 AMOLED LCD panel
> > driver.
> >=20
> > Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
> > Signed-off-by: Pawe=C5=82 Chmiel <pawel.mikolaj.chmiel@gmail.com>
> > ---
> >  .../display/panel/samsung,s6e63m0.txt         | 60 +++++++++++++++++++
> >  1 file changed, 60 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/panel/sam=
sung,s6e63m0.txt
> >=20
> > diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6=
e63m0.txt b/Documentation/devicetree/bindings/display/panel/samsung,s6e63m0=
=2Etxt
> > new file mode 100644
> > index 000000000000..4979200e2dd2
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.t=
xt
> > @@ -0,0 +1,60 @@
> > +Samsung s6e63m0 AMOLED LCD panel
> > +
> > +Required properties:
> > +  - compatible: "samsung,s6e63m0"
> > +  - reset-gpio: GPIO spec for reset pin
> The preferred name is reset-gpios (added 's')
Right, will be fixed.
>=20
> > +  - vdd3-supply: VDD regulator
> > +  - vci-supply: VCI regulator
> > +  - display-timings: timings for the connected panel as described by [=
1]
> Today, as is my best understanding, it is encouraged to specify the timing
> in the actual driver and not in DT,
Ok, will hardcode them in driver. Currently those timings (which i had adde=
d to my device dts) were taken from original kernel sources.
Need to check if there are other devices (not only using mainline kernel) u=
sing this panel and what timings are they using (hope they're the same).
>=20
> The example include a spi-max-frequency which is not mentioned?
spi-max-frequency shouldn't be here and will be removed.
>=20
> > +
> > +Optional properties:
> > +  - reset-delay: Delay in ms after adjusting reset-gpio, default 120ms
> > +  - power-on-delay: Delay in ms after powering on, default 25ms
> > +  - power-off-delay: Delay in ms before powering off, default 200ms
> > +  - panel-width-mm: physical panel width in mm
> > +  - panel-height-mm: physical panel height in mm
> Likewise these delays are also properties that today are included in the =
driver.
>=20
Need to check delays also (like timings).
> I cannot explain the background for this, this is just how things are don=
e.
>=20
> > +
> > +The device node can contain one 'port' child node with one child
> > +'endpoint' node, according to the bindings defined in [2]. This
> > +node should describe panel's video bus.
> > +
> > +[1]: Documentation/devicetree/bindings/display/panel/display-timing.txt
> > +[2]: Documentation/devicetree/bindings/media/video-interfaces.txt
> > +
> > +Example:
> > +
> > +		s6e63m0: display@0 {
> > +			compatible =3D "samsung,s6e63m0";
> > +			reg =3D <0>;
> > +			reset-gpio =3D <&mp05 5 1>;
> > +			vdd3-supply =3D <&ldo12_reg>;
> > +			vci-supply =3D <&ldo11_reg>;
> > +			spi-max-frequency =3D <1000000>;
> > +
> > +			power-on-delay =3D <0>;
> > +			power-off-delay =3D <0>;
> > +			reset-delay =3D <10>;
> > +			panel-width-mm =3D <53>;
> > +			panel-height-mm =3D <89>;
> > +
> > +			display-timings {
> > +				timing-0 {
> > +					/* 480x800@60Hz */
> > +					clock-frequency =3D <25628040>;
> > +					hactive =3D <480>;
> > +					vactive =3D <800>;
> > +					hfront-porch =3D <16>;
> > +					hback-porch =3D <16>;
> > +					hsync-len =3D <2>;
> > +					vfront-porch =3D <28>;
> > +					vback-porch =3D <1>;
> > +					vsync-len =3D <2>;
> > +				};
> > +			};
> > +
> > +			port {
> > +				lcd_ep: endpoint {
> > +					remote-endpoint =3D <&fimd_ep>;
> > +				};
> > +			};
> > +		};
>=20
> 	Sam
>=20
Thanks for review
