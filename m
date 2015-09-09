From: Alexander Couzens <lynxis-qyMx1GtpvWw@public.gmane.org>
Subject: Re: [PATCH 1/2] MIPS: ath79: set missing irq ack handler for
 ar7100-misc-intc irq chip
Date: Wed, 9 Sep 2015 11:04:06 +0200
Message-ID: <20150909110406.2e4a4f97@lazus.yip>
References: <1441251262-13335-1-git-send-email-lynxis@fe80.eu>
	<1441251262-13335-2-git-send-email-lynxis@fe80.eu>
	<20150903103245.21dc9dd7@avionic-0020>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/mTYCrXriuVUD985kG3i33J3"; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150903103245.21dc9dd7@avionic-0020>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alban <albeu-GANU6spQydw@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--Sig_/mTYCrXriuVUD985kG3i33J3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 3 Sep 2015 10:32:45 +0200
Alban <albeu-GANU6spQydw@public.gmane.org> wrote:

> > -IRQCHIP_DECLARE(ath79_misc_intc, "qca,ar7100-misc-intc",
> > -		ath79_misc_intc_of_init);
> > +
> > +static int __init ar7100_misc_intc_of_init(
> > +	struct device_node *node, struct device_node *parent)
> > +{
> > +	pr_info("IRQ: Setup ar7100 misc IRQ controller from
> > devicetree.\n");
>=20
> Debug left over?

I'll remove it in next patch. I added it because you mentioned a log
message in your last review.

> On Mon, 10 Aug 2015 20:11:14 +0200
> Alban <albeu-GANU6spQydw@public.gmane.org> wrote:
>> Mon, 10 Aug 2015 20:11:14 +0200
>> A log message would be nice. IMHO it should mention that the ACK
>> callbacks have been missed when introducing OF support.

--Sig_/mTYCrXriuVUD985kG3i33J3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJV7/YHAAoJEMKenaag34YEPbQQAJZIno5m8B629KfceUaaVgwA
I0q9PVcRBxr7mLW/DXdj/fsTLQ+A0XjuvdTqzxWTRo1SmhFlg/6oobw8w2+7QqJv
CJSFP2l7cd12RYEKWbn7SpkfRgSJZ06T2cgVQUnSvZfqD4796YjLVmxBub1xH6N+
L0Xz7X8OjnHpEbrtXmxOPA34qZyGbgx3lf1IbVRWrgyuEJTLP7NqQZdYwS4cH9gf
l7eqTmfj+TpTZTn6iB5at1+a6zw1r6ay/vDGwBDScZoZcFnk9qSqf5x2YOiceBPj
BaBx3EmXGrSCeZfdW3H4FcHXlEDPVAooc7TbR3T8dC1pKys8euCzaAfvQ2SEi2GH
P9iYC9sQ/2ThoQyJrOv/eNW8ftQvqaek89aND3o1lQZQT/wwFbWcnk1l55GvPvyF
lfcL/DcVwcd0hvXy2qqlq6va3++e+HWsE8u4yS7i/rluX6lzBC/Iwk6c0MNOgzNi
sbHBV0sk1R1geFE5si38zz91YXhntU0pmAnA4QRWlr7HJbBhy/+llirew4sidem9
u+h5YCU79xJ6JJr2WaoMJz7DFEFeAJlROem9x8L3pRBiGpTzUQcM5vU+P5g6Gnh3
bSOJGhpxxuLjStBM2hqZGGGCLq4l6biBva8pmzy0FoTqobitS/3hrIKOxgp/3bz6
cJQ3NLbgk6OOpnfOU2oK
=gOkz
-----END PGP SIGNATURE-----

--Sig_/mTYCrXriuVUD985kG3i33J3--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
