From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 1/5] arm64: dts: allwinner: a64: Add i2c0 pins
Date: Tue, 13 Mar 2018 16:27:44 +0100
Message-ID: <20180313152744.fb2oo44v6lr4gyha@flea>
References: <20180312161050.7647-1-harald@ccbib.org>
 <20180312161050.7647-2-harald@ccbib.org>
 <5b7f1a15-011f-c386-4813-f0fb8a91dfd8@arm.com>
 <E1evfa8-0000O7-0e@stardust.g4.wien.funkfeuer.at>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0172939058238532995=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <E1evfa8-0000O7-0e@stardust.g4.wien.funkfeuer.at>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Harald Geyer <harald@ccbib.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, info@olimex.com, =?utf-8?B?QW5kcsOp?= Przywara <andre.przywara@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org


--===============0172939058238532995==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ahr2qnigrxqhluwv"
Content-Disposition: inline


--ahr2qnigrxqhluwv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 13, 2018 at 09:46:51AM +0100, Harald Geyer wrote:
> Andr=E9 Przywara writes:
> > On 12/03/18 16:10, Harald Geyer wrote:
> > > Add the proper pin group node to reference in board files.
> > >=20
> > > Signed-off-by: Harald Geyer <harald@ccbib.org>
> >=20
> > That looks correct to me, so:
> >=20
> > Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> >=20
> > But out of curiosity, what is this used for? In patch 5/5 I see it being
> > used, but without a clue for what? Shouldn't enabling an I2C node be
> > accompanied by some child node, presenting the device on the bus?
> > I guess this I2C is not on some kind of "header" on that laptop?
>=20
> I enabled it because the ANX6345 eDP-bridge is on that bus. There is
> no linux (mainline) driver for this chip at the moment, the bootloader
> initializes it. However I'm using the i2c-dev driver to read (and maybe)
> change some register values from user space.
>=20
> i2cdetect sees devices at 0x38, 0x39 and 0x3d - all of which might
> be the ANX6345. I haven't looked into this in detail.

That's alright then, just put a comment in the DT on what this bus is
used for.

Thanks!
Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--ahr2qnigrxqhluwv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlqn7fAACgkQ0rTAlCFN
r3TjTxAAmmzqKb0ju/+hpLfij7Jw0EIG4a0BbeCBwIAm8CmSbN4dXhUH4RmP8AUS
GXUUNl0iZReFDopjBbEVstQGTSrjytNhcSOb6iQXcKeTBqogU0nw/5gO06Y+wLNI
EcFUIW99iHyUgZlSLr4CLNJuJEjJJxiZGZ4KDrx3BvluZ+Ha+iyl0qhpf2k8H0EX
CZ+SNVjlERCCPGoG2k5Uhz9jzRkFO8rJKh42QsWtkll4vshAiawS+KLKsGaB6t+Y
sh+UAtWWzM1tZqirNR+R4D/kgWVWwFnRDIN2Jtm+kbJQwyzOMmgj3++x/h2t2XhV
xO77m5LagdO+oWC9vtcZCdNPwKr2VhpKHpWsm7iauyAztxU7gptDEtSKj85GIa8W
LVD/dN5Ii5pwkT0d1GQ7D3dtyQxoDkbqGBvbfA6J5eCTzAFV9qfgXSLqXXLQuAhI
WOEqIgjfasXGfFm8/9sGo0RvT6o961qKqZjJZIUySdyeOKra6WS6aN/RKS8SQQ9/
rLyZvFT1oHuUoQESX1qIdbCgZ3+AHgYxF5JNL+mBIa5v+QDmUiPKJsFLaojmHa5o
2uUdrlVz02J5EMeQX2RFruFBgZE/5u/sq5I9u5JSUaHSFJNTjkustfHb5MMWrvPU
QGstQsmK4nuCHkcCLo6PW4/7P1mxPxmOdqGddIPHVh+zVuZuM9A=
=fJXq
-----END PGP SIGNATURE-----

--ahr2qnigrxqhluwv--


--===============0172939058238532995==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0172939058238532995==--
