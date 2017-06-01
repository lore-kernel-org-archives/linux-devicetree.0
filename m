From: Oleksij Rempel <linux@rempel-privat.de>
Subject: Re: [PATCH v2 1/6] ARM: imx6q: provide documentation for new
 fsl,pmic_stby_poweroff property
Date: Thu, 1 Jun 2017 08:50:35 +0200
Message-ID: <b9ba2cce-5383-636e-8e2c-4d85b2a92cb6@rempel-privat.de>
References: <20170531061457.23744-1-o.rempel@pengutronix.de>
 <20170531061457.23744-2-o.rempel@pengutronix.de>
 <20170531145255.GC10351@leverpostej>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6839236265480607228=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170531145255.GC10351@leverpostej>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Rutland <mark.rutland@arm.com>, Oleksij Rempel <o.rempel@pengutronix.de>
Cc: devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, kernel@pengutronix.de, Andrew Morton <akpm@linux-foundation.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============6839236265480607228==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="mqhHG7A28Bi5ojtFwwc5pNTD1cqSe61KF"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--mqhHG7A28Bi5ojtFwwc5pNTD1cqSe61KF
Content-Type: multipart/mixed; boundary="C7RPagmBr0a7D5kUOEPQDw7kQbnk7rr2h";
 protected-headers="v1"
From: Oleksij Rempel <linux@rempel-privat.de>
To: Mark Rutland <mark.rutland@arm.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>
Cc: kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Message-ID: <b9ba2cce-5383-636e-8e2c-4d85b2a92cb6@rempel-privat.de>
Subject: Re: [PATCH v2 1/6] ARM: imx6q: provide documentation for new
 fsl,pmic_stby_poweroff property
References: <20170531061457.23744-1-o.rempel@pengutronix.de>
 <20170531061457.23744-2-o.rempel@pengutronix.de>
 <20170531145255.GC10351@leverpostej>
In-Reply-To: <20170531145255.GC10351@leverpostej>

--C7RPagmBr0a7D5kUOEPQDw7kQbnk7rr2h
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

Am 31.05.2017 um 16:52 schrieb Mark Rutland:
> On Wed, May 31, 2017 at 08:14:52AM +0200, Oleksij Rempel wrote:
>> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
>> Cc: kernel@pengutronix.de
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: Michael Turquette <mturquette@baylibre.com>
>> Cc: Stephen Boyd <sboyd@codeaurora.org>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: linux-clk@vger.kernel.org
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> ---
>>  Documentation/devicetree/bindings/clock/imx6q-clock.txt | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/imx6q-clock.txt b=
/Documentation/devicetree/bindings/clock/imx6q-clock.txt
>> index 9252912a5b0e..214cb5f461c7 100644
>> --- a/Documentation/devicetree/bindings/clock/imx6q-clock.txt
>> +++ b/Documentation/devicetree/bindings/clock/imx6q-clock.txt
>> @@ -6,6 +6,10 @@ Required properties:
>>  - interrupts: Should contain CCM interrupt
>>  - #clock-cells: Should be <1>
>> =20
>> +Optional properties:
>> +- fsl,pmic_stby_poweroff: Configure CCM to assert PMIC_STBY_REQ signa=
l
>> +  on power off.
>=20
> s/_/-/ in property names, please.

ok.

I have now some more questions:
what naming schema should be actually used?
fsl,pmic-stby-poweroff
or
fsl,pmic-stby-power-off

i found some existing case:
sound/rt5660.txt:- realtek,poweroff-in-suspend
so in my case it will be:
fsl,standby-in-poweroff
or
fsl,standby-in-power-off

can we have generic name for this use case?
should I use same binding for PMIC and the SoC or they should be more lik=
e:
for SoC "standby-in-power-off"
and for PMIC "power-off-in-standby"



> When/why is this needed?
>=20
> Why should a DT author (not) set this?
>=20
> Thanks,
> Mark.
>=20
>> +
>>  The clock consumer should specify the desired clock by having the clo=
ck
>>  ID in its "clocks" phandle cell.  See include/dt-bindings/clock/imx6q=
dl-clock.h
>>  for the full list of i.MX6 Quad and DualLite clock IDs.
>> --=20
>> 2.11.0
>>


--=20
Regards,
Oleksij


--C7RPagmBr0a7D5kUOEPQDw7kQbnk7rr2h--

--mqhHG7A28Bi5ojtFwwc5pNTD1cqSe61KF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EAREIAAYFAlkvuTsACgkQHwImuRkmbWnjTgD+OMPXuh3DWAZ3dFKYKRlyWpRj
6G3lHy7rYcwSxcSEun8A/il84kXam14WDsmzKbTyuS9wcg2x2PfrvK3QsbiC0n25
=VV6G
-----END PGP SIGNATURE-----

--mqhHG7A28Bi5ojtFwwc5pNTD1cqSe61KF--


--===============6839236265480607228==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6839236265480607228==--
