From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] of/platform: export of_default_bus_match_table
Date: Tue, 05 Jan 2016 11:13:28 +0100
Message-ID: <2748326.r4zEhnPneC@wuerfel>
References: <1451960273-19934-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1451960273-19934-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: devicetree@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>, Olof Johansson <olof@lixom.net>, Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 05 January 2016 11:17:53 Masahiro Yamada wrote:
> Currently, drivers/bus/uniphier-system-bus.c is kept from being a
> module due to the unresolved reference to of_default_bus_match_table.
> 
> Refer to commit 326ea45aa827 ("bus: uniphier: allow only built-in
> driver").
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  drivers/of/platform.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index af98343..8d103e4 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -31,6 +31,7 @@ const struct of_device_id of_default_bus_match_table[] = {
>  #endif /* CONFIG_ARM_AMBA */
>         {} /* Empty terminated list */
>  };
> +EXPORT_SYMBOL(of_default_bus_match_table);

I wonder if the uniphier bus should actually use the default
match table at all. Sorry for not having thought of that when
I did my patch.

What kinds of devices do you see below this bus? Do you have multiple
levels of devices? Are they all platform devices or could they
be AMBA?

	Arnd
