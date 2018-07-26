From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v7 6/6] mailbox: Add support for i.MX7D messaging unit
Date: Thu, 26 Jul 2018 13:42:27 +0200
Message-ID: <e224cff8-0b47-9221-72fa-5db19d531492@pengutronix.de>
References: <20180726065331.6186-1-o.rempel@pengutronix.de>
 <20180726065331.6186-7-o.rempel@pengutronix.de>
 <CABb+yY1Fbj2GiO_zjwnvNFutjX_fRpxnuEoeu6Z3s4NAv2ugbg@mail.gmail.com>
 <a988e8b4-28be-f598-82de-421017409368@pengutronix.de>
 <CABb+yY2=mFr+gFuWyE+VyG6dWj3gKhTs6X+U9UjFu5N=4zU5uA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6005279572962109607=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CABb+yY2=mFr+gFuWyE+VyG6dWj3gKhTs6X+U9UjFu5N=4zU5uA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "A.s. Dong" <aisheng.dong@nxp.com>, Devicetree List <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, ", linux-arm-kernel"@lists.infradead.org, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, ",
 Sascha Hauer" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, srv_heupstream <linux-mediatek@lists.infradead.org>, Shawn Guo <shawnguo@kernel.org>, srv_heupstream <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============6005279572962109607==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="oFXFHtH6ZXj9lCmUePKXnIJdUdPR4oSio"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--oFXFHtH6ZXj9lCmUePKXnIJdUdPR4oSio
Content-Type: multipart/mixed; boundary="LtgkWXEkcUDgB04YeQjvQ1Zd9ZqdHb3jq";
 protected-headers="v1"
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "A.s. Dong" <aisheng.dong@nxp.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, ", linux-arm-kernel"@lists.infradead.org,
 ", linux-arm-kernel"@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 srv_heupstream <linux-mediatek@lists.infradead.org>,
 srv_heupstream <linux-arm-kernel@lists.infradead.org>,
 ", Sascha Hauer" <kernel@pengutronix.de>,
 Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
 dl-linux-imx <linux-imx@nxp.com>
Message-ID: <e224cff8-0b47-9221-72fa-5db19d531492@pengutronix.de>
Subject: Re: [PATCH v7 6/6] mailbox: Add support for i.MX7D messaging unit
References: <20180726065331.6186-1-o.rempel@pengutronix.de>
 <20180726065331.6186-7-o.rempel@pengutronix.de>
 <CABb+yY1Fbj2GiO_zjwnvNFutjX_fRpxnuEoeu6Z3s4NAv2ugbg@mail.gmail.com>
 <a988e8b4-28be-f598-82de-421017409368@pengutronix.de>
 <CABb+yY2=mFr+gFuWyE+VyG6dWj3gKhTs6X+U9UjFu5N=4zU5uA@mail.gmail.com>
In-Reply-To: <CABb+yY2=mFr+gFuWyE+VyG6dWj3gKhTs6X+U9UjFu5N=4zU5uA@mail.gmail.com>

--LtgkWXEkcUDgB04YeQjvQ1Zd9ZqdHb3jq
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 26.07.2018 13:09, Jassi Brar wrote:
> On Thu, Jul 26, 2018 at 4:21 PM, Oleksij Rempel <o.rempel@pengutronix.d=
e> wrote:
>=20
>>>
>>>> +struct imx_mu_con_priv {
>>>> +       int                     irq;
>>>> +       unsigned int            idx;
>>>> +       char                    *irq_desc;
>>>>
>>> Having      char  irq_desc[16];    seems simpler than free/kfree upon=

>>> each startup/shutdown. Simply use snprintf() in probe().
>>
>> Currently all known configurations use one or two channels. I don't se=
e
>> any sense to allocate all at the probe.
>>
> Just because only 2 out of 4 channels are being used, it doesn't make s=
ense?
>=20
> What is the concern?  "wasting" 16x2 bytes of memory?  How many bytes,
> LOC and execution time does kasprintf() waste?

Startup or shutdown is not speed critical path in this driver, or do i
miss some thing? Speed vs size is not valid argumentation here.


--LtgkWXEkcUDgB04YeQjvQ1Zd9ZqdHb3jq--

--oFXFHtH6ZXj9lCmUePKXnIJdUdPR4oSio
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEpENFL0P3hvQ7p0DDdQOiSHVI77QFAltZs6MACgkQdQOiSHVI
77Rtfgf/fSqT7JxQB3Hck/vywVzUZPWRlhcxKecZ7WVcMXEX26Xn2t67WBvHPt9c
/ZpP6MQ9avjHeAk5s6AKa618/vSc3xj3L03bUVK+xvBECKrE7wh4F/93d88fT4iH
wZpBrDapj7lyO5JLSH14Q6SDAaSaXvaRRs9JgrgzKFxD+kyPeFNWdzGl5n2d5JQm
Nuo6S4o21RQKt9gkC6OlzHTqvDlB+/3pFFysfnku1tUwYPfQwKxOmrMC6FzJlohA
oNpgWpuGNa+QklQV1emnRhC2oiwgnKLbJPYIyqns0KBBIjcNyjBC/pdTEtD2NSZI
kviiyyPy9WCqndnyGUUn976hXrP9GQ==
=GO8o
-----END PGP SIGNATURE-----

--oFXFHtH6ZXj9lCmUePKXnIJdUdPR4oSio--


--===============6005279572962109607==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6005279572962109607==--
