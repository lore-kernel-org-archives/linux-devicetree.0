From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 15/27] drm/sun4i: Not all DW HDMI controllers has
 scrambled addresses
Date: Wed, 12 Sep 2018 20:25:44 +0800
Message-ID: <CAGb2v66qrZG=RH9SYs7ZeZdhfcq+4sT47Y1dDQaeS1QBcEZXvg@mail.gmail.com>
References: <20180902072643.4917-1-jernej.skrabec@siol.net> <20180902072643.4917-16-jernej.skrabec@siol.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180902072643.4917-16-jernej.skrabec@siol.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Mark Rutland <mark.rutland@arm.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>, Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: devicetree@vger.kernel.org

On Sun, Sep 2, 2018 at 3:27 PM Jernej Skrabec <jernej.skrabec@siol.net> wrote:
>
> Currently supported Allwinner SoCs with DW HDMI controller have
> scrambled addresses and read lock. However, that is not true in general.
> For example, A80 and H6 have normal addresses and normal read access.
>
> Move code for unscrambling addresses and unlocking read access to it's
> own function and call it from init function.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
