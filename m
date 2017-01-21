From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 6/6] dt-bindings: mt8173-mtu3: add reference clock
Date: Sat, 21 Jan 2017 14:11:55 -0600
Message-ID: <20170121201155.cqcihopdc3kjyfi6@rob-hp-laptop>
References: <1484719707-12107-1-git-send-email-chunfeng.yun@mediatek.com>
 <1484719707-12107-6-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1484719707-12107-6-git-send-email-chunfeng.yun@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 18, 2017 at 02:08:27PM +0800, Chunfeng Yun wrote:
> add a reference clock for compatibility

Why? This block suddenly has 2 clocks instead of 1?

> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  .../devicetree/bindings/usb/mt8173-mtu3.txt        |   10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/mt8173-mtu3.txt b/Documentation/devicetree/bindings/usb/mt8173-mtu3.txt
> index e049d19..8c976cd 100644
> --- a/Documentation/devicetree/bindings/usb/mt8173-mtu3.txt
> +++ b/Documentation/devicetree/bindings/usb/mt8173-mtu3.txt
> @@ -10,7 +10,7 @@ Required properties:
>   - vusb33-supply : regulator of USB avdd3.3v
>   - clocks : a list of phandle + clock-specifier pairs, one for each
>  	entry in clock-names
> - - clock-names : must contain "sys_ck" for clock of controller;
> + - clock-names : must contain "sys_ck" and "ref_ck" for clock of controller;
>  	"wakeup_deb_p0" and "wakeup_deb_p1" are optional, they are
>  	depends on "mediatek,enable-wakeup"
>   - phys : a list of phandle + phy specifier pairs
> @@ -56,10 +56,10 @@ ssusb: usb@11271000 {
>  	phys = <&phy_port0 PHY_TYPE_USB3>,
>  	       <&phy_port1 PHY_TYPE_USB2>;
>  	power-domains = <&scpsys MT8173_POWER_DOMAIN_USB>;
> -	clocks = <&topckgen CLK_TOP_USB30_SEL>,
> +	clocks = <&topckgen CLK_TOP_USB30_SEL>, <&clk26m>,
>  		 <&pericfg CLK_PERI_USB0>,
>  		 <&pericfg CLK_PERI_USB1>;
> -	clock-names = "sys_ck",
> +	clock-names = "sys_ck", "ref_ck",
>  		      "wakeup_deb_p0",
>  		      "wakeup_deb_p1";
>  	vusb33-supply = <&mt6397_vusb_reg>;
> @@ -79,8 +79,8 @@ ssusb: usb@11271000 {
>  		reg-names = "mac";
>  		interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_LOW>;
>  		power-domains = <&scpsys MT8173_POWER_DOMAIN_USB>;
> -		clocks = <&topckgen CLK_TOP_USB30_SEL>;
> -		clock-names = "sys_ck";
> +		clocks = <&topckgen CLK_TOP_USB30_SEL>, <&clk26m>;
> +		clock-names = "sys_ck", "ref_ck";
>  		vusb33-supply = <&mt6397_vusb_reg>;
>  		status = "disabled";
>  	};
> -- 
> 1.7.9.5
> 
