From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 05/15] drm/rockchip: dw_hdmi: add support for rk3368
Date: Thu, 20 Dec 2018 15:39:15 -0600
Message-ID: <20181220213915.GA10254@bogus>
References: <20181217123650.6773-1-heiko@sntech.de>
 <20181217123650.6773-6-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181217123650.6773-6-heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, hjc@rock-chips.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, mark.rutland@arm.com, architt@codeaurora.org, a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 17, 2018 at 01:36:40PM +0100, Heiko Stuebner wrote:
> The rk3368 only has one vop block and thus the dw_hdmi does not need to
> do the source selection.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  .../display/rockchip/dw_hdmi-rockchip.txt         |  1 +

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c       | 15 +++++++++++++++
>  2 files changed, 16 insertions(+)
