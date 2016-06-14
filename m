From: Rob Herring <robh@kernel.org>
Subject: Re: [v2 PATCH 1/4] Documentation: bindings: add dt doc for Rockchip
 USB Type-C PHY
Date: Tue, 14 Jun 2016 17:51:28 -0500
Message-ID: <20160614225128.GA10606@rob-hp-laptop>
References: <1465810789-22303-1-git-send-email-zyw@rock-chips.com>
 <1465810789-22303-2-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1465810789-22303-2-git-send-email-zyw@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Zhong <zyw@rock-chips.com>
Cc: dianders@chromium.org, tfiga@chromium.org, heiko@sntech.de, yzq@rock-chips.com, groeck@chromium.org, linux-rockchip@lists.infradead.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 13, 2016 at 05:39:46PM +0800, Chris Zhong wrote:
> This patch adds a binding that describes the Rockchip USB Type-C PHY
> for rk3399
> 
> Signed-off-by: Chris Zhong <zyw@rock-chips.com>
> 
> ---
> 
> Changes in v2:
> - add some registers description
> 
> Changes in v1:
> - add extcon node description
> - move the registers in phy driver
> - remove the suffix of reset
> 
>  .../devicetree/bindings/phy/phy-rockchip-typec.txt | 77 ++++++++++++++++++++++
>  1 file changed, 77 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt
> 
> diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt b/Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt
> new file mode 100644
> index 0000000..430920c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt
> @@ -0,0 +1,77 @@
> +* ROCKCHIP type-c PHY
> +---------------------
> +
> +Required properties:
> + - compatible : should be "rockchip,rk3399-typec-phy0" or
> +			 "rockchip,rk3399-typec-phy1"

Unless these blocks are different, these should be be same compat 
string.

> + - reg: Address and length of the usb phy control register set
> + - rockchip,grf : phandle to the syscon managing the "general
> +   register files"
> + - clocks : phandle + clock specifier for the phy clocks
> + - clock-names : string, clock name, must be "tcpdcore", "tcpdphy_ref";
> + - resets : a list of phandle + reset specifier pairs
> + - reset-names : string reset name, must be:
> +		 "tcphy", "tcphy_pipe", "uphy_tcphy"
> + - #phy-cells : Must be 0.  See ./phy-bindings.txt for details.
> + - extcon : extcon specifier for the Power Delivery
> +
> +Note, there are 2 type-c phys for RK3399, and they are almost identical, except
> +these registers(description below), every register node contains 3 sections:
> +offset, enable bit, write mask bit.
> + - rockchip,typec_conn_dir : the register of type-c connector direction,

Don't use underscores in property names.

> +   for type-c phy0, it must be <0xe580 0 16>;
> +   for type-c phy1, it must be <0xe58c 0 16>;
> + - rockchip,usb3tousb2_en : the register of type-c force usb3 to usb2 enable
> +   control.
> +   for type-c phy0, it must be <0xe580 3 19>;
> +   for type-c phy1, it must be <0xe58c 3 19>;
> + - rockchip,external_psm : the register of type-c phy external psm clock
> +   selection.
> +   for type-c phy0, it must be <0xe588 14 30>;
> +   for type-c phy1, it must be <0xe594 14 30>;
> + - rockchip,pipe_status : the register of type-c phy pipe status.
> +   for type-c phy0, it must be <0xe5c0 0 0>;
> +   for type-c phy1, it must be <0xe5c0 16 16>;
> + - rockchip,uphy_dp_sel : the register of type-c phy selection for DP
> +   for type-c phy0, it must be <0x6268 19 19>;
> +   for type-c phy1, it must be <0x6268 3 19>;
