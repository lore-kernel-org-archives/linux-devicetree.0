From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 19/21] drm/sun4i: Add compatible for the A10s pipeline
Date: Mon, 22 May 2017 19:33:12 -0500
Message-ID: <20170523003312.33xdw4r3ngek4fot@rob-hp-laptop>
References: <cover.463df61c38224ecbfb5bf1cf192deeb63718b693.1495006350.git-series.maxime.ripard@free-electrons.com>
 <d1bc2420845061a9c057d47a5556c621f8bcd025.1495006350.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d1bc2420845061a9c057d47a5556c621f8bcd025.1495006350.git-series.maxime.ripard@free-electrons.com>
Sender: linux-clk-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
List-Id: devicetree@vger.kernel.org

On Wed, May 17, 2017 at 09:40:48AM +0200, Maxime Ripard wrote:
> The A10s has a slightly different display pipeline than the A13, with an
> HDMI controller.
> 
> Add a compatible for it.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
>  Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt | 1 +
>  drivers/gpu/drm/sun4i/sun4i_drv.c                             | 1 +
>  2 files changed, 2 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
