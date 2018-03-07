From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 04/16] clk: sunxi-ng: h3: h5: export CLK_PLL_VIDEO
Date: Wed, 7 Mar 2018 13:36:25 -0600
Message-ID: <20180307193625.twmxfo3fiy4sjeuk@rob-hp-laptop>
References: <20180301213442.16677-1-jernej.skrabec@siol.net>
 <20180301213442.16677-5-jernej.skrabec@siol.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180301213442.16677-5-jernej.skrabec@siol.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: maxime.ripard@free-electrons.com, wens@csie.org, airlied@linux.ie, mark.rutland@arm.com, mturquette@baylibre.com, sboyd@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

On Thu, Mar 01, 2018 at 10:34:30PM +0100, Jernej Skrabec wrote:
> CLK_PLL_VIDEO needs to be referenced in HDMI DT entry as a possible
> PHY clock parent.
> 
> Export it so it can be used later in DT.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  drivers/clk/sunxi-ng/ccu-sun8i-h3.h      | 4 +++-
>  include/dt-bindings/clock/sun8i-h3-ccu.h | 2 ++
>  2 files changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>
