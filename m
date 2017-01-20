From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v3 3/6] clk: sunxi-ng: add support for V3s CCU
Date: Fri, 20 Jan 2017 21:38:13 +0100
Message-ID: <20170120203813.buj4d4wciuwnd2ey@lukather>
References: <20170119175448.11445-1-icenowy@aosc.xyz>
 <20170119175448.11445-3-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1270674870917537382=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170119175448.11445-3-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============1270674870917537382==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5wc43upobyobtccv"
Content-Disposition: inline


--5wc43upobyobtccv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 20, 2017 at 01:54:45AM +0800, Icenowy Zheng wrote:
> V3s has a similar but cut-down CCU to H3. Some muxes, especially clocks
> about CSI, are different, which makes it to need a new CCU driver.
>=20
> Add such a new driver for it.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> ---

Having a changelog somewhere would help. Why did you drop your cover
letter?

> +static const char * const mbus_parents[] =3D { "osc24M", "pll-periph0-2x=
", "pll-ddr" };

This is more that 80 characters and triggers a warning in
checkpatch...

Anyway, fixed and applied.
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--5wc43upobyobtccv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYgnUxAAoJEBx+YmzsjxAgCi8P/2xlCNQwoLfTcXHXSiRh3FWW
2GIWXSCWrKwX72VgGnSaetA/ZLA1h0UpXfcHkUtN1B1GjCtIWV08vXniA44kPi16
5hACPPc9iSsDX8qRuemzx3l+6Cdachm2LANA+BGyObRvWK3Wa1nk7n6HSZMDYUc4
26v2MmwpCRrmWVasa6zZDCdB81fwequ+uNSFMSzgIhB5l7lAGhYQ2g4AL92uvPFb
evG6OHRHL37/y5UXG3mL1khcN71ztP6jkMG1+KpAD9RAtgFt1gUC+w+7ci+zmUbi
2zEp4Z2QK0KO14HRscWb4pdVpsB8CvzX+eBVLhASnsIRS68uf1odqKgsaDUyL95U
AIvF2q4KuFXbwNO5kWM94GGZ8ywtC71IodaQiYxZFYtk8DlxNazSoQ1m2swu4GAR
DU9fElXGyoVa5hxoAR7BKr2IRPekcmOPfo3C80ROM92MwZYVht7Pg25dzOaFGOdx
KCHyTcITInLZxJp+Ayf8xo4LUOJ3yC4KIGFOIl2sI2bbCl1S/Ztp4c8XMp5AFMfV
jA21ntrn7u4FeZzGMkZgOTC3rh0mQm+8RjDlv3GacM31LaK7SLQ3iGsP15TQfsGl
n4hsR02PhP4xqWKRWaP0ozfgqNg021rJyT1V5oGDs2zBhCzjnkqF2O60on6ZS7FS
ojbCk7UHj0NThfkMyDcD
=Q6YX
-----END PGP SIGNATURE-----

--5wc43upobyobtccv--


--===============1270674870917537382==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1270674870917537382==--
