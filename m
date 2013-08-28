From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [PATCH v2] of_net.h: Make of_get_phy_mode() return int i.s.o. const int
Date: Wed, 28 Aug 2013 20:51:03 +0100
Message-ID: <20130828195103.1C90E3E0AF4@localhost>
References: <1376823690-29179-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1376823690-29179-1-git-send-email-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <rob.herring@calxeda.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: devicetree@vger.kernel.org

On Sun, 18 Aug 2013 13:01:30 +0200, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> include/linux/of_net.h:16: warning: type qualifiers ignored on function return type
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---

Applied, thanks.

g.

> v2: update the actual function in drivers/of/of_net.c.
> 
>  drivers/of/of_net.c    |    2 +-
>  include/linux/of_net.h |    4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/of/of_net.c b/drivers/of/of_net.c
> index ea174c8..8f9be2e 100644
> --- a/drivers/of/of_net.c
> +++ b/drivers/of/of_net.c
> @@ -39,7 +39,7 @@ static const char *phy_modes[] = {
>   * The function gets phy interface string from property 'phy-mode',
>   * and return its index in phy_modes table, or errno in error case.
>   */
> -const int of_get_phy_mode(struct device_node *np)
> +int of_get_phy_mode(struct device_node *np)
>  {
>  	const char *pm;
>  	int err, i;
> diff --git a/include/linux/of_net.h b/include/linux/of_net.h
> index 61bf53b..34597c8 100644
> --- a/include/linux/of_net.h
> +++ b/include/linux/of_net.h
> @@ -9,10 +9,10 @@
>  
>  #ifdef CONFIG_OF_NET
>  #include <linux/of.h>
> -extern const int of_get_phy_mode(struct device_node *np);
> +extern int of_get_phy_mode(struct device_node *np);
>  extern const void *of_get_mac_address(struct device_node *np);
>  #else
> -static inline const int of_get_phy_mode(struct device_node *np)
> +static inline int of_get_phy_mode(struct device_node *np)
>  {
>  	return -ENODEV;
>  }
> -- 
> 1.7.9.5
> 
