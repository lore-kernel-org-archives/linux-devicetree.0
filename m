From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 1/9] dt: add empty of_get_node/of_put_node functions
Date: Wed, 14 Dec 2011 09:02:24 -0700
Message-ID: <CACxGe6vNaQtd5FtTWbYpH_Hwfp7OgMfOcBYuDEDULJ3XnYdL9g@mail.gmail.com>
References: <1323876538-20406-1-git-send-email-robherring2@gmail.com> <1323876538-20406-2-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1323876538-20406-2-git-send-email-robherring2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, shawn.guo@freescale.com, Kukjin Kim <kgene.kim@samsung.com>, Kevin Hilman <khilman@ti.com>, Tony Lindgren <tony@atomide.com>, Barry Song <baohua.song@csr.com>, Linus Walleij <linus.ml.walleij@gmail.com>, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 14, 2011 at 8:28 AM, Rob Herring <robherring2@gmail.com> wr=
ote:
> From: Rob Herring <rob.herring@calxeda.com>
>
> Add empty of_get_node/of_put_node functions for !CONFIG_OF builds.
>
> Signed-off-by: Rob Herring <rob.herring@calxeda.com>
> Cc: Grant Likely <grant.likely@secretlab.ca>

Looks good.

> ---
> =A0include/linux/of.h | =A0 29 ++++++++++++++---------------
> =A01 files changed, 14 insertions(+), 15 deletions(-)
>
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 4948552..e291381 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -65,6 +65,20 @@ struct device_node {
> =A0#endif
> =A0};
>
> +#if defined(CONFIG_SPARC) || !defined(CONFIG_OF)
> +/* Dummy ref counting routines - to be implemented later */
> +static inline struct device_node *of_node_get(struct device_node *no=
de)
> +{
> + =A0 =A0 =A0 return node;
> +}
> +static inline void of_node_put(struct device_node *node)
> +{
> +}
> +#else
> +extern struct device_node *of_node_get(struct device_node *node);
> +extern void of_node_put(struct device_node *node);
> +#endif
> +
> =A0#ifdef CONFIG_OF
>
> =A0/* Pointer for first entry in chain of all nodes. */
> @@ -95,21 +109,6 @@ static inline void of_node_set_flag(struct device=
_node *n, unsigned long flag)
>
> =A0extern struct device_node *of_find_all_nodes(struct device_node *p=
rev);
>
> -#if defined(CONFIG_SPARC)
> -/* Dummy ref counting routines - to be implemented later */
> -static inline struct device_node *of_node_get(struct device_node *no=
de)
> -{
> - =A0 =A0 =A0 return node;
> -}
> -static inline void of_node_put(struct device_node *node)
> -{
> -}
> -
> -#else
> -extern struct device_node *of_node_get(struct device_node *node);
> -extern void of_node_put(struct device_node *node);
> -#endif
> -
> =A0/*
> =A0* OF address retrieval & translation
> =A0*/
> --
> 1.7.5.4
>



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
