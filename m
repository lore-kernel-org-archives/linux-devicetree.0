From: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 08/17] clk: at91: add PMC system clocks
Date: Wed, 27 Nov 2013 14:05:29 -0800
Message-ID: <20131127220529.16819.42204@quantum>
References: <1384289513-3068-1-git-send-email-b.brezillon@overkiz.com>
 <1384293935-4755-1-git-send-email-b.brezillon@overkiz.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384293935-4755-1-git-send-email-b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Richard Genoud <richard.genoud-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Boris BREZILLON <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Quoting Boris BREZILLON (2013-11-12 14:05:35)
> This patch adds new at91 system clock implementation using common clk
> framework.
> 
> Some peripherals need to enable a "system" clock in order to work properly.
> Each system clock is given an id based on the bit position in SCER/SCDR
> registers.
> 
> Signed-off-by: Boris BREZILLON <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
> Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/clk/at91/Makefile     |    1 +
>  drivers/clk/at91/clk-system.c |  137 +++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/at91/pmc.c        |    5 ++
>  drivers/clk/at91/pmc.h        |    3 +
>  4 files changed, 146 insertions(+)
>  create mode 100644 drivers/clk/at91/clk-system.c
> 
> diff --git a/drivers/clk/at91/Makefile b/drivers/clk/at91/Makefile
> index e28fb2b..c2b7068 100644
> --- a/drivers/clk/at91/Makefile
> +++ b/drivers/clk/at91/Makefile
> @@ -4,3 +4,4 @@
>  
>  obj-y += pmc.o
>  obj-y += clk-main.o clk-pll.o clk-plldiv.o clk-master.o
> +obj-y += clk-system.o
> diff --git a/drivers/clk/at91/clk-system.c b/drivers/clk/at91/clk-system.c
> new file mode 100644
> index 0000000..1c086f4
> --- /dev/null
> +++ b/drivers/clk/at91/clk-system.c
> @@ -0,0 +1,137 @@
> +/*
> + * drivers/clk/at91/clk-system.c

Nitpick: it's better to not put file paths in a comment block in case
the file name or path is changed.

Regards,
Mike
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
