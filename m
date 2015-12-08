From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v2] of/address: replace printk() with pr_debug() /
 pr_err()
Date: Tue, 08 Dec 2015 09:03:51 -0800
Message-ID: <1449594231.13275.2.camel@perches.com>
References: <1449590868-19070-1-git-send-email-yamada.masahiro@socionext.com>
	 <1449591386.3315.2.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1449591386.3315.2.camel@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>, devicetree@vger.kernel.org
Cc: Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2015-12-08 at 08:16 -0800, Joe Perches wrote:
> On Wed, 2015-12-09 at 01:07 +0900, Masahiro Yamada wrote:
> > Trivial changes suggested by checkpatch.pl.
> []
> > diff --git a/drivers/of/address.c b/drivers/of/address.c
> []
> > @@ -23,7 +23,7 @@ static int __of_address_to_resource(struct device=
_node *dev,
> > =A0#ifdef DEBUG
> > =A0static void of_dump_addr(const char *s, const __be32 *addr, int =
na)
> > =A0{
> > -	printk(KERN_DEBUG "%s", s);
> > +	pr_debug("%s", s);
> > =A0	while (na--)
> > =A0		printk(" %08x", be32_to_cpu(*(addr++)));
> > =A0	printk("\n");
>=20
> mixing pr_debug and printk doesn't make much sense.
>=20
> It might be nicer to use
>=20
> static void of_dumpaddr(const=A0char *s, const __be32 *addr, int na)
> {
> #ifdef DEBUG
> 	...
> #endif
> }
>=20
> to avoid the other static declaration

Or more simply:

static void of_dumpaddr(const=A0char *s, const __be32 *addr, int na)
{
	print_hex_dump_debug(s, DUMP_PREFIX_NONE, 16, 1,
			    =A0addr, na * sizeof(__be32), false);
}
