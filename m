From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 2/3] ARM: dts: sunxi: add support for Orange Pi Zero
 board
Date: Thu, 1 Dec 2016 10:36:19 +0100
Message-ID: <20161201093619.gs6lmoxtlptp2jr6@lukather>
References: <20161121162421.800-1-icenowy@aosc.xyz>
 <20161121162421.800-2-icenowy@aosc.xyz>
 <5373671480239408@web31m.yandex.ru>
 <cdfd3c65-d473-badb-ea6a-035f7ab79217@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3943118860790955038=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cdfd3c65-d473-badb-ea6a-035f7ab79217@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?iso-8859-1?Q?Andr=E9?= Przywara <andre.przywara@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Vishnu Patekar <vishnupatekar0510@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.xyz>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============3943118860790955038==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sobjbz35ztnadlxs"
Content-Disposition: inline


--sobjbz35ztnadlxs
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 28, 2016 at 12:29:07AM +0000, Andr=E9 Przywara wrote:
> > Something more interesting happened.
> >=20
> > Xunlong made a add-on board for Orange Pi Zero, which exposes the
> > two USB Controllers exported at expansion bus as USB Type-A
> > connectors.
> >=20
> > Also it exposes a analog A/V jack and a microphone.
> >=20
> > Should I enable {e,o}hci{2.3} in the device tree?
>=20
> Actually we should do this regardless of this extension board. The USB
> pins are not multiplexed and are exposed on user accessible pins (just
> not soldered, but that's a detail), so I think they qualify for DT
> enablement. And even if a user can't use them, it doesn't hurt to have
> them (since they are not multiplexed).

My main concern about this is that we'll leave regulators enabled by
default, for a minority of users. And that minority will prevent to do
a proper power management when the times come since we'll have to keep
that behaviour forever.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--sobjbz35ztnadlxs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYP+8PAAoJEBx+YmzsjxAgCSkQAIQGvIHsIV2oflWLBU9WTsQI
f8gUtQ799csf4yGXR0Qh14SOq9Yk0VSQiN5MmkjOlwLWDwUO9F54M1v/suMrAsQu
3hiaPH65MppAlTAgSW+UrR6Rz+X5VIMB6fS6WttRo8Xc3rQNt8xumzs0X57IDl5V
bH+dEVVR+Td4FIwDvDxb29QstU58ZCveDVjw1VdJlAN9sCJNHlyQ8uP3kEN8+LqO
cskGv2gTTt7wabjYeVlHt2wMR67m91cgC8nO6k7Y40EBrPeoWETv/HRNki0zDLz0
fcm887tZQn3ieaYW/Km4t21V8WBCHr4Z3U88VS/EcVH6PqE1ukX4mG6yfPr/BMKx
t4lUjC4HuiFjocrbUEiE4HOBiHxJsJo3aJNtbSdE9bm2INAQtytp+ZPjGOXppq8W
ocB+bZ2OKLie07sFtbXZPx63F+/CtDAe21u/LQ8qIAvS/gOhLf8BlcA/AOLvf4Il
nSfyo9UT3WDZIMNho2S8j9+m/9cPjo2P4wMgyXeMB44c/5yYKKa45eXs1In5YVaw
DLbhLiwxDyNP2KVwQUa/GVEDfTqUfrswGNtFkKTVjzWZYl+jvVDMLBIXhN3t5422
hbRz1d9QSSDfUj6H5j6B2E7hi8KV+tL196y5jJ14ryVyktUmh3ApDEFG1rj1I5Jr
pw8JYPdFwraxkCYXcjh4
=NjLr
-----END PGP SIGNATURE-----

--sobjbz35ztnadlxs--


--===============3943118860790955038==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3943118860790955038==--
