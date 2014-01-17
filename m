From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [RFC/PATCH 0/1] mtd: Add NAND ECC devicetree binding
Date: Fri, 17 Jan 2014 17:33:48 -0300
Message-ID: <20140117203347.GC3843@localhost>
References: <1389960820-18696-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA66555@DBDE04.ent.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA66555-yXqyApvAXouIQmiDNMet8wC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Gupta, Pekon" <pekon-l0cyMroinI0@public.gmane.org>
Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Seif Mazareeb <seif-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 17, 2014 at 05:58:13PM +0000, Gupta, Pekon wrote:
> Hi Ezequiel,
>=20
> >From: Ezequiel Garcia [mailto:ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org]
> >
> >This patch is our first proposal to address the need for a suitable =
ECC
> >devicetree binding.
> >
> >NAND controllers have special ECC modes, raising per-driver ECC mode=
 devicetree
> >binding. See for instance the binding for OMAP:
> >
> > - ti,nand-ecc-opt: A string setting the ECC layout to use. One of:
> >	"sw"		<deprecated> use "ham1" instead
> >	"hw"		<deprecated> use "ham1" instead
> >	"hw-romcode"	<deprecated> use "ham1" instead
> >	"ham1"		1-bit Hamming ecc code
> >	"bch4"		4-bit BCH ecc code
> >	"bch8"		8-bit BCH ecc code
> >
> >Other drivers (such as pxa3xx-nand) have similar requirements, with =
special
> >(controller-specific) ECC modes. Instead of adding a possibly differ=
ent binding
> >per compatible-string, let's add generic ECC strength and ECC step s=
ize.
> >
> >This properties should describe completely the ECC mode and let driv=
ers choose
> >the appropriate ECC mode.
> >
> Yes, this is good approach.
> It was found earlier that generic NAND DT bindings are not much use t=
o other
> controllers as well, as different h/w engines have different interpre=
tations.
> Brian Norris had similar comments giving example of his hardware.
> (hope following reference helps).
>=20
> [1] http://lists.infradead.org/pipermail/linux-mtd/2013-September/048=
869.html
>=20

Yes, Brian suggested this ecc-strength/ecc-size approach on IRC.

Pekon, do you think this binding proposal is good enough to describe OM=
AP NAND
ECC mode?

I'm not implying we should deprecate the recently added "ti-nand-ecc-op=
t",
but just want to know it's eventually possible.

--=20
Ezequiel Garc=C3=ADa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
