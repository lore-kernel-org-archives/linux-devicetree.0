From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] ARM: at91: sama5d4: dts: change the nand compatible
 string
Date: Mon, 26 Jan 2015 09:12:10 -0800
Message-ID: <20150126171210.GC5273@norris-Latitude-E6410>
References: <1421656387-12538-2-git-send-email-josh.wu@atmel.com>
 <1421923305-10088-1-git-send-email-josh.wu@atmel.com>
 <54C0D872.6010005@atmel.com>
 <54C65838.4020707@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54C65838.4020707-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 26, 2015 at 04:07:36PM +0100, Nicolas Ferre wrote:
> Le 22/01/2015 12:01, Nicolas Ferre a =E9crit :
> > Le 22/01/2015 11:41, Josh Wu a =E9crit :
> >> As we introduce a new "atmel,sama5d4-nand" compatible string for s=
ama5d4,
> >> so we need to apply it for sama5d4 chip.
> >>
> >> Signed-off-by: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> >=20
> > Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> >=20
> > Brian,
> > I suppose that it makes sense to keep this patch with the previous =
one.
> > So, can you take it in your tree?
> >=20
> > Otherwise, it can take the at91 -> arm-soc route.

I actually would prefer that. The changes are sane enough by themselves=
,
and I don't often touch the arch/arm DTS files.

> I take it with me right now and try to send it to arm-soc for 3.20.

That's fine. Thanks.

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
