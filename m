From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v2 13/20] drm/sun4i: tcon: Change vertical total size
 computation inconsistency
Date: Thu, 4 May 2017 11:58:45 +0800
Message-ID: <CAGb2v66U9JzEr_xeifZGd9ws4uhHnYJAvsY9zmPArHFzn9LztQ@mail.gmail.com>
References: <cover.d697f34bb7b0605c5e76cbc4167a64453e5e0984.1493812478.git-series.maxime.ripard@free-electrons.com>
 <745b9fc450798635d50f449473e9263ab3ace48e.1493812478.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <745b9fc450798635d50f449473e9263ab3ace48e.1493812478.git-series.maxime.ripard@free-electrons.com>
Sender: linux-clk-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-clk <linux-clk@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: devicetree@vger.kernel.org

On Wed, May 3, 2017 at 7:59 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> Both TCON channels need to have the resolution doubled, since the size the
> hardware is going to use is whatever we put in the register divided by two.
>
> However, we handle it differently for the two channels: in the channel 0,
> our register access macro does the multiplication of the value passed as
> paremeter, while in the channel 1, the macro doesn't do this, and we need
> to do it before calling it.
>
> Make this consistent by aligning the channel 0 with the channel 1
> behaviour.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>
