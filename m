From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V5 4/4] mtd: extract TRX parser out of bcm47xxpart into a
 separated module
Date: Thu, 25 May 2017 13:51:54 -0700
Message-ID: <20170525205154.GD114788@google.com>
References: <20170524094437.2174-1-zajec5@gmail.com>
 <20170524094437.2174-5-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170524094437.2174-5-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 24, 2017 at 11:44:37AM +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
> 
> This makes TRX parsing code reusable with other platforms and parsers.
> 
> Please note this patch doesn't really change anything in the existing
> code, just moves it. There is still some place for improvement (e.g.
> working on non-hacky method of checking rootfs format) but it's not
> really a subject of this change.
> 
> Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
> ---
> V2: A totally rebased & refreshed version.
> V5: Add TRX format verification, improve comment, fix memory leak
>     Thanks Brian

I think this looks OK now. I'll wait on resolving the rest of the
infrastucture, so I'll leave this here for now:

Reviewed-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

> ---
>  drivers/mtd/Kconfig              |   4 ++
>  drivers/mtd/Makefile             |   1 +
>  drivers/mtd/bcm47xxpart.c        |  99 ++----------------------------
>  drivers/mtd/parsers/Kconfig      |   8 +++
>  drivers/mtd/parsers/Makefile     |   1 +
>  drivers/mtd/parsers/parser_trx.c | 126 +++++++++++++++++++++++++++++++++++++++
>  6 files changed, 145 insertions(+), 94 deletions(-)
>  create mode 100644 drivers/mtd/parsers/Kconfig
>  create mode 100644 drivers/mtd/parsers/Makefile
>  create mode 100644 drivers/mtd/parsers/parser_trx.c
> 

...

> diff --git a/drivers/mtd/parsers/Kconfig b/drivers/mtd/parsers/Kconfig
> new file mode 100644
> index 000000000000..ebb697a52698
> --- /dev/null
> +++ b/drivers/mtd/parsers/Kconfig
> @@ -0,0 +1,8 @@
> +config MTD_PARSER_TRX
> +	tristate "Parser for TRX format partitions"
> +	depends on MTD && (BCM47XX || ARCH_BCM_5301X)

|| COMPILE_TEST ? Would be nice to be able to build-test things like
this, even if you know they're only used for a few architectures.

> +	help
> +	  TRX is a firmware format used by Broadcom on their devices. It
> +	  may contain up to 3/4 partitions (depending on the version).
> +	  This driver will parse TRX header and report at least two partitions:
> +	  kernel and rootfs.

...

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
