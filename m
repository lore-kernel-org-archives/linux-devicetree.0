From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v2 3/20] clk: sunxi-ng: div: Switch to divider_round_rate
Date: Thu, 4 May 2017 11:20:27 +0800
Message-ID: <CAGb2v64d2VXTuqHLv6o8M35+RNa8R8BH+9m8N+ATe81gtu4ZJA@mail.gmail.com>
References: <cover.d697f34bb7b0605c5e76cbc4167a64453e5e0984.1493812478.git-series.maxime.ripard@free-electrons.com>
 <8ea7c8c0ac01fe06f7ded94e03532a1838f2bf8f.1493812478.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <8ea7c8c0ac01fe06f7ded94e03532a1838f2bf8f.1493812478.git-series.maxime.ripard@free-electrons.com>
Sender: linux-clk-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-clk <linux-clk@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: devicetree@vger.kernel.org

On Wed, May 3, 2017 at 7:59 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> divider_round_rate already evaluates changing the parent rate if

  ^^^ Might want to update this, as you are now using the new function
      you added in patch 1.

> CLK_SET_RATE_PARENT is set. Now that we can do that on muxes too, let's
> just use it.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Otherwise,

Acked-by: Chen-Yu Tsai <wens@csie.org>
