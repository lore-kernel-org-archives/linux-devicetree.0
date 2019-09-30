From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] phy: phy-rockchip-inno-usb2: add phy description for px30
Date: Mon, 30 Sep 2019 17:49:50 -0500
Message-ID: <20190930224950.GA32051@bogus>
References: <20190917082532.25479-1-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190917082532.25479-1-heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
Cc: kishon@ti.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-rockchip@lists.infradead.org, christoph.muellner@theobroma-systems.com, Heiko Stuebner <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org

On Tue, 17 Sep 2019 10:25:32 +0200, Heiko Stuebner wrote:
> The px30 soc from Rockchip shares the same register description as
> the rk3328, so can re-use its definitions.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt | 1 +
>  drivers/phy/rockchip/phy-rockchip-inno-usb2.c                    | 1 +
>  2 files changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
