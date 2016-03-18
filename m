From: Wei-Ning Huang <wnhuang-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v5 2/4] mwifiex: add platform specific wakeup interrupt support
Date: Sat, 19 Mar 2016 01:18:23 +0800
Message-ID: <CABicQ-W-dPcsfFQO_Ef67vriZw7kwHMrVo_EPabwXPcXb7Ew7A@mail.gmail.com>
References: <1458299032-31929-1-git-send-email-akarwar@marvell.com>
	<1458299032-31929-2-git-send-email-akarwar@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1458299032-31929-2-git-send-email-akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Cathy Luo <cluo-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nishant Sarmukadam <nishants-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Reviewed-by: Wei-Ning Huang <wnhuang-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Tested-by: Wei-Ning Huang <wnhuang-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

On Fri, Mar 18, 2016 at 7:03 PM, Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>=
 wrote:
> From: Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
>
> On some arm-based platforms, we need to configure platform specific
> parameters by device tree node and also define our node as a child
> node of parent SDIO host controller.
> This patch parses these parameters from device tree. It includes
> calibration data dowoload to firmware, wakeup pin configured to firmw=
are,
> and soc specific wake up gpio, which will be set as wakeup interrupt =
pin.
>
> Signed-off-by: Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> ---
>  drivers/net/wireless/marvell/mwifiex/main.h    | 11 ++++
>  drivers/net/wireless/marvell/mwifiex/sdio.c    | 77 ++++++++++++++++=
++++++++++
>  drivers/net/wireless/marvell/mwifiex/sdio.h    |  7 +++
>  drivers/net/wireless/marvell/mwifiex/sta_cmd.c | 14 ++++-
>  4 files changed, 106 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/wireless/marvell/mwifiex/main.h b/drivers/ne=
t/wireless/marvell/mwifiex/main.h
> index eb2c90c..9da27cf 100644
> --- a/drivers/net/wireless/marvell/mwifiex/main.h
> +++ b/drivers/net/wireless/marvell/mwifiex/main.h
> @@ -37,6 +37,17 @@
>  #include <linux/idr.h>
>  #include <linux/inetdevice.h>
>  #include <linux/devcoredump.h>
> +#include <linux/err.h>
> +#include <linux/gpio.h>
> +#include <linux/gfp.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/of_gpio.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/slab.h>
> +#include <linux/of_irq.h>
>
>  #include "decl.h"
>  #include "ioctl.h"
> diff --git a/drivers/net/wireless/marvell/mwifiex/sdio.c b/drivers/ne=
t/wireless/marvell/mwifiex/sdio.c
> index 901c064..c55e69b 100644
> --- a/drivers/net/wireless/marvell/mwifiex/sdio.c
> +++ b/drivers/net/wireless/marvell/mwifiex/sdio.c
> @@ -73,6 +73,66 @@ static struct memory_type_mapping mem_type_mapping=
_tbl[] =3D {
>         {"EXTLAST", NULL, 0, 0xFE},
>  };
>
> +static const struct of_device_id mwifiex_sdio_of_match_table[] =3D {
> +       { .compatible =3D "marvell,sd8897" },
> +       { .compatible =3D "marvell,sd8997" },
> +       { }
> +};
> +
> +static irqreturn_t mwifiex_wake_irq_wifi(int irq, void *priv)
> +{
> +       struct mwifiex_plt_wake_cfg *cfg =3D priv;
> +
> +       if (cfg->irq_wifi >=3D 0) {
> +               pr_info("%s: wake by wifi", __func__);
> +               cfg->wake_by_wifi =3D true;
> +               disable_irq_nosync(irq);
> +       }
> +
> +       return IRQ_HANDLED;
> +}
> +
> +/* This function parse device tree node using mmc subnode devicetree=
 API.
> + * The device node is saved in card->plt_of_node.
> + * if the device tree node exist and include interrupts attributes, =
this
> + * function will also request platform specific wakeup interrupt.
> + */
> +static int mwifiex_sdio_probe_of(struct device *dev, struct sdio_mmc=
_card *card)
> +{
> +       struct mwifiex_plt_wake_cfg *cfg;
> +       int ret;
> +
> +       if (!dev->of_node ||
> +           !of_match_node(mwifiex_sdio_of_match_table, dev->of_node)=
) {
> +               pr_err("sdio platform data not available");
> +               return -1;
> +       }
> +
> +       card->plt_of_node =3D dev->of_node;
> +       card->plt_wake_cfg =3D devm_kzalloc(dev, sizeof(*card->plt_wa=
ke_cfg),
> +                                         GFP_KERNEL);
> +       cfg =3D card->plt_wake_cfg;
> +       if (cfg && card->plt_of_node) {
> +               cfg->irq_wifi =3D irq_of_parse_and_map(card->plt_of_n=
ode, 0);
> +               if (!cfg->irq_wifi) {
> +                       dev_err(dev, "fail to parse irq_wifi from dev=
ice tree");
> +               } else {
> +                       ret =3D devm_request_irq(dev, cfg->irq_wifi,
> +                                              mwifiex_wake_irq_wifi,
> +                                              IRQF_TRIGGER_LOW,
> +                                              "wifi_wake", cfg);
> +                       if (ret) {
> +                               dev_err(dev,
> +                                       "Failed to request irq_wifi %=
d (%d)\n",
> +                                       cfg->irq_wifi, ret);
> +                       }
> +                       disable_irq(cfg->irq_wifi);
> +               }
> +       }
> +
> +       return 0;
> +}
> +
>  /*
>   * SDIO probe.
>   *
> @@ -127,6 +187,9 @@ mwifiex_sdio_probe(struct sdio_func *func, const =
struct sdio_device_id *id)
>                 return -EIO;
>         }
>
> +       /* device tree node parsing and platform specific configurati=
on*/
> +       mwifiex_sdio_probe_of(&func->dev, card);
> +
>         if (mwifiex_add_card(card, &add_remove_card_sem, &sdio_ops,
>                              MWIFIEX_SDIO)) {
>                 pr_err("%s: add card failed\n", __func__);
> @@ -183,6 +246,13 @@ static int mwifiex_sdio_resume(struct device *de=
v)
>         mwifiex_cancel_hs(mwifiex_get_priv(adapter, MWIFIEX_BSS_ROLE_=
STA),
>                           MWIFIEX_SYNC_CMD);
>
> +       /* Disable platform specific wakeup interrupt */
> +       if (card->plt_wake_cfg && card->plt_wake_cfg->irq_wifi >=3D 0=
) {
> +               disable_irq_wake(card->plt_wake_cfg->irq_wifi);
> +               if (!card->plt_wake_cfg->wake_by_wifi)
> +                       disable_irq(card->plt_wake_cfg->irq_wifi);
> +       }
> +
>         return 0;
>  }
>
> @@ -262,6 +332,13 @@ static int mwifiex_sdio_suspend(struct device *d=
ev)
>
>         adapter =3D card->adapter;
>
> +       /* Enable platform specific wakeup interrupt */
> +       if (card->plt_wake_cfg && card->plt_wake_cfg->irq_wifi >=3D 0=
) {
> +               card->plt_wake_cfg->wake_by_wifi =3D false;
> +               enable_irq(card->plt_wake_cfg->irq_wifi);
> +               enable_irq_wake(card->plt_wake_cfg->irq_wifi);
> +       }
> +
>         /* Enable the Host Sleep */
>         if (!mwifiex_enable_hs(adapter)) {
>                 mwifiex_dbg(adapter, ERROR,
> diff --git a/drivers/net/wireless/marvell/mwifiex/sdio.h b/drivers/ne=
t/wireless/marvell/mwifiex/sdio.h
> index b9fbc5c..db837f1 100644
> --- a/drivers/net/wireless/marvell/mwifiex/sdio.h
> +++ b/drivers/net/wireless/marvell/mwifiex/sdio.h
> @@ -154,6 +154,11 @@
>         a->mpa_rx.start_port =3D 0;                                  =
     \
>  } while (0)
>
> +struct mwifiex_plt_wake_cfg {
> +       int irq_wifi;
> +       bool wake_by_wifi;
> +};
> +
>  /* data structure for SDIO MPA TX */
>  struct mwifiex_sdio_mpa_tx {
>         /* multiport tx aggregation buffer pointer */
> @@ -237,6 +242,8 @@ struct mwifiex_sdio_card_reg {
>  struct sdio_mmc_card {
>         struct sdio_func *func;
>         struct mwifiex_adapter *adapter;
> +       struct device_node *plt_of_node;
> +       struct mwifiex_plt_wake_cfg *plt_wake_cfg;
>
>         const char *firmware;
>         const struct mwifiex_sdio_card_reg *reg;
> diff --git a/drivers/net/wireless/marvell/mwifiex/sta_cmd.c b/drivers=
/net/wireless/marvell/mwifiex/sta_cmd.c
> index 30f1526..930495b 100644
> --- a/drivers/net/wireless/marvell/mwifiex/sta_cmd.c
> +++ b/drivers/net/wireless/marvell/mwifiex/sta_cmd.c
> @@ -2134,6 +2134,7 @@ int mwifiex_sta_init_cmd(struct mwifiex_private=
 *priv, u8 first_sta, bool init)
>         enum state_11d_t state_11d;
>         struct mwifiex_ds_11n_tx_cfg tx_cfg;
>         u8 sdio_sp_rx_aggr_enable;
> +       int data;
>
>         if (first_sta) {
>                 if (priv->adapter->iface_type =3D=3D MWIFIEX_PCIE) {
> @@ -2154,9 +2155,16 @@ int mwifiex_sta_init_cmd(struct mwifiex_privat=
e *priv, u8 first_sta, bool init)
>                  * The cal-data can be read from device tree and/or
>                  * a configuration file and downloaded to firmware.
>                  */
> -               adapter->dt_node =3D
> -                               of_find_node_by_name(NULL, "marvell_c=
fgdata");
> -               if (adapter->dt_node) {
> +               if (priv->adapter->iface_type =3D=3D MWIFIEX_SDIO &&
> +                   adapter->dev->of_node) {
> +                       adapter->dt_node =3D adapter->dev->of_node;
> +                       if (of_property_read_u32(adapter->dt_node,
> +                                                "marvell,wakeup-pin"=
,
> +                                                &data) =3D=3D 0) {
> +                               pr_debug("Wakeup pin =3D 0x%x\n", dat=
a);
> +                               adapter->hs_cfg.gpio =3D data;
> +                       }
> +
>                         ret =3D mwifiex_dnld_dt_cfgdata(priv, adapter=
->dt_node,
>                                                       "marvell,caldat=
a");
>                         if (ret)
> --
> 1.8.1.4
>



--=20
Wei-Ning Huang, =E9=BB=83=E5=81=89=E5=AF=A7 | Software Engineer, Google=
 Inc., Taiwan |
wnhuang-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org | Cell: +886 910-380678
--
To unsubscribe from this list: send the line "unsubscribe linux-wireles=
s" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
