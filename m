From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 3/5] media: sunxi: Add A10 CSI driver
Date: Tue, 13 Nov 2018 10:48:51 -0200
Message-ID: <CAOMZO5CjFt1dyu8KOK+jKd88x8hwGNy9aJ-sGgooS9970TGTVQ@mail.gmail.com>
References: <cover.71b0f9855c251f9dc389ee77ee6f0e1fad91fb0b.1542097288.git-series.maxime.ripard@bootlin.com>
 <c53e1cdc3b139382b00ee06bf3980d3fd1742ec0.1542097288.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c53e1cdc3b139382b00ee06bf3980d3fd1742ec0.1542097288.git-series.maxime.ripard@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Hans Verkuil <hans.verkuil@cisco.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media <linux-media@vger.kernel.org>, Andrzej Hajda <a.hajda@samsung.com>, Chen-Yu Tsai <wens@csie.org>, linux-kernel <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 13, 2018 at 6:25 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:

> --- /dev/null
> +++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> @@ -0,0 +1,275 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later

According to Documentation/process/license-rules.rst this should be:

+// SPDX-License-Identifier: GPL-2.0+

Same applies to other places in this patch.
