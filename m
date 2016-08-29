From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 3/3] ARM: dts: sun8i-q8-common: Add support for SDIO wifi
 controllers
Date: Mon, 29 Aug 2016 08:56:20 +0200
Message-ID: <20160829065620.GC7612@lukather>
References: <20160826145236.30210-1-hdegoede@redhat.com>
 <20160826145236.30210-4-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8422146039796597161=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160826145236.30210-4-hdegoede@redhat.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: devicetree <devicetree@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============8422146039796597161==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bAmEntskrkuBymla"
Content-Disposition: inline


--bAmEntskrkuBymla
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 26, 2016 at 04:52:36PM +0200, Hans de Goede wrote:
> Most of the sun8i q8 boards have an usb wifi controller, on the
> variants which use an USB wifi controller, this will result in a
> couple of error msg-s in dmesg when proving the sdio bus and
> an used mmc controller.
>=20
> The best way to deal with wifi on this boards really is to simply
> let the kernel auto-detect usb or sdio wifi controllers, so we
> will just have to live with the few errors in dmesg.

No, because that grabs PINs that might or might not be supposed to be
used for that, it leaves clocks and regulators enabled, which draw
power, to no end. And that's even worth since most boards will not use
it.

You can put the definition of the nodes in the DTSI, but the final
status will have to be in the (relevant) DTS.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--bAmEntskrkuBymla
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXw9yUAAoJEBx+YmzsjxAgHbAP/0M4Yrdf8rMt01wlnvLZ/i6F
2qSwY9Dn7yepgEQvzpOMj8+8xoknUbHSUTfIjsHDRfv1sk78WE654UzBME25WDzA
9gAXQQgmqXkt7lkmY9e0a9TWL5XjvQLCL9u7YtXb958rIFew1jXO9lB9mHAoa7K2
PrdHQwiSAxvyUBe0SwVhkAlU5Rg/WSAEywcqP5MkRNdA0nqHrpnqRlEuOhSYCLjO
mceTOaXYdJ5JaDgv04jUtMPJCvMhbuD9DS6RPwgXZQtG/vbJa3p5b3hXHc6ghz/H
ktRWRZs5wlmJOG5j0msMW7Jk6L3cnU+UkTTCCL4UmT++iBjRCfvsHnr2uzvTQ5Nw
VqvlFw6ur2ZFnXC2/S/udeCD6ZG9GvrHZAIljLwcviPYtwXYvYSSD73hMlxtXJTH
gz0gYPMdSZJX4cG/AVSNrYjAmLpQICK3Rj1LnefRiv2hkoxxPKDf7obFN/BW4UTx
jE1UU0XvdT3YzqTUODRmPNJQ2thM4Xt2VcQoOOnptmV1SA/vP5gfnd9uqLCGvGnc
+cGDCZX4T/iK6ghCKI1eFEAc6Unln3Fhfvvdu/DR+0mBkB7FJFQxs2RtFHYCdvFG
kSlfFBLFY0ZAHBGJWm4qO+ep+I8ynyLL1VmBOpoka/tplvuQlNwd5gIQevO+H8qq
67UpRXHYn2ZhtBuSsnnb
=elsx
-----END PGP SIGNATURE-----

--bAmEntskrkuBymla--


--===============8422146039796597161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8422146039796597161==--
