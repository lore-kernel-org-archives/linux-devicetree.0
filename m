From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/3] of: mtd: add helper reading "nand-ecc-algo" from DT
Date: Fri, 26 Feb 2016 22:28:51 +0100
Message-ID: <20160226222851.7821d371@bbrezillon>
References: <1455300685-27009-1-git-send-email-zajec5@gmail.com>
	<20160224144652.14068468@bbrezillon>
	<CACna6rxemvBOu9fy9KP0327TsqonO7dFY5EsQjf1k9Ln6hX8cw@mail.gmail.com>
	<20160225210946.6c842f4b@bbrezillon>
	<CACna6ryVuqSLv8WdzzGUQzpA-F35JxXoHoa2jcLzZeHaXtoexA@mail.gmail.com>
	<20160226175506.75d6c7b0@bbrezillon>
	<CACna6rzRROfYwagsBGo5b8d_bydUBrJ=9RvGZSt1G85xP=gKaw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACna6rzRROfYwagsBGo5b8d_bydUBrJ=9RvGZSt1G85xP=gKaw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kamal Dasu <kdasu.kdev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 26 Feb 2016 22:24:21 +0100
Rafa=C5=82 Mi=C5=82ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> On 26 February 2016 at 17:55, Boris Brezillon
> <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > On Fri, 26 Feb 2016 17:30:47 +0100
> > Rafa=C5=82 Mi=C5=82ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >> What about:
> >> 1) Adding new nand-ecc-algo as this patch does
> >> 2) Deprecating "soft_bch" value from nand-ecc-mode property
> >>
> >
> > Sounds good to me.
>=20
> I have problems understanding "soft" values which maps to the
> NAND_ECC_SOFT. What exactly algorithm is that? It uses functions from
> drivers/mtd/nand/nand_ecc.c but this file isn't really helpful. I was
> only able to find "3-byte ECC" phase. Kconfig config MTD_NAND_ECC als=
o
> doesn't have any description. I also tried looking at
> Documentation/mtd/nand_ecc.txt but still no luck.
>=20
> Does this algorithm has any name?
>=20

AFAIR, nand_ecc.c is implementing Hamming ECC.

--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
