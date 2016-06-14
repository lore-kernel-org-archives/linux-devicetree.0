From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 1/2] Documentation: bindings: add dt documentation for
 Rockchip PCIe PHY
Date: Tue, 14 Jun 2016 10:27:46 -0700
Message-ID: <CAD=FV=Ubm8goQ4J=T11mWmAZrP+J7YYWdxACGjAhdsONyzPdKQ@mail.gmail.com>
References: <1465865072-25833-1-git-send-email-shawn.lin@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465865072-25833-1-git-send-email-shawn.lin@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Heiko Stuebner <heiko@sntech.de>, Wenrui Li <wenrui.li@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, Jun 13, 2016 at 5:44 PM, Shawn Lin <shawn.lin@rock-chips.com> wrote:
> This patch adds a binding that describes the Rockchip PCIe PHY
> found on Rockchip SoCs PCIe interface.
>
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
>
> ---
>
> Changes in v2:
> - add clk and reset description
> - remove unit-address
>
>  .../devicetree/bindings/phy/rockchip-pcie-phy.txt  | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/rockchip-pcie-phy.txt
>
> diff --git a/Documentation/devicetree/bindings/phy/rockchip-pcie-phy.txt b/Documentation/devicetree/bindings/phy/rockchip-pcie-phy.txt
> new file mode 100644
> index 0000000..ad55c67
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/rockchip-pcie-phy.txt
> @@ -0,0 +1,32 @@
> +Rockchip PCIE PHY
> +-----------------------
> +
> +Required properties:
> + - compatible: rockchip,rk3399-pcie-phy
> + - #phy-cells: must be 0
> + - clocks: Must contain an entry in clock-names.
> +       See ../clocks/clock-bindings.txt for details.
> + - clock-names: Must be "refclk"
> + - resets: Must contain an entry in reset-names.
> +       See ../reset/reset.txt for details.
> + - reset-names: Must be "phy"
> +
> +Example:
> +
> +grf: syscon@ff770000 {
> +       compatible = "rockchip,rk3399-grf", "syscon", "simple-mfd";
> +       #address-cells = <1>;
> +       #size-cells = <1>;
> +
> +       ...
> +
> +       pcie-phy: phy {

Just calling this node "phy" isn't a good idea.  There will be
multiple PHYs under the GRF and they can't all have a subnode named
"phy".

Also: at least in Rockchip device trees usually aliases use
underscores whereas node names use dashes.  I'm not actually sure what
the official device tree policy is on this, but it's what I've seen
done.  So this should actually be:

pcie_phy: pcie-phy {
