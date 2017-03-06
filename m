From: Alban <albeu-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH 2/3] mtd: Add support for reading MTD devices via the
 nvmem API
Date: Mon, 6 Mar 2017 18:21:47 +0100
Message-ID: <20170306182147.65d59d33@avionic-0020>
References: <1488484223-844-1-git-send-email-albeu@free.fr>
        <1488484223-844-3-git-send-email-albeu@free.fr>
        <20170302221803.223ff23b@bbrezillon>
        <20170303133629.3aac2945@tock>
        <20170303143658.5d89a329@bbrezillon>
        <20170303145726.16cd67fd@tock>
        <20170303151107.36754d19@bbrezillon>
        <54c76650-b61f-8a4c-70c7-febe76e16d3b@nod.at>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/l7dWwI+Jrsu9BvxOJC+_QSw"; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54c76650-b61f-8a4c-70c7-febe76e16d3b-/L3Ra7n9ekc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>
Cc: Alban <albeu-GANU6spQydw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--Sig_/l7dWwI+Jrsu9BvxOJC+_QSw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 3 Mar 2017 23:21:29 +0100
Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org> wrote:

> Am 03.03.2017 um 15:11 schrieb Boris Brezillon:
> >> And add a list of successfully added notifiers, along with their
> >> data pointer, to the MTD device. That's simple and would also remove
> >> the need for notifier to have a private list of their instances as I
> >> had to do here. =20
> >=20
> > And then you're abusing the notifier concept. As said earlier, a
> > notifier is not necessarily using the device, and thus, don't
> > necessarily need private data.
> > It's not only about what is the simplest solution for your use case,
> > but also what other users want/need. =20
>=20
> Yes, please don't use the mtd_notifier.
> I strongly vote to embed the nvmem pointer into struct mtd_info.

Ok, I'll do that. However it mean it will have to stays in
drivers/mtd as it then become part of the MTD core.

Alban

--Sig_/l7dWwI+Jrsu9BvxOJC+_QSw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYvZqrAAoJEHSUmkuduC28S5EP/0bO3Eskc4K+JgOmDjek7rGD
QXt3w4TPPm1KphK8MAdH2s0jofNVI7gM1gTme0zIrRTbdc2zx6QWk8BTMR4gWv3G
f0yDzsNM4kvdNGc1xPnlqy2d1KR2CfG6/+QPM2Tw0HHYJwJ7KloSmiTs8VKc7fpa
TJrLCX56tvzl3Usv5kNAzXg9mDPHEkRn8YRle6h327/JgiK+i+3aFyEODzYA1ECJ
Ia4fkcUZXDe1Td+fMDAau5wjlWi4lz991F+k29ra3LXJ2GGHTdBjxh9jAtgpZ9w3
WVq1LpeeJ050mSBWjLkhIWCGnNDhSa3cxGOWxVMzz0du3NtGF6Eoo1bIM+efhiKo
IMhmLySZZNPufjV7QDeVo1dfcZshJ7EMR/veu37qzoSPuqCFKXafGxk5CNTm4W8g
/4IgWeYmBVedv+VgG0YPjLKCqo/AMG1pl14Tc58lcdo/d2dfsQIOaKooLdK0SUWN
xHDsUCKFYwiqtLGhdPTiX7V9xc0JqavGcMdDQlfv+kRwnSHIknRAOixMqCJpRIB8
dopMIyV3DNdGztFx9UVdw7SMGpMlby0ObRoc8fA7dxP5Z7GFjTHA8bd5A9uRKlkz
CMiF8qRYHqUvi8w7383mHbsuH+HHK+dpJYzBCdvVu/l2idDd7iW8mEcQtSiIMO67
9PIDTjYXcZsuKpBVaY+e
=IEpt
-----END PGP SIGNATURE-----

--Sig_/l7dWwI+Jrsu9BvxOJC+_QSw--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
