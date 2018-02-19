From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 5/8] dt-bindings: allow optional phys in Rockchip
 dw_hdmi binding
Date: Mon, 19 Feb 2018 14:26:43 -0600
Message-ID: <20180219202643.mmngucoajdc6kiis@rob-hp-laptop>
References: <20180216204158.29839-1-heiko@sntech.de>
 <20180216204158.29839-6-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180216204158.29839-6-heiko@sntech.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: mark.rutland@arm.com, Jose.Abreu@synopsys.com, architt@codeaurora.org, algea.cao@rock-chips.com, devicetree@vger.kernel.org, airlied@linux.ie, hjc@rock-chips.com, dri-devel@lists.freedesktop.org, kishon@ti.com, a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, zhengyang@rock-chips.com
List-Id: devicetree@vger.kernel.org

On Fri, Feb 16, 2018 at 09:41:55PM +0100, Heiko Stuebner wrote:
> Some newer Rockchip SoCs use an Innosilicon hdmiphy accessed via general
> mmio, so allow these to be referenced via the regular phy interfaces
> and therefore add optional phy-related properties to the binding.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
