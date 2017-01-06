From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 1/4] phy: sun4i-usb: add support for V3s USB PHY
Date: Fri, 6 Jan 2017 14:56:24 +0100
Message-ID: <20170106135624.kbjdvb3wtytfj6ob@lukather>
References: <20170103152534.20118-1-icenowy@aosc.xyz>
 <20170103152534.20118-2-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3318597970411480789=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170103152534.20118-2-icenowy@aosc.xyz>
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
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>, Chen-Yu Tsai <wens@csie.org>, Bin Liu <b-liu@ti.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============3318597970411480789==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mbdkkeg4vvpavmhu"
Content-Disposition: inline


--mbdkkeg4vvpavmhu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 03, 2017 at 11:25:31PM +0800, Icenowy Zheng wrote:
> Allwinner V3s come with a USB PHY controller slightly different to other
> SoCs, with only one PHY.
>=20
> Add support for it.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--mbdkkeg4vvpavmhu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYb6IEAAoJEBx+YmzsjxAguowP/3rO9xruhyaVcoQ0AdGC0bfV
A3NxVIBaoXtgVbKvrFbPzjxrvRW6PuNpRAgFDHRjvWIftT9sUVoEv0GIUbZbZyUp
0qXhcMcPf8EG75R3BnABT2zlRyD9cplaUeKce/enOjKvokbwsOcY9xcQS+f4gR6R
ODuLBW02ZMB6BOwL05ofD2/JEZb00NJ2jmR0yVMv05ITcICgsksX+s1/7n5HxkEK
k5iiAkSjeQX3UYwJYHbIq7ZUA2GHB3jpTz7UmQYnBG8acpxLeWQa+skmlZc7DhLM
IEO4stLtw6iU93EbTcZ7Hf/5gDsKDV7r8W8vpSHaAEZfeRQ2jwrYcYUiYuHL7BsS
I0ZM7dvJUUUUOSlwt3/UuTMSRn4ng1bvJ7pPEhJakmS0wr5x19t3cVSxIRskQMfL
EAxIp1VHenRx6FvcN5o2uzPKIV32rNl5C5RKxdvUX/1G4yAMRcErwa5CNx/+uAhV
gAoo5Ynw44tKHBI7/lsDaokbx5LUgr/k+vCXrNZ9NYbpzVae276LFxM/JKTLoNZE
yiV76fTXPdc/bO/IfRiLLqfFSkjz+MxCieGadlXhJao+MMLjts9m4wLsNa+wzEJO
nt3lEqOOl/BZJRJHEKQ5OVqwx7NYdoHTUBTnnvF/nqnVXhmL+QTYXEagdTwWzl9G
YQSF1bhosIwd9m1WZ4n8
=RUvg
-----END PGP SIGNATURE-----

--mbdkkeg4vvpavmhu--


--===============3318597970411480789==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3318597970411480789==--
