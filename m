From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v2] of/address: replace printk() with pr_debug() /
 pr_err()
Date: Tue, 08 Dec 2015 08:16:26 -0800
Message-ID: <1449591386.3315.2.camel@perches.com>
References: <1449590868-19070-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1449590868-19070-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>, devicetree@vger.kernel.org
Cc: Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2015-12-09 at 01:07 +0900, Masahiro Yamada wrote:
> Trivial changes suggested by checkpatch.pl.
[]
> diff --git a/drivers/of/address.c b/drivers/of/address.c
[]
> @@ -23,7 +23,7 @@ static int __of_address_to_resource(struct device_n=
ode *dev,
> =A0#ifdef DEBUG
> =A0static void of_dump_addr(const char *s, const __be32 *addr, int na=
)
> =A0{
> -	printk(KERN_DEBUG "%s", s);
> +	pr_debug("%s", s);
> =A0	while (na--)
> =A0		printk(" %08x", be32_to_cpu(*(addr++)));
> =A0	printk("\n");

mixing pr_debug and printk doesn't make much sense.

It might be nicer to use

static void of_dumpaddr(const=A0char *s, const __be32 *addr, int na)
{
#ifdef DEBUG
	...
#endif
}

to avoid the other static declaration
