From: Ricky Liang <jcliang@chromium.org>
Subject: Re: [PATCH v9 2/4] vcodec: mediatek: Add Mediatek JPEG Decoder Driver
Date: Sun, 18 Dec 2016 14:53:20 +0800
Message-ID: <CAAJzSMfb=_Td+_f-q0mOTX5dGFC1Roxxm7+-yjavKFo3DO8YUw@mail.gmail.com>
References: <1481702690-10476-1-git-send-email-rick.chang@mediatek.com> <1481702690-10476-3-git-send-email-rick.chang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1481702690-10476-3-git-send-email-rick.chang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rick Chang <rick.chang@mediatek.com>
Cc: Hans Verkuil <hans.verkuil@cisco.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Bin Liu <bin.liu@mediatek.com>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, Minghsiu Tsai <minghsiu.tsai@mediatek.com>, srv_heupstream@mediatek.com, open list <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, "moderated list:ARM/Mediatek SoC..." <linux-arm-kernel@lists.infradead.org>, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 14, 2016 at 4:04 PM, Rick Chang <rick.chang@mediatek.com> wrote:
> Add v4l2 driver for Mediatek JPEG Decoder
>
> Signed-off-by: Rick Chang <rick.chang@mediatek.com>
> Signed-off-by: Minghsiu Tsai <minghsiu.tsai@mediatek.com>
> ---
>  drivers/media/platform/Kconfig                   |   15 +
>  drivers/media/platform/Makefile                  |    2 +
>  drivers/media/platform/mtk-jpeg/Makefile         |    2 +
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c  | 1306 ++++++++++++++++++++++
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h  |  139 +++
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_hw.c    |  417 +++++++
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_hw.h    |   91 ++
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_parse.c |  160 +++
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_parse.h |   25 +
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_reg.h   |   58 +
>  10 files changed, 2215 insertions(+)

Reviewed-by: Ricky Liang <jcliang@chromium.org>
Tested-by: Ricky Liang <jcliang@chromium.org>
