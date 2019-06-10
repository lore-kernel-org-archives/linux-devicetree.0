From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [RFC next v1 0/5] stmmac: honor the GPIO flags for the PHY reset
 GPIO
Date: Mon, 10 Jun 2019 15:25:46 +0200
Message-ID: <20190610132546.GE8247@lunn.ch>
References: <20190609180621.7607-1-martin.blumenstingl@googlemail.com>
 <20190609204510.GB8247@lunn.ch>
 <20190610114700.tymqzzax334ahtz4@flea>
 <CAFBinCCs5pa1QmaV32Dk9rOADKGXXFpZsSK=LUk4CGWMrG5VUQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAFBinCCs5pa1QmaV32Dk9rOADKGXXFpZsSK=LUk4CGWMrG5VUQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, netdev@vger.kernel.org, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linus.walleij@linaro.org, bgolaszewski@baylibre.com, peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com, devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com, linux-kernel@vger.kernel.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

> if anyone else (just like me) doesn't know about it, there are generic
> bindings defined here: [0]
> 
> I just tested this on my X96 Max by defining the following properties
> inside the PHY node:
>   reset-delay-us = <10000>;
>   reset-assert-us = <10000>;
>   reset-deassert-us = <10000>;
>   reset-gpios = <&gpio GPIOZ_15 (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN)>;
> 
> that means I don't need any stmmac patches which seems nice.
> instead I can submit a patch to mark the snps,reset-gpio properties in
> the dt-bindings deprecated (and refer to the generic bindings instead)
> what do you think?

Hi Martin

I know Linus wants to replace all users of old GPIO numbers with gpio
descriptors. So your patches have value, even if you don't need them.

One other things to watch out for. We have generic code at two
levels. Either the GPIO is per PHY, and the properties should be in
the PHY node, or the reset is for all PHYs of an MDIO bus, and then
the properties should be in the MDIO node.

    Andrew
