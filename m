From: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Subject: Re: [PATCH RFC V3 2/3] mxs: add driver for ocotp in i.MX23 and i.MX28
Date: Tue, 28 Oct 2014 14:17:39 -0300
Message-ID: <544FCFB3.10100@vanguardiasur.com.ar>
References: <1413628372-2809-1-git-send-email-stefan.wahren@i2se.com> <1413628372-2809-3-git-send-email-stefan.wahren@i2se.com> <3434817.dk7dLDFrcN@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="7GL98nxVT9EPhllPUc7DaWsFecI6wCQO2"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3434817.dk7dLDFrcN@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mhei-Z/Lg1yOAjpkb1SvskN2V4Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7GL98nxVT9EPhllPUc7DaWsFecI6wCQO2
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 10/20/2014 11:44 AM, Arnd Bergmann wrote:
> On Saturday 18 October 2014 10:32:51 Stefan Wahren wrote:
>> This patch brings readonly support for the On Chip OTP cells in the i.=
MX23
>> and i.MX28 processor. The driver uses files (one for each cell) in sys=
fs
>> as interface.
>>
>> Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
>> ---
>>  drivers/misc/Kconfig     |   13 ++
>>  drivers/misc/Makefile    |    1 +
>>  drivers/misc/fsl_ocotp.c |  332 +++++++++++++++++++++++++++++++++++++=
+++++++++
>>  3 files changed, 346 insertions(+)
>>  create mode 100644 drivers/misc/fsl_ocotp.c
>>
>> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
>> index b841180..7455efa 100644
>> --- a/drivers/misc/Kconfig
>> +++ b/drivers/misc/Kconfig
>> @@ -515,6 +515,19 @@ config VEXPRESS_SYSCFG
>>           bus. System Configuration interface is one of the possible m=
eans
>>           of generating transactions on this bus.
>> =20
>> +config FSL_OCOTP
>> +        tristate "Freescale MXS On-Chip OTP Memory Support"
>> +        depends on ARCH_MXS && SYSFS
>> +        help
>> +          If you say Y here, you will get support for a readonly
>> +         SysFS interface for the One Time Programmable memory pages t=
hat
>> +         are stored on the Freescale i.MX23/i.MX28 processor.
>> +
>> +          To compile this driver as a module, choose M here: the modu=
le
>> +          will be called fsl_ocotp.
>> +
>> +          If unsure, it is safe to say N.
>>
>=20
> I think this needs to be an MTD driver, not a "misc" driver, and it
> should use the proper MTD interfaces instead of introducing an
> incompatible set of interfaces.
>=20

Are you sure MTD is the right place? Recently an eFuse driver was merged
in drivers/soc/tegra/fuse:

http://lxr.free-electrons.com/source/drivers/soc/tegra/fuse/fuse-tegra.c

Isn't this a similar device?
--=20
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar


--7GL98nxVT9EPhllPUc7DaWsFecI6wCQO2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUT8+zAAoJEIOKbhOEIHKi1a4P/RReC01cKhc/VC3iflSo/YRS
Yo9z6loI4nm00mlLZc7OhUTJ26osoxnDlPfhPKdzz/nJqSlXcdu6lpXHCDHg4vKr
PW0VnS1c+QJi7XJjOv5/B2GmL3CvrnYUqVkDIAfB6Nuckw0gS/14//m3nQ/6kwqZ
U+7F6KyCk+//qws5It2somjdJunC1LiQRx2dFC8uWoJOj9PGf0sjbv62pIhgyvRE
bIMH/D4sQRmMdsKjAxBq7TlLXoEdfLVQ9W3s8dWOf72gZQjONjdPTThoQXzJew21
yQPHSiPlgAldTAKm8sYcRlxhIY2B9syc1wynhIRzq4HoFQyIJQsYFyYM1zrPkBQI
2CrU4oQrPhMhMynoavx8kJpuLfGJP++XPa3PnR4pBl3HI4l00GApB0Bnpt4vY6hL
bhegSTGLSt50q9vD8Wzt5v5LWSQqlYb9h9FEUmku3lIGf80iD4qdi+EsW7cvjHH5
vGIAclbj+DkmmY0vvmprnvC78ojQ9RylH4fjGrj/NE/MDWwBEpWymZul2kurWA3G
ndVYl1KXDg9/yjCoOlTiddi7uhfFlP7/wlVaWCtUezgUTPIBb2DTCf3q70AyB5Q1
JFobYMdWVPbN77mFOiryGhDeCxykgzMdwo8Q1ri3MkluEEC58FxinyEWtFp42Ad/
yz2YeF58IShUy/D8MfD+
=RvIS
-----END PGP SIGNATURE-----

--7GL98nxVT9EPhllPUc7DaWsFecI6wCQO2--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
