From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 12/15] clk: sunxi-ng: a64: Add min and max rate for PLL_MIPI
Date: Wed, 24 Oct 2018 01:49:40 -0700
Message-ID: <154037098047.53599.11415144740017316303@swboyd.mtv.corp.google.com>
References: <20181023155035.9101-1-jagan@amarulasolutions.com>
 <20181023155035.9101-13-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181023155035.9101-13-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>, Chen-Yu Tsai <wens@csie.org>, David Airlie <airlied@linux.ie>, Icenowy Zheng <icenowy@aosc.io>, Jernej Skrabec <jernej.skrabec@siol.net>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Michael Trimarchi <michael@amarulasolutions.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Vasily Khoruzhick <anarsoul@gmail.com>, Will Deacon <will.deacon@arm.com>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Cc: Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

Quoting Jagan Teki (2018-10-23 08:50:32)
> A64 manual say PLL_MIPI rates are 500MHz to 1.4GHz, but
> using minimum 500MHz can't release the clock and which
> is not working.
> =

> So use working minimum rate as 300MHz which is tested on
> Bananapi DSI panel.

That's weird, but OK.

> =

> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
