From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 2/4 RFCv2] net: dsa: Add bindings for Realtek SMI DSAs
Date: Tue, 29 May 2018 12:30:41 -0700
Message-ID: <baae8174-8b64-6de5-6e87-eb51b8c769f7@gmail.com>
References: <20180528174752.6806-1-linus.walleij@linaro.org>
 <20180528174752.6806-3-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180528174752.6806-3-linus.walleij@linaro.org>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Cc: netdev@vger.kernel.org, openwrt-devel@lists.openwrt.org, LEDE Development List <lede-dev@lists.infradead.org>, =?UTF-8?B?QW50dGkgU2VwcMOkbMOk?= <a.seppala@gmail.com>, Roman Yeryomin <roman@advem.lv>, Colin Leitner <colin.leitner@googlemail.com>, Gabor Juhos <juhosg@openwrt.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 05/28/2018 10:47 AM, Linus Walleij wrote:
> The Realtek SMI family is a set of DSA chips that provide
> switching in routers. This binding just follows the pattern
> set by other switches but with the introduction of an embedded
> irqchip to demux and handle the interrupts fired by the single
> line from the chip.
> 
> This interrupt construction is similar to how we handle
> interrupt controllers inside PCI bridges etc.
> 
> Cc: Antti Seppälä <a.seppala@gmail.com>
> Cc: Roman Yeryomin <roman@advem.lv>
> Cc: Colin Leitner <colin.leitner@googlemail.com>
> Cc: Gabor Juhos <juhosg@openwrt.org>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

> +
> +	mdio {
> +		compatible = "realtek,smi-mdio", "dsa-mdio";

You should drop the "dsa-mdio" compatible string here since it both non
documented and not matched either.

Other than that, this looks great, with that fixed:

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
