From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 2/3] nvmem: sunxi-sid: add support for
 H3's SID controller
Date: Fri, 10 Feb 2017 09:05:14 +0100
Message-ID: <20170210080514.nrryisw4y2wbs5wk@lukather>
References: <20170202131338.20234-1-icenowy@aosc.xyz>
 <20170202131338.20234-2-icenowy@aosc.xyz>
 <20170206085416.4qtd3wfhtinp42xv@lukather>
 <5119511486371415@web15m.yandex.ru>
 <20170207092503.3nh2g6orkgjgdi7q@lukather>
 <4664661486474595@web28j.yandex.ru>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="koof273j3fysqo5k"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBO7I6XCAKGQEBAKD7CI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <4664661486474595-O40pVLQIipZxpj1cXAZ9Bg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--koof273j3fysqo5k
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 07, 2017 at 09:36:35PM +0800, Icenowy Zheng wrote:
> >> =C2=A0>> =C2=A0@@ -51,7 +64,8 @@ static u8 sunxi_sid_read_byte(const s=
truct sunxi_sid *sid,
> >> =C2=A0>> =C2=A0=C2=A0{
> >> =C2=A0>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u=
32 sid_key;
> >> =C2=A0>>
> >> =C2=A0>> =C2=A0- sid_key =3D ioread32be(sid->base + round_down(offset,=
 4));
> >> =C2=A0>> =C2=A0+ sid_key =3D ioread32be(sid->base + sid->value_offset =
+
> >> =C2=A0>> =C2=A0+ round_down(offset, 4));
> >> =C2=A0>
> >> =C2=A0> This would probably be more logical to have this in sunxi_sid_=
read.
> >>
> >> =C2=A0But it's here which really access the memory...
> >
> > This function is made to read a single register. What you want is to
> > offset all reads, and all the reads are made in sunxi_sid_read.
>=20
> I think the semantic of this function is to read out one byte from SID,
> not read out a single register from SID; the parameter passed into it is
> also a const struct *sunxi_sid, so I think make the offset here is right.

You need to offset *all* register reads, it makes much more sense to
do that offset in the function that reads all the registers, and not
just one.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--koof273j3fysqo5k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYnXQ2AAoJEBx+YmzsjxAgXRoQAKXMvPApFIv3/IQr7LQkR5JK
mlAQU2HQ/AwYJHq0QWDNlQkvhqNNPk8bqs4JPySbIcuCD4TS6zOiRxMevvtiTdE+
5fOed63RJZ3fT6sSRAOMXMAIEqgS7u8aglI1BzvHhHQ35rbClmf9VTG/UmowlsoZ
87hy7awSgng7Jna7dj5UK7TjJ28RdIEO2bi/SyuSU6nVpaSft/9dPBj0nJ/mTXwi
8wmuapCmMo3OvpVo0OVYbNpd1cia1hFh1HmMsMCmJzLG34Swbym6gxdD1FPnEbyo
Z+U+flevyt+apsd3+RGE0cjAR3F3CRrfhaTg2SHEQnRwvwJ1XbOmzM2+49LFbidt
avd4Q+fkvFHIgeACSlkPKt3Ysticnb+c8jtWlyEBuvgRGcje+tO5gzVZeNdrvrWP
dmSKJFek6VSIvJmmrH0vw4FC8qdeaTJSsVIDMqdvzuai8vBN20hWYzoeYy2RbIia
cmeuJVMMB0tsHFrgNi8VY3OACmQleNGH86ypS9fTJqr7GxjMV+b0Eez5WKjvKPiz
iBWZbFCkf5UtPbzVt+anNUxMcwhjhPDjDqeLDEiwIlzdvf2rAf8LqNL+IOnIaHys
N5XaH8d7IWmgzfXeW4jXceVi6qi9hqvaywwKliAA86YiawIL0cxjRCzTbgdMuSX4
3qJ+xeEIu3o6c1d2uPIJ
=+d1G
-----END PGP SIGNATURE-----

--koof273j3fysqo5k--
