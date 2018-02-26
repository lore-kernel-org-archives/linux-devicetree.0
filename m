From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: bcm283x: Move arm-pmu out of soc node
Date: Mon, 26 Feb 2018 15:32:12 -0800
Message-ID: <87lgffjpj7.fsf@anholt.net>
References: <1519481722-22738-1-git-send-email-stefan.wahren@i2se.com>
 <1519481722-22738-3-git-send-email-stefan.wahren@i2se.com>
 <87fu5nppxo.fsf@anholt.net> <216513579.120636.1519672190175@email.1und1.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1042746237493856134=="
Return-path: <linux-rpi-kernel-bounces+glkr-linux-rpi-kernel=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <216513579.120636.1519672190175-7tX72C7vayboQLBSYMtkGA@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rpi-kernel>,
 <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rpi-kernel/>
List-Post: <mailto:linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rpi-kernel>,
 <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "linux-rpi-kernel" <linux-rpi-kernel-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rpi-kernel-bounces+glkr-linux-rpi-kernel=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============1042746237493856134==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> writes:

>> Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org> hat am 26. Februar 2018 um 19:26 geschrieb=
en:
>>=20
>>=20
>> Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> writes:
>>=20
>> > The ARM PMU doesn't have a reg address, so fix the following DTC warni=
ng
>> > (requires W=3D1):
>> > Node /soc/arm-pmu missing or empty reg/ranges property
>> >
>> > Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
>>=20
>> These seem good to me, I justed wanted to be sure: Does the PMU still
>> probe when the node is at this level of the hierarchy?
>
> Yes, it does.=20

Great.  It sounds like Florian will cherry-pick these directly for
fixes.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlqUmPwACgkQtdYpNtH8
nuiuoxAAheZRTkRY9kjgKJymIQ5mKTD6q+PNDASTMLZhS/Z5A8xphIMyAambmr8t
hG3V6TdgaIqcAQPoejhr56Byk18WoOXP+Pf2I9nbW+A218cgx4tpB1GnhazDNUgM
HqPwhNmR7baVFVJAQ45bk0i+xIRjfLhM9S7iYNzo6CdJoUFbGuUQsWVmNCx0S7l6
w0Hlw+6ruourkSFTMMjAJvn7FgqjJGfB6dQyQiS/d1+FOqP2qawXwsRTC2NPrGrr
1BMo0NH3bIVWjuoMmXJmaNHJENA88RcN4AkWNDk6d6k4dDADVXfgoRhGVLMbjwxe
K8Gb0lSoHlzl1+LOSj9AMTpexTD8hzRFmEy7RhBeswIq1IrwZla/I5LOdcZNTtUn
kAuRWsud6GRwxamR+j8LMARAXSSqQx43Q6Xh+QMyuzcErJjJy0OQFwiAghJN/gFk
1E05IoMwOLfl0ZnpJPvvMmyqaMO31FfWEHdeIG2nZxj9k6Gv7s6fEnuF8hWdcgYy
Vv4O8XEmCGiLiy7TQG111YVw+R7UHf5rcFQv2sM8om0xdfLkiry/cw83dK83YeIR
CHvA44FKILu4nCCdREGlHeDr5Kubgh8EMas+7DzCPx4sv22s+M6JABHZuBsM75uN
pu8LuruorIbvzNeZyreotZz1FYaO/dCUqXHNE1A8vdj41ZYUDto=
=94uJ
-----END PGP SIGNATURE-----
--=-=-=--


--===============1042746237493856134==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-rpi-kernel mailing list
linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
http://lists.infradead.org/mailman/listinfo/linux-rpi-kernel

--===============1042746237493856134==--
