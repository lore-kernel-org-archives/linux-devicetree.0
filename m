From: Jonas Gorski <jogo@openwrt.org>
Subject: Re: [PATCH] Revert "of/irq: make of_irq_find_parent static"
Date: Wed, 2 Dec 2015 17:32:44 +0100
Message-ID: <CAOiHx=m9BCsxQRcEs-ReKujaKo0BRs1V51wX7jzvhgjV0iZkJw@mail.gmail.com>
References: <1449072887-2734-1-git-send-email-qais.yousef@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1449072887-2734-1-git-send-email-qais.yousef@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Qais Yousef <qais.yousef@imgtec.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, frowand.list@gmail.com, Grant Likely <grant.likely@linaro.org>, David Daney <david.daney@cavium.com>
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, Dec 2, 2015 at 5:14 PM, Qais Yousef <qais.yousef@imgtec.com> wrote:
> This reverts commit 52493d446141b07c8ba28dd6a529513f8b2342bd.
>
> Signed-off-by: Qais Yousef <qais.yousef@imgtec.com>
>
> Conflicts:
>         include/linux/of_irq.h
> ---
> I have a patch series that is under review that makes use of of_irq_find_parent()
>
> The affected patch is this:
>
>         https://lkml.org/lkml/2015/11/25/291
>
> Is it wrong to use this function? If yes, what's the alternative?
> If no, OK to revert?

Make the revert part of the series that needs it, so it won't get
moved again because of no external users.

also ...

>
> Thanks,
> Qais
>
>
>  drivers/of/irq.c       | 2 +-
>  include/linux/of_irq.h | 6 ++++++
>  2 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> index 902b89be7217..45735d56e435 100644
> --- a/drivers/of/irq.c
> +++ b/drivers/of/irq.c
> @@ -53,7 +53,7 @@ EXPORT_SYMBOL_GPL(irq_of_parse_and_map);
>   * Returns a pointer to the interrupt parent node, or NULL if the interrupt
>   * parent could not be determined.
>   */
> -static struct device_node *of_irq_find_parent(struct device_node *child)
> +struct device_node *of_irq_find_parent(struct device_node *child)
>  {
>         struct device_node *p;
>         const __be32 *parp;
> diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
> index 039f2eec49ce..0c9ea9fb5b63 100644
> --- a/include/linux/of_irq.h
> +++ b/include/linux/of_irq.h
> @@ -93,6 +93,7 @@ static inline void of_msi_configure(struct device *dev, struct device_node *np)
>   * so declare it here regardless of the CONFIG_OF_IRQ setting.
>   */
>  extern unsigned int irq_of_parse_and_map(struct device_node *node, int index);
> +extern struct device_node *of_irq_find_parent(struct device_node *child);

This is the wrong place to add the prototype, and

>  u32 of_msi_map_rid(struct device *dev, struct device_node *msi_np, u32 rid_in);
>
>  #else /* !CONFIG_OF && !CONFIG_SPARC */
> @@ -102,6 +103,11 @@ static inline unsigned int irq_of_parse_and_map(struct device_node *dev,
>         return 0;
>  }
>
> +static inline void *of_irq_find_parent(struct device_node *child)
> +{
> +       return NULL;
> +}
> +

This is the wrong place to add the inline version. Both need to be
within the #ifdef CONFIG_OF_IRQ ... #else ... #endif block, as the
function is not available just with CONFIG_OF.


>  static inline u32 of_msi_map_rid(struct device *dev,
>                                  struct device_node *msi_np, u32 rid_in)

@Daney:

And this one is at the wrong place as well. Please fix it.

This will break the build if CONFIG_OF is enabled but CONFIG_OF_IRQ
isn't, and something tries to call these functions.


Regards
Jonas
