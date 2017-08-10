From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/5] dt-bindings: phy-rockchip-inno-usb2: add
 companion grf quirk
Date: Thu, 10 Aug 2017 12:05:08 -0500
Message-ID: <20170810170508.pwf35mud4ffnrzzd@rob-hp-laptop>
References: <1501747753-6983-1-git-send-email-frank.wang@rock-chips.com>
 <1501747753-6983-3-git-send-email-frank.wang@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1501747753-6983-3-git-send-email-frank.wang@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Wang <frank.wang@rock-chips.com>
Cc: heiko@sntech.de, kishon@ti.com, mark.rutland@arm.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, huangtao@rock-chips.com, william.wu@rock-chips.com, daniel.meng@rock-chips.com, kever.yang@rock-chips.com, andy.yan@rock-chips.com, wmc@rock-chips.com
List-Id: devicetree@vger.kernel.org

On Thu, Aug 03, 2017 at 04:09:10PM +0800, Frank Wang wrote:
> Add rockchip,usbgrf and rockchip,companion_grf_quirk to support
> the registers of usb-phy that are distributed in grf and usbgrf
> on some special Rockchip SoCs (e.g RV1108).
> 
> Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
> ---
>  Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt b/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt
> index 84d59b0..ddf868a 100644
> --- a/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt
> +++ b/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt
> @@ -18,6 +18,10 @@ Optional properties:
>  		 usb-phy output 480m and xin24m.
>  		 Refer to clk/clock-bindings.txt for generic clock
>  		 consumer properties.
> + - rockchip,usbgrf : phandle to the syscon managing the "usb general
> +		 register files".
> + - rockchip,companion_grf_quirk : when set driver will request
> +		 "rockchip,usbgrf" phandle as one companion-grf.

Why isn't presence of rockchip,usbgrf or being implied by an SoC 
specific compatible string enough? 

In any case, use '-' rather than '_'.

>  
>  Required nodes : a sub-node is required for each port the phy provides.
>  		 The sub-node name is used to identify host or otg port,
> -- 
> 2.0.0
> 
> 
