From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] clk: si5351: Allow to build without CONFIG_OF
Date: Sun, 28 Apr 2013 20:03:26 +0200
Message-ID: <201304282003.26593.arnd@arndb.de>
References: <1367144681-14248-1-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1367144681-14248-1-git-send-email-sebastian.hesselbarth@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Mike Turquette <mturquette@linaro.org>, Stephen Warren <swarren@nvidia.com>, Thierry Reding <thierry.reding@avionic-design.de>, Dom Cobley <popcornmix@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Pawel Moll <pawel.moll@arm.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Rabeeh Khoury <rabeeh@solid-run.com>, Daniel Mack <zonque@gmail.com>, Jean-Francois Moine <moinejf@free.fr>, Lars-Peter Clausen <lars@metafoo.de>, Guenter Roeck <linux@roeck-us.net>, Michal Bachraty <michal.bachraty@streamunlimited.com>, Marek Belisko <marek.belisko@streamunlimited.com>, devicetree-discuss@lists.ozlabs.org, linux-doc
List-Id: devicetree@vger.kernel.org

On Sunday 28 April 2013, Sebastian Hesselbarth wrote:
> diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
> index 8323c31..91c0f01 100644
> --- a/drivers/clk/clk-si5351.c
> +++ b/drivers/clk/clk-si5351.c
> @@ -1489,12 +1489,14 @@ static int si5351_i2c_probe(struct i2c_client *client,
>                 }
>         }
>  
> +#ifdef CONFIG_OF
>         ret = of_clk_add_provider(client->dev.of_node, of_clk_src_onecell_get,
>                                   &drvdata->onecell);
>         if (ret) {
>                 dev_err(&client->dev, "unable to add clk provider\n");
>                 return ret;
>         }
> +#endif
>  

I think we should instead make of_clk_add_provider return 0 if CONFIG_OF
is disabled, adn we don't consider it an error condition to call it.
That is also what we return when CONFIG_OF is enabled and we boot without
a device tree.

	Arnd
