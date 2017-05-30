From: Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 4/6] irqchip: irq-mvebu-icu: new driver for Marvell ICU
Date: Tue, 30 May 2017 14:04:03 +0200
Message-ID: <20170530120403.GB25456@kwain>
References: <1496135772-20694-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1496135772-20694-5-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gj572EiMnwbLXET9"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1496135772-20694-5-git-send-email-thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Hanna Hawa <hannah-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--gj572EiMnwbLXET9
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

Very small comment,

On Tue, May 30, 2017 at 11:16:09AM +0200, Thomas Petazzoni wrote:
> diff --git a/drivers/irqchip/irq-mvebu-icu.c b/drivers/irqchip/irq-mvebu-=
icu.c
[...]
> +#define ICU_INT_CFG(x)          (0x100 + 4 * x)

You should use (x) here, to be safe.

Thanks!
Antoine

--=20
Antoine T=E9nart, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--gj572EiMnwbLXET9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJZLV+yAAoJEFxNi8it27zYl9AP/jerMn6uny77T9hJGZl++uxP
wTvNo4E6CvhUyzscZiYwLMQo7vI/clRxbdRv1yDrnQvRaM9RAz326mnrrc2lU8N6
5E4VgQ2sudYswjztgDDH2t0WiujkvEwrs9K1AXxLr55O/i+3l90K7RjC+vQzQazT
iNgN63sAymJiXDAdgFev/WnT1gj6Qz5RFUIP40F4oYBSfrUc/cqgPgdBZqlIur+n
ON/IDtfN1PRGp98z6TnLqjlMWKg86Wb83t/SYXORGgI4htGsIz+NyknyGhtotf6u
37zaTdDWPnkr784e12MEOs8lBpnKy9KpOJMRVI3dPz1QPRX6IpLcbdh7JCF/Oq9B
+Bkovxv4U8EcfrnQqdeoMlMb1MBJBSktaDlGIA6B7wc8A7HcV4Fp53yFuEL8he9h
1m9e1HI1S3zIF0WE6nczhMo/vHOnB4QBzZulrFyTz5odXfarDTyKym+fJZ6vRp3h
n8lHwmnA9TQhOG0lURFmI6Du/HnjhO5yrxPENK5ADPSDQH6Xxzb1NUDgn72Kz2kA
INGi7SZYEgEy9mUPKyrdoBVxnP/z22+R1KzevbtxcrATR5/0JKwAGrt6DRPzimfS
AcMijxR5rpP4cw2+RmgvbWmEdpbG2qvcuUveemWcGlMIjmtFFuEG2i1yQegcYm8n
fMnLVVZnuHun3RmGyYXt
=sQoF
-----END PGP SIGNATURE-----

--gj572EiMnwbLXET9--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
