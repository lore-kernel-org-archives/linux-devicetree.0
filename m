From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] of_net.h: Make of_get_phy_mode() return int i.s.o. const int
Date: Thu, 16 May 2013 17:50:48 +0200
Message-ID: <CAMuHMdVq+nCOHCwhfWyuTgDniJgA8fkFVKvAuAoEAJEEv6hEHA@mail.gmail.com>
References: <1367616754-5142-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1367616754-5142-1-git-send-email-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>
Cc: devicetree-discuss@lists.ozlabs.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 3, 2013 at 11:32 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> include/linux/of_net.h:16: warning: type qualifiers ignored on function return type
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  include/linux/of_net.h |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>
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
>         return -ENODEV;
>  }

drivers/of/of_net.c:41:11: error: conflicting types for 'of_get_phy_mode'
include/linux/of_net.h:12:12: note: previous declaration of
'of_get_phy_mode' was here

Doh, of course I also have to update the actual function in drivers/of/of_net.c.
Stay tuned for v2.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
