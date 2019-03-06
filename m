From: Pi-Hsun Shih <pihsun@chromium.org>
Subject: Re: [PATCH v2 08/10] soc: mediatek: cmdq: add polling function
Date: Wed, 6 Mar 2019 18:58:44 +0800
Message-ID: <CANdKZ0cBRfSjS021waSWB-RE6PPBt+ZpvnZmVWABgB8Y1nVe+w@mail.gmail.com>
References: <1551865835-50974-1-git-send-email-bibby.hsieh@mediatek.com> <1551865835-50974-9-git-send-email-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551865835-50974-9-git-send-email-bibby.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, CK HU <ck.hu@mediatek.com>, Daniel Kurtz <djkurtz@chromium.org>, Sascha Hauer <s.hauer@pengutronix.de>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Nicolas Boichat <drinkcat@chromium.org>, YT Shen <yt.shen@mediatek.com>, Daoyuan Huang <daoyuan.huang@mediatek.com>, Jiaguang Zhang <ji>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 6, 2019 at 5:51 PM Bibby Hsieh <bibby.hsieh@mediatek.com> wrote:
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index d3873ab..71c167c 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -231,6 +231,27 @@ int cmdq_pkt_clear_event(struct cmdq_pkt *pkt, u16 event)
>  }
>  EXPORT_SYMBOL(cmdq_pkt_clear_event);
>
> +int cmdq_pkt_poll(struct cmdq_pkt *pkt, u8 subsys,
> +                 u16 offset, u32 value, u32 mask)
> +{
> +       int err;
> +
> +       if (mask != 0xffffffff) {
> +               err = cmdq_pkt_append_command(pkt, CMDQ_GET_ARG_C(~mask),
> +                                             CMDQ_GET_ARG_B(~mask),
> +                                             0, 0, 0, 0, 0, CMDQ_CODE_MASK);

All other codes use CMDQ_IMMEDIATE_VALUE instead of 0 for arguments of
cmdq_pkt_append_command. Also use CMDQ_IMMEDIATE_VALUE here?

> +
> +               if (err != 0)
> +                       return err;
> +       }
> +       offset = offset | 0x1;
> +
> +       return cmdq_pkt_append_command(pkt, CMDQ_GET_ARG_C(value),
> +                                      CMDQ_GET_ARG_B(value),
> +                                      offset, subsys, 0, 0, 0, CMDQ_CODE_POLL);
> +}
> +EXPORT_SYMBOL(cmdq_pkt_poll);
> +
