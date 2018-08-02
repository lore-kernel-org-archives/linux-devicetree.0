From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v9 3/6] kernel/reboot.c: export pm_power_off_prepare
Date: Thu, 2 Aug 2018 12:47:27 +0200
Message-ID: <94d48ecb-7302-c7ed-e815-730be0426a04@pengutronix.de>
References: <20180802103425.3053-1-o.rempel@pengutronix.de>
 <20180802103425.3053-4-o.rempel@pengutronix.de>
 <20180802104443.GH9117@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="5AJLEBPFi8zhQJWYRI3WJOFLDJr5ahJGy"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180802104443.GH9117@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, kernel@pengutronix.de, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Liam Girdwood <lgirdwood@gmail.com>, Leonard Crestez <leonard.crestez@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Fabio Estevam <fabio.estevam@nxp.com>, Russell King <linux@armlinux.org.uk>, linux-imx@nxp.com, yibin.gong@nxp.com, "A.s. Dong" <aisheng.dong@nxp.com>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--5AJLEBPFi8zhQJWYRI3WJOFLDJr5ahJGy
Content-Type: multipart/mixed; boundary="AXOb8o839w5QurrTYeEqtVxfDzvKm5doU";
 protected-headers="v1"
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Mark Brown <broonie@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, kernel@pengutronix.de,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Leonard Crestez <leonard.crestez@nxp.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Fabio Estevam <fabio.estevam@nxp.com>,
 Russell King <linux@armlinux.org.uk>, linux-imx@nxp.com, yibin.gong@nxp.com,
 "A.s. Dong" <aisheng.dong@nxp.com>
Message-ID: <94d48ecb-7302-c7ed-e815-730be0426a04@pengutronix.de>
Subject: Re: [PATCH v9 3/6] kernel/reboot.c: export pm_power_off_prepare
References: <20180802103425.3053-1-o.rempel@pengutronix.de>
 <20180802103425.3053-4-o.rempel@pengutronix.de>
 <20180802104443.GH9117@sirena.org.uk>
In-Reply-To: <20180802104443.GH9117@sirena.org.uk>

--AXOb8o839w5QurrTYeEqtVxfDzvKm5doU
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 02.08.2018 12:44, Mark Brown wrote:
> On Thu, Aug 02, 2018 at 12:34:22PM +0200, Oleksij Rempel wrote:
>> Export pm_power_off_prepare. It is needed to implement power off on
>> Freescale/NXP iMX6 based boards with external power management
>> integrated circuit (PMIC).
>=20
> I thought we'd got an ack for this from Raphael on a previous version o=
r
> am I mistaken?
>=20

No, we got an:
"Anyway, I have no particular problems with exporting
pm_power_off_prepare via EXPORT_SYMBOL_GPL()."

Should i see it as ACK?


--AXOb8o839w5QurrTYeEqtVxfDzvKm5doU--

--5AJLEBPFi8zhQJWYRI3WJOFLDJr5ahJGy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEpENFL0P3hvQ7p0DDdQOiSHVI77QFAlti4T8ACgkQdQOiSHVI
77SA7Qf+PEBdxj2UynzNMWWjoQrpHpM98iIoXeKecu2cWw70ew2hGM6x07P+RcGH
R3JNhb7OioigTyxAEKf99TB4sRnoQwZKnaf2sBIUaT4w58rCIPNQV3zZJAmGef/U
o2n21ct8+G3DNgQ0HaK32XWVvtq0s0D0Jog60AH9gqTmBpC+jR+v1kVZ1CqI4Djm
urDDQjN4TusrUVlMCCWoVMhb1F8pddCrb6NAgBQQmK90wJJ+2eZzutvvEQMJMsUz
GFdQolaj/lOeuKzK1hZT6wRMh4OGRTln3jBuHYCdWJ5jLsuu+CMXww7mCZcfo8U3
v9w4e25L8O1m88nWMH5SA1ZwvHLGPw==
=YY42
-----END PGP SIGNATURE-----

--5AJLEBPFi8zhQJWYRI3WJOFLDJr5ahJGy--
