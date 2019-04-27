From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 2/4] dt-bindings: doc: Reflect new NVMEM
 of_get_mac_address behaviour
Date: Sat, 27 Apr 2019 18:39:23 +0200
Message-ID: <20190427163923.GC9816@lunn.ch>
References: <1556320002-26213-1-git-send-email-ynezz@true.cz>
 <1556320002-26213-3-git-send-email-ynezz@true.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1556320002-26213-3-git-send-email-ynezz@true.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Fugang Duan <fugang.duan@nxp.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, Yisen Zhuang <yisen.zhuang@huawei.com>, Salil Mehta <salil.mehta@huawei.com>, Woojung Huh <woojung.huh@microchip.com>, Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, Neil Armstrong <narmstrong@baylibre.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Jassi Brar <jaswinder.singh@linaro.org>
List-Id: devicetree@vger.kernel.org

> diff --git a/Documentation/devicetree/bindings/net/macb.txt b/Documentation/devicetree/bindings/net/macb.txt
> index 8b80515..92c5642 100644
> --- a/Documentation/devicetree/bindings/net/macb.txt
> +++ b/Documentation/devicetree/bindings/net/macb.txt
> @@ -26,15 +26,15 @@ Required properties:
>  	Optional elements: 'tsu_clk'
>  - clocks: Phandles to input clocks.
>  
> -Optional properties:
> -- nvmem-cells: phandle, reference to an nvmem node for the MAC address
> -- nvmem-cell-names: string, should be "mac-address" if nvmem is to be used
> -
>  Optional properties for PHY child node:
>  - reset-gpios : Should specify the gpio for phy reset
>  - magic-packet : If present, indicates that the hardware supports waking
>    up via magic packet.
>  - phy-handle : see ethernet.txt file in the same directory
> +- mac-address: See ethernet.txt in the same directory.
> +- local-mac-address: See ethernet.txt in the same directory.
> +- nvmem-cells: See ethernet.txt in the same directory.
> +- nvmem-cell-names: See ethernet.txt in the same directory.

This looks wrong. The MAC address is not a PHY property, so should not
be inside the PHY child node.

phy-handle is in the wrong place, but that is a separate problem.

	   Andrew
