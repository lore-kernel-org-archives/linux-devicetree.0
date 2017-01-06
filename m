From: =?UTF-8?Q?Micha=c5=82_Zegan?= <webczat_200@poczta.onet.pl>
Subject: Re: [PATCH] ARM64: dts: meson-gxbb-odroidc2: Disable SCPI DVFS
Date: Fri, 6 Jan 2017 14:12:21 +0100
Message-ID: <70c0537a-0e16-ed69-ab90-c8e69e44b5f3@poczta.onet.pl>
References: <1483628549-29486-1-git-send-email-narmstrong@baylibre.com>
 <9f508097-f605-ebd8-20af-c3e798c6fdcc@poczta.onet.pl>
 <83fd9b61-dbff-68e0-82e5-8e01058d04a9@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6627184736838535005=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <83fd9b61-dbff-68e0-82e5-8e01058d04a9@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sudeep Holla <sudeep.holla@arm.com>, Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com, carlo@caione.org
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============6627184736838535005==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="kavWlxc7Cr5KD9ofjXRDoKQ9mrDG9eUwt"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--kavWlxc7Cr5KD9ofjXRDoKQ9mrDG9eUwt
Content-Type: multipart/mixed; boundary="opcuF1OWQnLv2pVttVfe10OxoI4CMW2Rd";
 protected-headers="v1"
From: =?UTF-8?Q?Micha=c5=82_Zegan?= <webczat_200@poczta.onet.pl>
To: Sudeep Holla <sudeep.holla@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com,
 carlo@caione.org
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Message-ID: <70c0537a-0e16-ed69-ab90-c8e69e44b5f3@poczta.onet.pl>
Subject: Re: [PATCH] ARM64: dts: meson-gxbb-odroidc2: Disable SCPI DVFS
References: <1483628549-29486-1-git-send-email-narmstrong@baylibre.com>
 <9f508097-f605-ebd8-20af-c3e798c6fdcc@poczta.onet.pl>
 <83fd9b61-dbff-68e0-82e5-8e01058d04a9@arm.com>
In-Reply-To: <83fd9b61-dbff-68e0-82e5-8e01058d04a9@arm.com>

--opcuF1OWQnLv2pVttVfe10OxoI4CMW2Rd
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Yes, I meant what you think I meant. :) thanks

W dniu 06.01.2017 o 12:54, Sudeep Holla pisze:
> Hi Micha=C5=82,
>=20
> On 05/01/17 19:04, Micha=C5=82 Zegan wrote:
>> Hello.
>>
>> The patch causes cpufreq module (scpi-cpufreq) not to detect cpufreq, =
so
>> it actually works, but...
>> Loading the module causes few errors because of not found frequencies =
or
>> something, then it is all okay. However after loading scpi-cpufreq you=

>> cannot actually power the cpu off and on. You will power it off
>> successfully, but when trying to power it on, the cpufreq driver will
>> error out,=20
>=20
> Yes I had noticed this in past, this needs to be fixed. I had a patch
> and seems like it slipped through the cracks. I will fins and post it.
>=20
>> and then after it happens, the cpu that was trying to go
>> online will be offline again, and that is a little... unfortunate. The=

>=20
> IIUC, you mean the cpufreq drive spits error on every hotplug event ?
> If so yes, otherwise I think I didn't understand you concern above.
>=20
>> question is, and I cannot really test that: will the module actually
>> autoload after this change?
>>
>=20
> It should work, I had tested this in past.
>=20


--opcuF1OWQnLv2pVttVfe10OxoI4CMW2Rd--

--kavWlxc7Cr5KD9ofjXRDoKQ9mrDG9eUwt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFPBAEBCAA5FiEE8PeJXyv9t1Bfiq63mRxoPZnIFPkFAlhvl7YbHHdlYmN6YXRf
MjAwQHBvY3p0YS5vbmV0LnBsAAoJEJkcaD2ZyBT5yQEH/iEepF5XIJKMsGwOgUXd
2IZJORYLS7XdT07V9wKc64lOhsZnLd1CCKwJosSAd7+62EJPiySQ1mYBY/9tyJxO
8h2Qk+cXhcIMrSFi+V9iXjQctgVppokazVaucxbEE/h2ijYnhjCPavlOyMSYiq1C
Txc6ZIgTbJPaheE62Gs2ZF3RdHiOee1W+Kk3+UPARKrl569bFz9f+Y/VZ6x7hCW0
pARyAFkfFm2aqUaWEA2rtGWh9vfDBEtnCJYX4/CvlE+ihP7EyKdI0Kxl1B0GTydg
u+iHJecxtmK/+dYEFW7ar4PeVcD9FeB7Q6p9n+Syt1U+BlnaFXcVKzK4/3C9QtKh
U7s=
=DzTJ
-----END PGP SIGNATURE-----

--kavWlxc7Cr5KD9ofjXRDoKQ9mrDG9eUwt--


--===============6627184736838535005==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6627184736838535005==--
