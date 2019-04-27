From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 2/4] dt-bindings: doc: Reflect new NVMEM
 of_get_mac_address behaviour
Date: Sat, 27 Apr 2019 18:31:27 +0200
Message-ID: <20190427163127.GB9816@lunn.ch>
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

> diff --git a/Documentation/devicetree/bindings/net/ethernet.txt b/Documentation/devicetree/bindings/net/ethernet.txt
> index 2974e63..1e2bc9a 100644
> --- a/Documentation/devicetree/bindings/net/ethernet.txt
> +++ b/Documentation/devicetree/bindings/net/ethernet.txt
> @@ -10,6 +10,8 @@ Documentation/devicetree/bindings/phy/phy-bindings.txt.
>    the boot program; should be used in cases where the MAC address assigned to
>    the device by the boot program is different from the "local-mac-address"
>    property;
> +- nvmem-cells: phandle, reference to an nvmem node for the MAC address
> +- nvmem-cell-names: string, should be "mac-address" if nvmem is to be used

You put the new values after local-mac-address and mac-address. That
suggests they are of lower priority. That conflicts with the current
patch. If you think NVMEM should take priority, please put the
properties first.

	   Andrew
