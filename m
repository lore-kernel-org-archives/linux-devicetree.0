From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: Re: [PATCH] ARM: dts: sun6i-a31-app4-evb1.dts: Use sunxi-common-regulators.dtsi
Date: Fri, 9 May 2014 12:27:40 -0500
Message-ID: <20140509172740.GE7047@lukather>
References: <1399624987-12381-1-git-send-email-hdegoede@redhat.com>
 <536C97FD.3070906@free-electrons.com>
 <536C9A53.2060302@redhat.com>
 <536CA092.50300@free-electrons.com>
 <536CCC75.7050407@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jYUWvSWTDpDT74zJ"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBIFBWSNQKGQE3T4HKJQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <536CCC75.7050407-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--jYUWvSWTDpDT74zJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 09, 2014 at 02:39:17PM +0200, Hans de Goede wrote:
> Hi,
>=20
> On 05/09/2014 11:32 AM, Boris BREZILLON wrote:
> >=20
> > On 09/05/2014 11:05, Hans de Goede wrote:
> >> Hi,
> >>
> >> On 05/09/2014 10:55 AM, Boris BREZILLON wrote:
> >>> On 09/05/2014 10:43, Hans de Goede wrote:
> >>>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> >>>> ---
> >>>>  arch/arm/boot/dts/sun6i-a31-app4-evb1.dts | 8 +-------
> >>>>  1 file changed, 1 insertion(+), 7 deletions(-)
> >>>>
> >>>> diff --git a/arch/arm/boot/dts/sun6i-a31-app4-evb1.dts b/arch/arm/bo=
ot/dts/sun6i-a31-app4-evb1.dts
> >>>> index 270ab97..2bbf886 100644
> >>>> --- a/arch/arm/boot/dts/sun6i-a31-app4-evb1.dts
> >>>> +++ b/arch/arm/boot/dts/sun6i-a31-app4-evb1.dts
> >>>> @@ -13,6 +13,7 @@
> >>>> =20
> >>>>  /dts-v1/;
> >>>>  /include/ "sun6i-a31.dtsi"
> >>>> +/include/ "sunxi-common-regulators.dtsi"
> >>>> =20
> >>>>  / {
> >>>>  	model =3D "Allwinner A31 APP4 EVB1 Evaluation Board";
> >>>> @@ -49,15 +50,8 @@
> >>>>  	};
> >>>> =20
> >>>>  	reg_usb1_vbus: usb1-vbus {
> >>>> -		compatible =3D "regulator-fixed";
> >>>> -		pinctrl-names =3D "default";
> >>>>  		pinctrl-0 =3D <&usb1_vbus_pin_a>;
> >>>> -		regulator-name =3D "usb1-vbus";
> >>>> -		regulator-min-microvolt =3D <5000000>;
> >>>> -		regulator-max-microvolt =3D <5000000>;
> >>>> -		enable-active-high;
> >>>>  		gpio =3D <&pio 7 27 0>;
> >>>>  		status =3D "okay";
> >>>>  	};
> >>> I guess we could do the same for usb1_vbus_pin_a (keep the common
> >>> definition and change the allwinner,pins property).
> >> Hmm, what we do with other boards when the pin does not match the
> >> default is change the node name to something baord specific, ie
> >> usb1_vbus_pin_app4_evb1
> >=20
> > Okay.
> > How did you decide which pins should be put in the default definitions
> > (the most used ones among available boards ?) ?
>=20
> The pins used there are used on all-most all A10 and A20 boards,
> the sun5i (A10s / A13) boards seem to not really have any standard gpio
> they use, and I have not seen enough A31 boards yet to say anything sensi=
ble.
>=20
> We may need to rename the standard pins to include the platform name if
> A31 also uses the same pin everywhere (but a different one from A10).
>=20
> > I'm not sure defining new pin states for each board is a good solution,
> > because you'll embed unneeded pin states in your DTB.
> > Anyway, this is your call :-).
> >=20
> >> Which is why I did not remove the common bits from the pin,
> >> I did not notice you did not use a board specific name here.
> >=20
> > Then I guess it should be fixed in the same series.
> > BTW, AFAIK the original patch adding support for the APP4 EVB1 board has
> > not been applied yet, so I think we can fix it send a v2 of this patch.
>=20
> It is already in Maxime's dt-for-3.16 tree, so it is probably better to f=
ix
> this with a followup patch.

Actually, it's not (yet). I'll squash it into my serie.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--jYUWvSWTDpDT74zJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJTbRAMAAoJEBx+YmzsjxAgNYIP/3oUmMlBKhZpWgnPck3Q6SZD
NaGSEk7pYsh6Wuo1sk/WDbZAQ8KRRL6SPT+jrYdnlHfMXJtUDB3iATgwQKr8VsGc
VnBtr3+c2njn3dOgPM62tyQcQcQCLAuDvcKTSznPV7T9l/6+Oo7l69VIxTnXP4xd
Yp+tdEkk3ANe70WbAbmoAsvBYhOHs1ah+8IRAiMCk9KDVLfsGmjRRH9yF7BSSas9
RzSfw0U26bInQ5zoRt2HHTaVci0RnlXuc3svsXSIbBHq0EosHLlEY3NEEOYfifok
1XPWE92O1tN1ma4Cj6zxm4qDdIIh1wqWo+qkaov9d8fDhFkc/j5o5Qqu6MVMb8uh
17j2b8gg4SkcilekZ6w/B8BCmjuO33Ko6DvG+5OfrF1gJ8/LWOY3cCC2qoS0mwTw
XYF7y5IyzwbGoGRkPXl4+IsCw1GcHu77rgnjQbLka4ON3l2995brisWI/SL5X73S
w4vLecPyjL2jUCmtxCJAjnANdJ++263jyjoA6LCCP4R2pyHd2b7K/YECB7ZOQ23w
c89+Wo6z/5J59FxgVDIaJljrPLW8TfZTF5a7NucZLSkvwCtbAqZAjhpk2O8/XSVS
mYtiT5lIgcp31Tdy+Eb397Un6nwKOnqIvJoNm/zBMy9eZqF+tRHSLV/uNggZGExE
da/XkP+H42g7g00NUpBU
=1oAr
-----END PGP SIGNATURE-----

--jYUWvSWTDpDT74zJ--
