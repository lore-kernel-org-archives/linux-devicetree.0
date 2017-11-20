From: Rob Herring <robh@kernel.org>
Subject: Re: [RFC PATCH 1/3] dt-bindings: pinctrl: sunxi: document new
 generic binding
Date: Mon, 20 Nov 2017 12:52:12 -0600
Message-ID: <20171120185212.h2v2ewslxpl7q23l@rob-hp-laptop>
References: <20171113012523.2328-1-andre.przywara@arm.com>
 <20171113012523.2328-2-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171113012523.2328-2-andre.przywara@arm.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, linux-gpio@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Icenowy Zheng <icenowy@aosc.xyz>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 13, 2017 at 01:25:21AM +0000, Andre Przywara wrote:
> So far all the Allwinner pinctrl drivers provided a table in the
> kernel to describe all the pins and the link between the pinctrl functions
> names (strings) and their respective mux values (register values).
> 
> Extend the binding to put those mappings in the DT, so that any SoC can
> describe its pinctrl and GPIO data fully there instead of relying on
> tables.
> This uses a generic compatible name, to be prepended with an SoC
> specific name in the node.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../bindings/pinctrl/allwinner,sunxi-pinctrl.txt   | 58 ++++++++++++++++++++++
>  1 file changed, 58 insertions(+)

I'm leaving this one to Linus...

Generally, this has not been the direction we've wanted to go. What 
makes this unique to Allwinner?

Rob
