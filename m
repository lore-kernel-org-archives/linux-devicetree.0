From: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH] at91/dt: ariettag25: style cleanup
Date: Mon, 12 Aug 2019 23:32:13 +0200
Message-ID: <68c67b7f-e5bb-ab9a-0d25-813d36481882@kleine-koenig.org>
References: <20190731220045.3992-1-uwe@kleine-koenig.org>
 <20190801082622.hma5ejifj6i2a2jv@M43218.corp.atmel.com>
 <4f58b080-dd20-19eb-c3b6-76746009ecc8@microchip.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3792852315652670477=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4f58b080-dd20-19eb-c3b6-76746009ecc8@microchip.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============3792852315652670477==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="8Suj52t2QIqboVYWIdDfiLoReoiZHi7cP"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--8Suj52t2QIqboVYWIdDfiLoReoiZHi7cP
Content-Type: multipart/mixed; boundary="8mqLyC6UxAvVXw6AXFOoTE0aFW31TuErO";
 protected-headers="v1"
From: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>
To: Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-ID: <68c67b7f-e5bb-ab9a-0d25-813d36481882@kleine-koenig.org>
Subject: Re: [PATCH] at91/dt: ariettag25: style cleanup
References: <20190731220045.3992-1-uwe@kleine-koenig.org>
 <20190801082622.hma5ejifj6i2a2jv@M43218.corp.atmel.com>
 <4f58b080-dd20-19eb-c3b6-76746009ecc8@microchip.com>
In-Reply-To: <4f58b080-dd20-19eb-c3b6-76746009ecc8@microchip.com>

--8mqLyC6UxAvVXw6AXFOoTE0aFW31TuErO
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hello,

On 8/12/19 5:47 PM, Nicolas.Ferre@microchip.com wrote:

>> I would like to be sure that Nicolas and Alexandre are on the same
>> wavelength than me.
>=20
> After I had been reluctant to use them (another syntax to learn in=20
> addition to learning DT, remember, back in the days...), I'm now okay t=
o=20
> use labels as they are so convenient and widely used.
>=20
> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

I expanded the series a bit now with Alexandre's proposal to add a label
to the internal rtc and also fixed a few more dts files. The arietta dts
is slightly modified, so I didn't add the collected Acks there.

Best regards
Uwe


--8mqLyC6UxAvVXw6AXFOoTE0aFW31TuErO--

--8Suj52t2QIqboVYWIdDfiLoReoiZHi7cP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl1R2uEACgkQwfwUeK3K
7AmxnQf9ECgORZBMx233ieuk4QFosviaR6WRCV0VZEz+G4sbqBgmXDWJQpvQ0dEC
aOykW1WnIH7Aye8qS56kQLj7R0ehIDkl10ql5vO5spl933DdjfVmG7TEresZuzI+
pRCBUI4IKtv264KtE2BFSWXbGEda1004ioghhEfTl1R8THtdXxkGvHSZ/vkGg5gv
20zZWOiURy9jhGJQymjSs/veBurya1OTM4mf5aDasnck/fNgRxBrOxVQd92ZPoZe
UClD/mg5lZDqBrRYmxdOGXKMUG5rIxQJYB+vgwxykdshNoLHXtzs2Z6y7HOs/IOr
66pGQLHQ3dgpkowpJjsA6zxqZyt1+g==
=WdYM
-----END PGP SIGNATURE-----

--8Suj52t2QIqboVYWIdDfiLoReoiZHi7cP--


--===============3792852315652670477==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3792852315652670477==--
