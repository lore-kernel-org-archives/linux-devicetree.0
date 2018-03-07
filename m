From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/6] dt-bindings: phy-rockchip-typec: move extcon
 property to be optional.
Date: Wed, 7 Mar 2018 13:34:38 -0600
Message-ID: <20180307193438.fogti4jodn2jgsb5@rob-hp-laptop>
References: <20180301152515.20940-1-enric.balletbo@collabora.com>
 <20180301152515.20940-3-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180301152515.20940-3-enric.balletbo@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: kishon@ti.com, heiko@sntech.de, groeck@chromium.org, gwendal@chromium.org, kernel@collabora.com, vicencb@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 01, 2018 at 04:25:11PM +0100, Enric Balletbo i Serra wrote:
> The extcon property is used to detect the cable-state but some boards
> just connect the type-c phy to a regular USB-A connector without any
> power-delivery and thus no controller reporting the cable-state.
> So the extcon property is not really a required property, move it to be
> optional instead.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> ---
> 
> Changes in v2:
> - [2/6] Rewrite the justification as suggested by Heiko Stuebner.
> 
>  Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt | 2 ++
>  1 file changed, 2 insertions(+)

And extcon should be deprecated IMO.

Reviewed-by: Rob Herring <robh@kernel.org>
