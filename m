From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v2 05/12] drm/bridge/synopsys: dw-hdmi: Add deinit callback
Date: Fri, 12 Jan 2018 14:12:16 +0800
Message-ID: <CAGb2v677HxKD2d+Jqsu7U5OuOCtFGf0u-1r=ewMrD3pu8B8YFQ@mail.gmail.com>
References: <20180110192512.19684-1-jernej.skrabec@siol.net> <20180110192512.19684-6-jernej.skrabec@siol.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20180110192512.19684-6-jernej.skrabec@siol.net>
Sender: linux-clk-owner@vger.kernel.org
To: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Archit Taneja <architt@codeaurora.org>, a.hajda@samsung.com, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Jose.Abreu@synopsys.com, Neil Armstrong <narmstrong@baylibre.com>, dri-devel <dri-devel@lists.freedesktop.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 11, 2018 at 3:25 AM, Jernej Skrabec <jernej.skrabec@siol.net> wrote:
> Some SoCs, like Allwinner A83T, have to do additional cleanup when
> HDMI driver unloads. When using DW HDMI through DRM bridge API, there is
> no place to store driver's private data so it can be accessed in unbind
> function. Because of that, add deinit function which is called at the
> very end, so drivers can do a proper cleanup.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>

8242ecbd597d ("drm/bridge/synopsys: stop clobbering drvdata"), which is
already in drm-misc-next, is a much saner solution. :)

ChenYu
