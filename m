From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 2/3] ARM: dts: sunxi: add support for Orange Pi Zero
 board
Date: Mon, 5 Dec 2016 10:05:30 +0100
Message-ID: <20161205090530.oleu2n3a7g4qtgta@lukather>
References: <20161121162421.800-1-icenowy@aosc.xyz>
 <20161121162421.800-2-icenowy@aosc.xyz>
 <5373671480239408@web31m.yandex.ru>
 <cdfd3c65-d473-badb-ea6a-035f7ab79217@arm.com>
 <20161201093619.gs6lmoxtlptp2jr6@lukather>
 <11498641480688550@web2g.yandex.ru>
 <efb30303-b9bb-7a7c-4478-af485991dd86@redhat.com>
 <11535601480689127@web2g.yandex.ru>
 <324c8820-aeea-3fad-0e02-1bdb8f675677@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5833498872835007115=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <324c8820-aeea-3fad-0e02-1bdb8f675677@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andre Przywara <andre.przywara@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Vishnu Patekar <vishnupatekar0510@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.xyz>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============5833498872835007115==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3zwp3rg36ovyqmya"
Content-Disposition: inline


--3zwp3rg36ovyqmya
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 02, 2016 at 04:10:46PM +0000, Andre Przywara wrote:
> Hi,
>=20
> On 02/12/16 14:32, Icenowy Zheng wrote:
> >=20
> >=20
> > 02.12.2016, 22:30, "Hans de Goede" <hdegoede@redhat.com>:
> >> Hi,
> >>
> >> On 02-12-16 15:22, Icenowy Zheng wrote:
> >>>  01.12.2016, 17:36, "Maxime Ripard" <maxime.ripard@free-electrons.com=
>:
> >>>>  On Mon, Nov 28, 2016 at 12:29:07AM +0000, Andr=E9 Przywara wrote:
> >>>>>   > Something more interesting happened.
> >>>>>   >
> >>>>>   > Xunlong made a add-on board for Orange Pi Zero, which exposes t=
he
> >>>>>   > two USB Controllers exported at expansion bus as USB Type-A
> >>>>>   > connectors.
> >>>>>   >
> >>>>>   > Also it exposes a analog A/V jack and a microphone.
> >>>>>   >
> >>>>>   > Should I enable {e,o}hci{2.3} in the device tree?
> >>>>>
> >>>>>   Actually we should do this regardless of this extension board. Th=
e USB
> >>>>>   pins are not multiplexed and are exposed on user accessible pins =
(just
> >>>>>   not soldered, but that's a detail), so I think they qualify for DT
> >>>>>   enablement. And even if a user can't use them, it doesn't hurt to=
 have
> >>>>>   them (since they are not multiplexed).
> >>>>
> >>>>  My main concern about this is that we'll leave regulators enabled by
> >>>>  default, for a minority of users. And that minority will prevent to=
 do
> >>>>  a proper power management when the times come since we'll have to k=
eep
> >>>>  that behaviour forever.
> >>>
> >>>  I think these users can add a 'fdt set /xxx/xxx status "disabled" ' .
> >>
> >> I don't think that will be necessary I'm pretty sure these extra usb
> >> ports do not have a regulator for the Vbus, they just hook directly
> >> to the 5V rail, can someone with a schematic check ?
> >=20
> > We seems to have still no schematics for the add-on board.
>=20
> From looking at the picture of that expansion board on the Aliexpress
> page and chasing the tracks, there is clearly no voltage regulator on
> there, it's just passive components. The 5V pin from the headers is
> routed forth and back between the two layers via some vias directly to
> the 5V pins of the USB sockets.
>=20
> > But something is sure is that there's no any regulator-related pins
> > on the add-on pinout. There's only USB DM and DP pins.
> >=20
> > So the Vbus must be directly connected to +5V.
>=20
> So yes, it is.
>=20
> But I think the question is moot anyways, since we don't provide DT
> support for that add-on board at that point anyways.
> One could imagine another board, though, which has regulators switched
> by GPIOs, but that would be their problem and they would have regulators
> specified in their specific DT snippet, then.
>=20
> So to summarize:
> - For that specific Orange Pi Zero board which we discuss the DT for
> there is no regulator support for the additional USB ports. Thus nothing
> we could turn off to save power.
> - A user could just take these USB brackets with pin headers that are so
> common in PCs to connect additional USB ports to the back of the box.
> One just needs to re-sort the pins, which is a matter of a minute.
> - As long as we don't provide any easy way of handling DT changes, we
> should enable the USB ports for the sake of the users of either those
> brackets or the expansion board. Any more sophisticated USB expansion
> board with regulators would need to amend the DT anyway.

I disagree with this. We already have different ways of changing the
DT at runtime, and even if we didn't I'd still disagree. Once you add
that, there's simply no going back. Saying "let's enable it and we'll
figure it out later" doesn't work, and is essentially a "enable it".

So what you're suggesting is to have those regulators enabled forever,
which might be the case on that board anyway, but definitely shouldn't
be policy.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--3zwp3rg36ovyqmya
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYRS3VAAoJEBx+YmzsjxAg0JsQAKI6o7G6Q6kjHeQfCyedZUph
Or0TlN4Kc/m5T+sPnxbPpNTNJtCjcX8Ws/+BTCNaM3ZkNSQOxGYjssaxyoolIy9d
IWp91RmTo1di9LrrfdX/4jR8/YjTLl/FlvTEEJVhpwIdaem1JQzF8VUGeWFkbC2/
er/5j2ZfREUa5JsFdie24+/N9m7nATEMUv7vY/cmA3UgMBQCdjquqibEU3Lff54a
ynPH9L1DwHFYQpN8A/E1NnW3qotfrnusX/CGXXYCbgA2ZdoTrVwJRiig0zI5TKEC
Xk6U1ngMeOBZQNdQQUe9gvLQE8AEjRym9O5iyvvddiU0EyABUd9IBvMZyOqT1WhP
yKFrs3vwLtE2aOBzmxv8WcEth2EzDoKKLCMvr/p6jB5fgVob0hgeNEyqXEOc+2a7
rrcfWIaIlPbO18z+tYp2nOeFcaoWcAOA9PjrMD7lFpxdf3DfHk6n8QDVFczysDit
klXQyK2V2luTw4056hAMh/xE9azRw4ndFAfRqWW7HY3n5NampIGDcQLmTRn6pSSe
ixlpLWOl98l7xSBkudnNNG4b1S5gn1ScgDBPN77HgurluublhJpWmoOca4yvR5oH
nGJpOA7y2EcYZNzAB0kHzi4kJbgZtIGoDCOYRPFZhIjhnCZ3Vu9G9Sna9zI0mtIJ
d76GfNPPoziCQqdeOvuO
=LK+5
-----END PGP SIGNATURE-----

--3zwp3rg36ovyqmya--


--===============5833498872835007115==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5833498872835007115==--
