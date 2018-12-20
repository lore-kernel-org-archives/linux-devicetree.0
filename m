From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 07/15] drm/rockchip: dw-mipi-dsi: add support for
 rk3368-variant
Date: Thu, 20 Dec 2018 15:42:00 -0600
Message-ID: <20181220214200.GA15833@bogus>
References: <20181217123650.6773-1-heiko@sntech.de>
 <20181217123650.6773-8-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181217123650.6773-8-heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org, hjc@rock-chips.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh+dt@kernel.org, mark.rutland@arm.com, architt@codeaurora.org, a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, linux-clk@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org

On Mon, 17 Dec 2018 13:36:42 +0100, Heiko Stuebner wrote:
> Add the compatible and grf values and allow the driver to also
> not select a specific crtc input on systems with only one vop.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  .../display/rockchip/dw_mipi_dsi_rockchip.txt |  1 +
>  .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 25 +++++++++++++++++--
>  2 files changed, 24 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
