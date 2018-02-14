From: Philippe Ombredanne <pombredanne@nexb.com>
Subject: Re: [PATCH v5 10/12] drm/sun4i: Implement A83T HDMI driver
Date: Wed, 14 Feb 2018 22:42:00 +0100
Message-ID: <CAOFm3uFkkydWBT9N72ax1oeJs=J2A_s-VbaAW1P5WQopBjw_tA@mail.gmail.com>
References: <20180214200906.31509-1-jernej.skrabec@siol.net> <20180214200906.31509-11-jernej.skrabec@siol.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180214200906.31509-11-jernej.skrabec@siol.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, sboyd@kernel.org, Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Neil Armstrong <narmstrong@baylibre.com>, Jose Abreu <Jose.Abreu@synopsys.com>, dri-devel <dri-devel@lists.freedesktop.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, linux-clk@vger.kernel.org, linux-sunx
List-Id: devicetree@vger.kernel.org

On Wed, Feb 14, 2018 at 9:09 PM, Jernej Skrabec <jernej.skrabec@siol.net> wrote:
> A83T has DW HDMI IP block with a custom PHY similar to Synopsys gen2
> HDMI PHY.
>
> Only video output was tested, while HW also supports audio and CEC.
> Support for them will be added later.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>

...

> --- /dev/null
> +++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
> @@ -0,0 +1,44 @@
> +// SPDX-License-Identifier: GPL-2.0+

This should be

/* SPDX-License-Identifier: GPL-2.0+ /* in a .h per [1]

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/license-rules.rst
-- 
Cordially
Philippe Ombredanne
