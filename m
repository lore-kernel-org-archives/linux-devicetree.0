From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 05/10] dmaengine: sun6i: Move number of
 pchans/vchans/request to device struct
Date: Mon, 18 Sep 2017 10:12:07 +0200
Message-ID: <20170918081207.5hagvmrc37cnqgvx@flea.lan>
References: <20170917031956.28010-1-stefan.bruens@rwth-aachen.de>
 <20170917031956.28010-6-stefan.bruens@rwth-aachen.de>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5u7sndkkugms62ap"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBWH77XGQKGQE5YPH4QY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170917031956.28010-6-stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Stefan =?iso-8859-1?Q?Br=FCns?= <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--5u7sndkkugms62ap
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

1;4803;0c
On Sun, Sep 17, 2017 at 05:19:51AM +0200, Stefan Br=C3=BCns wrote:
> Preparatory patch: If the same compatible is used for different SoCs whic=
h
> have a common register layout, but different number of channels, the
> channel count can no longer be stored in the config. Store it in the
> device structure instead.
>=20
> Signed-off-by: Stefan Br=C3=BCns <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>

Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

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

--5u7sndkkugms62ap
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZv3/XAAoJEBx+YmzsjxAgdXUP/ipGC/Oxyxq/wFQXiiPL+ad/
XfMNrv8AfsLY6Jxc/gzFp9s/Ei4h7m0Ihp4AyRQfb8vN8tuCiQ/k88Rlg9Cekjae
/BxKuCknJzwu9txKqM6BUMzwA02dgyxN7uJrkHIN1tNAjSMesnjLZo5i+3eIa/Sg
L1Zf6m4mUkaBU323olW3UOKV+9V9HXEia7RVallyME0G10qnUdtPJpR6IJcMYGMA
aheNvHFJ2k7feYfhJ3c9oHh3CLzE+v9Jv1mPpaq0Nrz3/VHjExPhh88u3ItKWOT3
DireTscS4EpW4B8UMRNf3JnwYjKxn4MzgpuR4e66Q4i8UU9lLONRieuEoU/XA+Uc
m0RrdJKhwSQoqW2/XF/vcJlHB/unEed4Jzvdb2j1wefbLjUJhp7LpK4fL2462yY3
5oQ8cc3/3TRP/JI4quzO0g0o4z7s9X8YQSFPJAoji0hksyET5qW+Ryw2liwBU+5d
QgjIwFZEwX7GO/Dz0MBLFF78RgWhqRNVRgSNaeY2T8MFHjVj/Gi38j0FeZKBx9VU
aJ0JHZEUbpN+UIbVeNYT6Vp/JMnFN1RSZHEvEZsFVslDRI19WQOwsqqbkKuEgbo8
phn7oB45CyBCUEbnhpqL6an3jpTDCGqQynRMdEZsEpGorBGcVhmuhYcKHXoqTUgG
a1PkHCfMUHQNk0vP7d+a
=Yocw
-----END PGP SIGNATURE-----

--5u7sndkkugms62ap--
