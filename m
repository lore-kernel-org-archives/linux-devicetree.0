From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 01/15] clk: rockchip: add clock ids for dphy rx and tx
 channels on rk3368
Date: Thu, 20 Dec 2018 15:37:35 -0600
Message-ID: <20181220213735.GA9546@bogus>
References: <20181217123650.6773-1-heiko@sntech.de>
 <20181217123650.6773-2-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181217123650.6773-2-heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org, hjc@rock-chips.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh+dt@kernel.org, mark.rutland@arm.com, architt@codeaurora.org, a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, linux-clk@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org

On Mon, 17 Dec 2018 13:36:36 +0100, Heiko Stuebner wrote:
> Add the clock ids so that they can be exported from the clock driver
> and referenced in the rk3368 devicetree.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  include/dt-bindings/clock/rk3368-cru.h | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
