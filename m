From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v8 5/6] regulator: pfuze100-regulator: provide
 pm_power_off_prepare handler
Date: Thu, 2 Aug 2018 10:11:36 +0200
Message-ID: <d76f7acb-b221-8c4f-1dc9-c1244e7b9f49@pengutronix.de>
References: <20180726092220.17250-1-o.rempel@pengutronix.de>
 <20180726092220.17250-6-o.rempel@pengutronix.de>
 <DB6PR04MB32233832762D02F1023861A1892A0@DB6PR04MB3223.eurprd04.prod.outlook.com>
 <06313062-70db-9c10-048e-78ca267da959@pengutronix.de>
 <20180730102452.GH5789@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0030413642364114293=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180730102452.GH5789@sirena.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Brown <broonie@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Robin Gong <yibin.gong@nxp.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Stephen Boyd <sboyd@codeaurora.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Russell King <linux@armlinux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, Leonard Crestez <leonard.crestez@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "A.s. Dong" <aisheng.dong@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0030413642364114293==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="zEkRnkqXSaGdvvXRCInmGVrLExVFxgGVY"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--zEkRnkqXSaGdvvXRCInmGVrLExVFxgGVY
Content-Type: multipart/mixed; boundary="mTbZiom1wH9cEZZgNRQSokrSLBJlrtbwB";
 protected-headers="v1"
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Mark Brown <broonie@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Leonard Crestez <leonard.crestez@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 dl-linux-imx <linux-imx@nxp.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "A.s. Dong" <aisheng.dong@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>,
 Russell King <linux@armlinux.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Gong <yibin.gong@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Message-ID: <d76f7acb-b221-8c4f-1dc9-c1244e7b9f49@pengutronix.de>
Subject: Re: [PATCH v8 5/6] regulator: pfuze100-regulator: provide
 pm_power_off_prepare handler
References: <20180726092220.17250-1-o.rempel@pengutronix.de>
 <20180726092220.17250-6-o.rempel@pengutronix.de>
 <DB6PR04MB32233832762D02F1023861A1892A0@DB6PR04MB3223.eurprd04.prod.outlook.com>
 <06313062-70db-9c10-048e-78ca267da959@pengutronix.de>
 <20180730102452.GH5789@sirena.org.uk>
In-Reply-To: <20180730102452.GH5789@sirena.org.uk>

--mTbZiom1wH9cEZZgNRQSokrSLBJlrtbwB
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 30.07.2018 12:24, Mark Brown wrote:
> On Mon, Jul 30, 2018 at 09:50:55AM +0200, Oleksij Rempel wrote:
>> On 27.07.2018 11:32, Robin Gong wrote:
>=20
>>>>  #include <linux/slab.h>
>>>> +#include <linux/kallsyms.h>
>=20
>>> Is it necessary?
>=20
>> yes, for pm_power_off_prepare
>=20
> That's a *weird* header to have to use for that symbol, are you sure
> there isn't something more specific - if there isn't there should be.

Hm... you right. Removed.


--mTbZiom1wH9cEZZgNRQSokrSLBJlrtbwB--

--zEkRnkqXSaGdvvXRCInmGVrLExVFxgGVY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEpENFL0P3hvQ7p0DDdQOiSHVI77QFAltivLgACgkQdQOiSHVI
77TnNQf+MM0ChHX/2Q58uX/+l764in4NhvoSOm0l+PlXqs+73JQUtyAShGxvNasZ
iTy8/vZlIf82z9uSyjJ3DKAqNkxK9Qu74w4HE02Yje6+kcknh+PBPf+MI0ICpzq4
UUdJXrLMoE4zKEqi550BNP4ExuRSja5wKIwuQ4ikvQL93Icrm1+oTX9np7UiZpfG
u31TPYE8HdAjGrWg4Q3gtlJ1/u+J+TZpa0wlHLYpY4/Q88DEt82mQhqwsP1jVREN
xm8GK3od4TRC8ytdQakBS5BWhdwtJH7MJVLinAdWLyPOjthAGr2VoYdcTvD9mWjp
zuLVg1Y6+hGIzcPdm+CufuTs/i6Yww==
=s2Qt
-----END PGP SIGNATURE-----

--zEkRnkqXSaGdvvXRCInmGVrLExVFxgGVY--


--===============0030413642364114293==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0030413642364114293==--
