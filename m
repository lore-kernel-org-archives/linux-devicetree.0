From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 02/15] clk: rockchip: add clock id 24m dsi clock on rk3368
Date: Thu, 20 Dec 2018 15:37:54 -0600
Message-ID: <20181220213754.GA10095@bogus>
References: <20181217123650.6773-1-heiko@sntech.de>
 <20181217123650.6773-3-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181217123650.6773-3-heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, hjc@rock-chips.com, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, 17 Dec 2018 13:36:37 +0100, Heiko Stuebner wrote:
> Needed as input for the dsi controller.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  include/dt-bindings/clock/rk3368-cru.h | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
