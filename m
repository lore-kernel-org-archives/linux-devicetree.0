From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: add bindings for px30 clock
 controller
Date: Wed, 20 Jun 2018 12:14:11 -0600
Message-ID: <20180620181411.GA1689@rob-hp-laptop>
References: <1529029011-15021-1-git-send-email-zhangqing@rock-chips.com>
 <1529029011-15021-2-git-send-email-zhangqing@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1529029011-15021-2-git-send-email-zhangqing@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: heiko@sntech.de, sboyd@kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, cl@rock-chips.com, xxx@rock-chips.com, xf@rock-chips.com, huangtao@rock-chips.com
List-Id: devicetree@vger.kernel.org

On Fri, Jun 15, 2018 at 10:16:48AM +0800, Elaine Zhang wrote:
> Add devicetree bindings for Rockchip cru which found on
> Rockchip SoCs.
> 
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> ---
>  .../bindings/clock/rockchip,px30-cru.txt           | 66 ++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/rockchip,px30-cru.txt

Reviewed-by: Rob Herring <robh@kernel.org>
