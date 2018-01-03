From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 02/11] clk: sunxi-ng: a83t: Add M divider to TCON1 clock
Date: Wed, 3 Jan 2018 13:46:14 +0800
Message-ID: <CAGb2v64x8UqBNc1asw0oiudwLoebp0yGomY9W9LbnCTKW-HViQ@mail.gmail.com>
References: <20171230210203.24115-1-jernej.skrabec@siol.net> <20171230210203.24115-3-jernej.skrabec@siol.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20171230210203.24115-3-jernej.skrabec@siol.net>
Sender: linux-clk-owner@vger.kernel.org
To: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, Archit Taneja <architt@codeaurora.org>, a.hajda@samsung.com, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Jose.Abreu@synopsys.com, Neil Armstrong <narmstrong@baylibre.com>, dri-devel <dri-devel@lists.freedesktop.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: devicetree@vger.kernel.org

On Sun, Dec 31, 2017 at 5:01 AM, Jernej Skrabec <jernej.skrabec@siol.net> wrote:
> TCON1 also has M divider, contrary to TCON0.
>
> Fixes: 05359be1176b ("clk: sunxi-ng: Add driver for A83T CCU")
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>

Added "And the mux is only 2 bits wide, instead of 3." to the commit
message and applied.

ChenYu
