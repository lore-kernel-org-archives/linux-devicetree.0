From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v7 6/6] mailbox: Add support for i.MX7D messaging unit
Date: Thu, 26 Jul 2018 12:51:40 +0200
Message-ID: <a988e8b4-28be-f598-82de-421017409368@pengutronix.de>
References: <20180726065331.6186-1-o.rempel@pengutronix.de>
 <20180726065331.6186-7-o.rempel@pengutronix.de>
 <CABb+yY1Fbj2GiO_zjwnvNFutjX_fRpxnuEoeu6Z3s4NAv2ugbg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8636632566864556502=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CABb+yY1Fbj2GiO_zjwnvNFutjX_fRpxnuEoeu6Z3s4NAv2ugbg@mail.gmail.com>
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
 Sascha Hauer" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, linux-mediatek@lists.infradead.org, Shawn Guo <shawnguo@kernel.org>, srv_heupstream <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============8636632566864556502==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="nL5YWVr3GLDlSQDY1BkDVeW4R1E6Ycc48"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--nL5YWVr3GLDlSQDY1BkDVeW4R1E6Ycc48
Content-Type: multipart/mixed; boundary="BCN74KpNeBohgqROeaPdkFBnYLUOzlgiy";
 protected-headers="v1"
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "A.s. Dong" <aisheng.dong@nxp.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, ", linux-arm-kernel"@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 srv_heupstream <linux-arm-kernel@lists.infradead.org>,
 ", Sascha Hauer" <kernel@pengutronix.de>,
 Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
 dl-linux-imx <linux-imx@nxp.com>
Message-ID: <a988e8b4-28be-f598-82de-421017409368@pengutronix.de>
Subject: Re: [PATCH v7 6/6] mailbox: Add support for i.MX7D messaging unit
References: <20180726065331.6186-1-o.rempel@pengutronix.de>
 <20180726065331.6186-7-o.rempel@pengutronix.de>
 <CABb+yY1Fbj2GiO_zjwnvNFutjX_fRpxnuEoeu6Z3s4NAv2ugbg@mail.gmail.com>
In-Reply-To: <CABb+yY1Fbj2GiO_zjwnvNFutjX_fRpxnuEoeu6Z3s4NAv2ugbg@mail.gmail.com>

--BCN74KpNeBohgqROeaPdkFBnYLUOzlgiy
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 26.07.2018 12:15, Jassi Brar wrote:
> On Thu, Jul 26, 2018 at 12:23 PM, Oleksij Rempel
> <o.rempel@pengutronix.de> wrote:
>=20
> .....
>=20
>> +
>> +/* Control Register */
>> +#define IMX_MU_xCR             0x24
>> +/* Transmit Interrupt Enable */
>> +#define IMX_MU_xCR_TIEn(x)     BIT(20 + (3 - (x)))
>> +/* Receive Interrupt Enable */
>> +#define IMX_MU_xCR_RIEn(x)     BIT(24 + (3 - (x)))
>> +
>> +#define IMX_MU_CHANS   4u
>> +
> The 'u' unnecessarily refreshes my knowledge of C  :)

ok

>=20
>> +struct imx_mu_con_priv {
>> +       int                     irq;
>> +       unsigned int            idx;
>> +       char                    *irq_desc;
>>
> Having      char  irq_desc[16];    seems simpler than free/kfree upon
> each startup/shutdown. Simply use snprintf() in probe().

Currently all known configurations use one or two channels. I don't see
any sense to allocate all at the probe.


--BCN74KpNeBohgqROeaPdkFBnYLUOzlgiy--

--nL5YWVr3GLDlSQDY1BkDVeW4R1E6Ycc48
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEpENFL0P3hvQ7p0DDdQOiSHVI77QFAltZp70ACgkQdQOiSHVI
77R9hQf+PHzjVj6uw8lP/pgBEyqp2oLMRnnw9uAUvoKZqwcNwVYZwiUmvx0HyFu1
PwW08SUREmBGM3aNFMzcenKGZPI0+O3Vj95Voq5649HwMBt8rVXK7vTi+JJgTJT2
E94MeEXpTPUN6duZwB8Yzn+LOCiKEPwam9oPJf+6gPsEWq/Yseka0ILwQlWavgAB
nSJnjqIiEaUmGgIOktkhD4eJFeFsAskyHZHZa769yDlvMCPqjTLoIL1erNpdpiDa
Dt4nTazctoGkXlgofOk9SIlAaSXA3NnCYjMI+W6y5E2yigCT8HAX6XZFpBddxOcO
Q2C3xgMGHpgPP4sL3yzX5TprRwvMMA==
=kqUp
-----END PGP SIGNATURE-----

--nL5YWVr3GLDlSQDY1BkDVeW4R1E6Ycc48--


--===============8636632566864556502==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8636632566864556502==--
