From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v7 04/14] media: rkisp1: add Rockchip MIPI Synopsys DPHY
 driver
Date: Wed, 3 Jul 2019 21:59:52 +0200 (CEST)
Message-ID: <alpine.DEB.2.21.1907032153410.1802@nanos.tec.linutronix.de>
References: <20190703190910.32633-1-helen.koike@collabora.com> <20190703190910.32633-5-helen.koike@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190703190910.32633-5-helen.koike@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Helen Koike <helen.koike@collabora.com>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, eddie.cai.linux@gmail.com, mchehab@kernel.org, heiko@sntech.de, jacob2.chen@rock-chips.com, jeffy.chen@rock-chips.com, zyc@rock-chips.com, linux-kernel@vger.kernel.org, tfiga@chromium.org, hans.verkuil@cisco.com, laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com, kernel@collabora.com, ezequiel@collabora.com, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, zhengsq@rock-chips.com, Zheng Yang <zhengyang@rock-chips.com>, Kishon Vijay Abraham I <kishon@ti.com>
List-Id: devicetree@vger.kernel.org

Helen,

On Wed, 3 Jul 2019, Helen Koike wrote:

> @@ -0,0 +1,412 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Rockchip MIPI Synopsys DPHY driver
> + *
> + * Based on:
> + *
> + * Copyright (C) 2016 FuZhou Rockchip Co., Ltd.
> + * Author: Yakir Yang <ykk@@rock-chips.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License.

So the SPDX-Identifiers says: GPL-2.0+ and here someone copied a broken
boiler plate text which could be interpreted as GPLv2 only because the 'or
at your option any later version' part was removed.

Can you please remove that boiler plate language? It's redundant
information. The SPDX license identifier is unambiguous, machine readable
and legally binding license information.

Thanks,

	tglx
