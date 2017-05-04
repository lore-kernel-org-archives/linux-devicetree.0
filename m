From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v2 6/20] clk: sunxi-ng: mux: Change pre-divider
 application function prototype
Date: Thu, 4 May 2017 11:27:13 +0800
Message-ID: <CAGb2v672x244T9OWg10Y0+kithOOxn9p1WFipmovDqjZOc4WaA@mail.gmail.com>
References: <cover.d697f34bb7b0605c5e76cbc4167a64453e5e0984.1493812478.git-series.maxime.ripard@free-electrons.com>
 <b7fab9142ae318f9188b93dfba0b6bd2b530a514.1493812478.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <b7fab9142ae318f9188b93dfba0b6bd2b530a514.1493812478.git-series.maxime.ripard@free-electrons.com>
Sender: linux-clk-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-clk <linux-clk@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: devicetree@vger.kernel.org

On Wed, May 3, 2017 at 7:59 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> The current function name is a bit confusing, and doesn't really allow to
> create an explicit function to reverse the operation.
>
> We also for now change the parent rate through a pointer, while we don't
> return anything.
>
> In order to be less confusing, and easier to use for downstream users,
> change the function name to something hopefully clearer, and return the
> adjusted rate instead of changing the pointer.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>
