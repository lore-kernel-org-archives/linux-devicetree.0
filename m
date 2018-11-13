From: Hans Verkuil <hansverk@cisco.com>
Subject: Re: [PATCH 3/5] media: sunxi: Add A10 CSI driver
Date: Tue, 13 Nov 2018 14:37:08 +0100
Message-ID: <9a9616d2-a189-bd0e-e2e6-f84bdcb1dfd1@cisco.com>
References: <cover.71b0f9855c251f9dc389ee77ee6f0e1fad91fb0b.1542097288.git-series.maxime.ripard@bootlin.com>
 <c53e1cdc3b139382b00ee06bf3980d3fd1742ec0.1542097288.git-series.maxime.ripard@bootlin.com>
 <CAOMZO5CjFt1dyu8KOK+jKd88x8hwGNy9aJ-sGgooS9970TGTVQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOMZO5CjFt1dyu8KOK+jKd88x8hwGNy9aJ-sGgooS9970TGTVQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>, Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Hans Verkuil <hans.verkuil@cisco.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media <linux-media@vger.kernel.org>, Andrzej Hajda <a.hajda@samsung.com>, Chen-Yu Tsai <wens@csie.org>, linux-kernel <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

On 11/13/18 13:48, Fabio Estevam wrote:
> On Tue, Nov 13, 2018 at 6:25 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> 
>> --- /dev/null
>> +++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
>> @@ -0,0 +1,275 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
> 
> According to Documentation/process/license-rules.rst this should be:
> 
> +// SPDX-License-Identifier: GPL-2.0+
> 
> Same applies to other places in this patch.
> 

Actually, LICENSES/preferred/GPL-2.0 has GPL-2.0-or-later
as a valid license:

Valid-License-Identifier: GPL-2.0-or-later

Personally I very much prefer GPL-2.0-or-later since I think it is
much clearer.

Regards,

	Hans
