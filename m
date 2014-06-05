From: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Subject: Re: [GIT PULL] DeviceTree updates for 3.16
Date: Thu, 5 Jun 2014 14:17:18 +1000
Message-ID: <20140605141718.07073dd0@canb.auug.org.au>
References: <CAL_JsqKPJzzR-Thvnd7Fw5aTymxvQBp+bf8sdmGfL-xHM+iJ-Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/j4dcPF=I0IPySftXX50tRDH"; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKPJzzR-Thvnd7Fw5aTymxvQBp+bf8sdmGfL-xHM+iJ-Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--Sig_/j4dcPF=I0IPySftXX50tRDH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Wed, 4 Jun 2014 11:48:50 -0500 Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> The correct resolution is keeping the first "if (!of_kset)" and
> dropping the 2nd one as found is no longer present. I'm not sure why,
> but this error doesn't show up in linux-next.

That would be because I did that merge resolution ... I informed Grant
at the time (since it affected his tree).

See https://lkml.kernel.org/r/<20140526150557.219ea08f-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
--=20
Cheers,
Stephen Rothwell                    sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org

--Sig_/j4dcPF=I0IPySftXX50tRDH
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCAAGBQJTj+9VAAoJEMDTa8Ir7ZwVWeYP/Rl4Yp/VRb4KL5byucGbmScJ
L8JGk01TOG2QrgDtvKSGqqwRikAKTLGvVijlfJU6Sx00g3jpB7y+Va/IC65Iy7hy
qJU991jY+OANaWrxvKd/6vcItUMFe+Fxb2kl1B1c86+B3angdDpCYj0FHfJ3P04n
yMDtauwRh3fqmIbwcKub2kh/lhu/VerF6pjkiLS/JqAY3NLXcjpdg+8tm/kZVB3h
ZXHm0iNtc4BavnH4P5gmcNRnECAKxN0pd1EMYMAgQjC+9y3PUunle9br9dbWArnf
yzef4wj6XwaierdEMfxVpgkfmxN/2zd8TP8MxDPfI8U7Hft/Ly8KI85MpbVoyV70
bZLpsfLMEnD7HUpaMjP14z/G/DDb621tnjmITVFkKTe7vTATcsCokZ5OowUzVZsp
Hc5ivu15v6n6i6g8rKDYhXnnggnCjczMM/MrT9+oxRjNpcv0f3WQB70GakWdl+Zl
DLMzy6CSJw6mrVHDbaz4CFnOeGie9PffwwXD8oA2+R4L9DPl2abqZoromUWdu0u+
k4tZEYACf45t4KfWXPw/dm1iKiCJqU7O3aiUp/3gonJIPXKBxBkgganCzYQVvU/p
NWyafkXShlifkSxAzUWgByKGjbadPWDiUs36lWlKLNJ1S4VCHmnoEFK8naF2lD7V
AWlqwIZI/X3hvXZWKgAz
=Gq+/
-----END PGP SIGNATURE-----

--Sig_/j4dcPF=I0IPySftXX50tRDH--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
