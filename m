From: Artem Bityutskiy <dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] mtd: cfi_cmdset_0002: Support Persistent Protection
 Bits (PPB) locking
Date: Tue, 15 Jan 2013 11:10:38 +0200
Message-ID: <1358241038.2731.118.camel@sauron.fi.intel.com>
References: <1355387350-14002-1-git-send-email-sr@denx.de>
Reply-To: dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0113959536261058474=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1355387350-14002-1-git-send-email-sr-ynQEQJNshbs@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============0113959536261058474==
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-mNi0DHFcf4pY/Tv7Aw2a"


--=-mNi0DHFcf4pY/Tv7Aw2a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-12-13 at 09:29 +0100, Stefan Roese wrote:
> Currently cfi_cmdset_0002.c does not support PPB locking of sectors. This
> patch adds support for this locking/unlocking mechanism. It is needed on
> some platforms, since newer U-Boot versions do support this PPB locking
> and protect for example their environment sector(s) this way.

Some "#ifdef CONFIG_OF"s are missing:

drivers/mtd/chips/cfi_cmdset_0002.c: In function =E2=80=98cfi_cmdset_0002=
=E2=80=99:
drivers/mtd/chips/cfi_cmdset_0002.c:579:4: error: implicit declaration of f=
unction =E2=80=98of_property_read_bool=E2=80=99 [-Werror=3Dimplicit-functio=
n-declaration]
drivers/mtd/chips/cfi_cmdset_0002.c: In function =E2=80=98do_read_secsi_one=
chip=E2=80=99:
drivers/mtd/chips/cfi_cmdset_0002.c:1146:16: warning: variable =E2=80=98tim=
eo=E2=80=99 set but not used [-Wunused-but-set-variable]
cc1: some warnings being treated as errors
make[4]: *** [drivers/mtd/chips/cfi_cmdset_0002.o] Error 1

Please, check allso the timeo warning.

--=20
Best Regards,
Artem Bityutskiy

--=-mNi0DHFcf4pY/Tv7Aw2a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQ9R0OAAoJECmIfjd9wqK0jKMP/jFRakePV9j5HnusY5dwMtb0
vQYBCADepDypi5M8zBA+mJdtGDfYSqicbdSUHYeUkyuXGSNCC+A4JnA7HObRLssq
/ZFcCZ3/8GI+gCuCH4NTEvXSo5GEFQExjH+hm8yq9ipkX1R4fLe5gxyOUSpCtSFA
bL8N4cV7BvsRff08CQWILQs/qEvq+nGmvXeAFZL0vda4hxy1wBAia9yXEwnj81tv
DtrQEpgtEGdFb2WXZBUgbdK/H8zWR2nmimhxDbd5qDw5GBXdYIKg+rXqmqEHZD19
UXrwgOSGGF3s1wXskfxe+/MUrf9/GZZxrbTnYfoCidu9ymKRNg0IsY8QmS/tdiqx
qLreI7u0OM9Z/NKqowym9Y+axmRXj7J0gbZ3AgqG3lQU7H4UD6CQCiuw4d8Qrsuf
8RM1stFGRXVXkOvton/w2g+9qmnPzHsLihqHW1GYOXEYu14U/YESpIaDiGu5GgBe
HtYLK1oHdkal8KbbEwvL6SHVEheRTsXOXLZeU+O7XDi2lUwFYMJTZYH5vOk3VyVw
UwjgQTBT36n1+83FKa+LklXT6EaGYsE0jp2cnR3YM2mnXgQWaBWtWsDm2kp0jS6M
mitUswduGNXdhn9Z5QcimSeiCxqkQ6Qiy+CUpSweOj5QFqOpnxvGptxOzgQXBedM
bIgT01M0uLuNCTTH3WMl
=8Jhc
-----END PGP SIGNATURE-----

--=-mNi0DHFcf4pY/Tv7Aw2a--


--===============0113959536261058474==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============0113959536261058474==--
