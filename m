From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v8 00/23] usb gadget update for OTG 2.0
Date: Wed, 29 Jul 2015 10:04:27 -0500
Message-ID: <20150729150427.GA32418@saruman.tx.rr.com>
References: <1437622667-6735-1-git-send-email-jun.li@freescale.com>
 <20150727072157.GA20654@shlinux2>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J/dobhs11T7y2rNN"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150727072157.GA20654@shlinux2>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, balbi-l0cyMroinI0@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh+d-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rogerq-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2015 at 03:21:59PM +0800, Peter Chen wrote:
> On Thu, Jul 23, 2015 at 11:37:24AM +0800, Li Jun wrote:
> > Change for v8:
> > - Add Peter's ACk for chipidea driver; and Roger's Reviewed-by for patch
> >   07, 21~23.
> > - Add ci->is_otg condition before enable ci->gadget.is_otg for chipidea
> >   driver in patch 8.
> >=20
>=20
> Hi Felipe,
>=20
> For chipidea patches in this series, help to queue them in your tree=20
> please, thanks.

all there, please make sure they're correct. There were so many versions
of this series that I might have picked up the wrong one :-p

cheers

--=20
balbi

--J/dobhs11T7y2rNN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVuOt7AAoJEIaOsuA1yqRE62QQAJE+Rb+2sH+nUkZnMCG2xJ1Y
P5GfOTqcb2fwNrujhFIP6q17GNKu5HtTdmtdTjViEKztnN755nvLjrVktfTyQ8jl
KIkw2X8AllrAiwTrsaxNuqIEmfG0gqup/gqL2AtqTfm1URtC6RpS7+9XicVDV62l
AOsRSjbLkF+Jv0FHuYSytp/lU5vLtd8W+aER/h7xRTCnGq8yuLwgnYr7axHxw1lx
IgRp3zcR5kwZdCmEtRPPzh6iMD2CEA6iydSgqGahkyuPjAeGkIiklsjgirpSBhRX
Ou5d25TEohtqXOpWFukGKSiarIDwtofungonKnQGL+CQr83FEdtdxrkUZ/xznzcF
E2KppX5OtVqkxV+8KKPeht0NuKMrRWc30PrOYueszk2MhnbhlPQQu8tWVCveQnSR
tWQcsgT8gDa/c5w+fpL74OIPazKfwSEiqcwYn+fSOWe5wZpu4VE5TFp3s813hIRs
sx8tOPnJg0AN1OXvSl536SfarWqG5ss4AegJBaQqcmq11BPa0cq9u3MUjmipwHNB
/pp77VAwOSK99h1OeAgVO0Dm77Y4zz2vtMta86j/JNSSRxHNse70DDHb6YiZLhCM
OeBlF9wrNSx3HVqqRpX/EqstHzDMH0UNlrM9f4L2mADVxgOA4uMzHJOV0Q4t+83V
/F6mlditw11yCR5VHUP9
=+oAz
-----END PGP SIGNATURE-----

--J/dobhs11T7y2rNN--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
