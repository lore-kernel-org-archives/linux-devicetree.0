Return-Path: <balbi@kernel.org>
From: Felipe Balbi <balbi@kernel.org>
Subject: Re: [Patch V6 7/8] usb: gadget: Add UDC driver for tegra XUSB device mode controller
In-Reply-To: <1565613783.23705.49.camel@mhfsdcap03>
References: <1565257046-9890-1-git-send-email-nkristam@nvidia.com> <1565257046-9890-8-git-send-email-nkristam@nvidia.com> <1565613783.23705.49.camel@mhfsdcap03>
Date: Mon, 12 Aug 2019 15:49:09 +0300
Message-ID: <871rxqtupm.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Nagarjuna Kristam <nkristam@nvidia.com>
Cc: gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Chunfeng Yun <chunfeng.yun@mediatek.com> writes:
>> +/* XUSB_DEV registers */
>> +#define SPARAM 0x000
>> +#define  SPARAM_ERSTMAX_SHIFT 16
>> +#define  SPARAM_ERSTMAX_MASK GENMASK(4, 0)
>> +#define DB 0x004
>> +#define  DB_TARGET_SHIFT 8
>> +#define  DB_TARGET_MASK GENMASK(7, 0)
>> +#define  DB_STREAMID_SHIFT 16
>> +#define  DB_STREAMID_MASK GENMASK(15, 0)
> To me, define it as :
> #define  DB_STREAMID_MASK GENMASK(31, 16),
> it's more clearer.
> and define another macro
> #define  DB_STREAMID(x) (((x) & 0xffff) << 16)

perhaps?

#define DB_STREAMID(x)	(((x) << 16) & DB_STREAMID_MASK)

Otherwise you end up defining the mask twice.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl1RYEUACgkQzL64meEa
mQZDmQ//dZ9bQYkDcWEiarlDFrRXkwjkzuRRuoygOMHDkMMUHafgu1X+97pBU4KE
WP/6krQOQamECru8SclQczz7QwEgGVTloSTkXqZD64lAKdX6P7SfShVEByVxYShr
4Un/VK5cinZSLoWDKLr5eCHaKMcA7XAoU84ymeofMRVATVZt3r4eeIvdGbKXunnU
pNqxdIKt4OsGv+3yjzjywPTUmyav/DoMJbPbfmbp8ORTmI/+LjESi1coII19Wd6E
loBCLuA6XI/ZPSy1drGys2SZQMvq/IatXWkS9rB3+FxMWnT7xoCvundorB21pzWL
Bhm4L4GCHIzuIu5QFSGyUUuNZu+WRC/zQIWNtam7ItOqorKtNrFXTDBPJHve33Z8
p4ha5fIPIGswNCOY9WSYdmV/68ZAVsO68NHxHSpHWm9NVZ6jF/YqchZv4ZZ2R8uU
wViPHiUxlEZDdI5n/Rvl5wYLZsdMntOQWwcLDBY7KfnNiqOn8k7/Dlfp/ASntJ7G
YTlFKo+WHmCWEht2cyFyxOaupi3e2zzyU3VGZ+t9mXyOkrtoMhlw6OgAM32uAqUr
X+o3jgTYp32buQAeDGSr9tNB+f41V2z2KlcB/LkWnkNpS9dtMVVVKxSgNruh6hEB
il76emBzN+QqVqGEOdFYp0X5NVd5LZfl39atMFFJ21ztCpOZzRE=
=6UzC
-----END PGP SIGNATURE-----
--=-=-=--
