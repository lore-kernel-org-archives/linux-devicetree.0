From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH v3 2/5] mtd: aspeed: add memory controllers for the Aspeed
 AST2400 SoC
Date: Mon, 12 Dec 2016 11:10:37 +1100
Message-ID: <CACPK8Xf1RZa8ZvSWBJHvxGRLqkYaEJJ=kejn=1oXc0dSQVewwQ@mail.gmail.com>
References: <1481302167-28044-1-git-send-email-clg@kaod.org> <1481302167-28044-3-git-send-email-clg@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1481302167-28044-3-git-send-email-clg-Bxea+6Xhats@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg-Bxea+6Xhats@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Dec 10, 2016 at 3:49 AM, C=C3=A9dric Le Goater <clg-Bxea+6Xhats@public.gmane.org> wrote=
:
> This driver adds mtd support for the Aspeed AST2400 SoC static memory
> controllers:
>
> Signed-off-by: C=C3=A9dric Le Goater <clg-Bxea+6Xhats@public.gmane.org>

Good work. It was worth spending the time splitting out the different
controllers I think.

Reviewed-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>

> ---
>  drivers/mtd/spi-nor/Kconfig      |  2 +-
>  drivers/mtd/spi-nor/aspeed-smc.c | 33 +++++++++++++++++++++++++++++++++
>  2 files changed, 34 insertions(+), 1 deletion(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
