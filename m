From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: doc: Reflect new NVMEM
 of_get_mac_address behaviour
Date: Sat, 27 Apr 2019 09:56:35 -0700
Message-ID: <f335fb31-ed1b-efd1-9cd3-a88b4a7fadf0@gmail.com>
References: <1556320002-26213-1-git-send-email-ynezz@true.cz>
 <1556320002-26213-3-git-send-email-ynezz@true.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1556320002-26213-3-git-send-email-ynezz@true.cz>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Petr_=c5=a0tetiar?= <ynezz@true.cz>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Fugang Duan <fugang.duan@nxp.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, Yisen Zhuang <yisen.zhuang@huawei.com>, Salil Mehta <salil.mehta@huawei.com>, Woojung Huh <woojung.huh@microchip.com>, Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, Neil Armstrong <narmstrong@baylibre.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Jass
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Frank Rowand <frowand.list@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Alban Bedel <albeu@free.fr>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-oxnas@groups.io, linux-stm32@st-md-mailman.stormreply.com, linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org



On 4/26/2019 4:06 PM, Petr Štetiar wrote:
> As of_get_mac_address now supports NVMEM under the hood, we should
> update the bindings documentation with the new nvmem-cell* properties.
> While at it, fix also other missing properties supported by
> of_get_mac_address.
> 
> Signed-off-by: Petr Štetiar <ynezz@true.cz>

While I appreciate your effort in making the bindings up to date and
consistent, this does really scale well and is an error prone exercise,
how about consolidating all MAC address related properties into the
ethernet.txt document like you just did and update all bindings to
indicate something along the lines of:

For all other standard Ethernet related properties, please refer to
ethernet.txt or something like that?
-- 
Florian
