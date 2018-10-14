From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH v4 07/10] dt-bindings: phy: add binding for
 Allwinner USB3 PHY
Date: Sun, 14 Oct 2018 10:41:29 +0800
Message-ID: <92e92f817d4df753d654124514e89c62f40d52eb.camel@aosc.io>
References: <20181004122855.22981-1-icenowy@aosc.io>
	 <20181004122855.22981-8-icenowy@aosc.io> <20181005205855.GA2458@bogus>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBCO2RLPAKGQETRIKY4Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20181005205855.GA2458@bogus>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

=E5=9C=A8 2018-10-05=E4=BA=94=E7=9A=84 15:58 -0500=EF=BC=8CRob Herring=E5=
=86=99=E9=81=93=EF=BC=9A
> On Thu, Oct 04, 2018 at 08:28:52PM +0800, Icenowy Zheng wrote:
> > The new Allwinner H6 SoC contains a USB3 PHY that is wired to the
> > external USB3 pins of the SoC.
> >=20
> > Add a device tree binding for the PHY.
> >=20
> > Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> > Reviewed-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> > ---
> > Changes in v4:
> > - Changed Vbus regulator property to vbus-supply.
> >=20
> > Changes in v3:
> > - Added Chen-Yu's Review tag.
> >=20
> > No changes in v2, v1.
> >=20
> >  .../bindings/phy/sun50i-usb3-phy.txt          | 23
> > +++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/phy/sun50i-
> > usb3-phy.txt
> >=20
> > diff --git a/Documentation/devicetree/bindings/phy/sun50i-usb3-
> > phy.txt b/Documentation/devicetree/bindings/phy/sun50i-usb3-phy.txt
> > new file mode 100644
> > index 000000000000..9f49c6b8c7e7
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/sun50i-usb3-phy.txt
> > @@ -0,0 +1,23 @@
> > +Allwinner sun50i USB3 PHY
> > +-----------------------
> > +
> > +Required properties:
> > +- compatible : should be one of
> > +  * allwinner,sun60i-h6-usb3-phy
> > +- reg : a list of offset + length pairs
> > +- #phy-cells : from the generic phy bindings, must be 0
> > +- clocks : phandle + clock specifier for the phy clock
> > +- resets : phandle + reset specifier for the phy reset
> > +
> > +Optional Properties:
> > +- vbus-supply : a phandle to a regulator that provides power to
> > VBUS.
>=20
> This belongs in a connector node as it is part of the connector
> unless=20
> the phy physically needs Vbus for power.
>=20
> But others have done this, so all the phys can just be wrong...

How should we reference the connector?

Via OF graph or simply a property in PHY node?

>=20
> > +
> > +Example:
> > +	usb3phy: phy@5210000 {
>=20
> usb-phy@
>=20
> > +		compatible =3D "allwinner,sun50i-h6-usb3-phy";
> > +		reg =3D <0x5210000 0x10000>;
> > +		clocks =3D <&ccu CLK_USB_PHY1>;
> > +		resets =3D <&ccu RST_USB_PHY1>;
> > +		#phy-cells =3D <0>;
> > +		status =3D "disabled";
>=20
> Don't show status in examples.
>=20
> > +	};
> > --=20
> > 2.18.0
> >=20
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
