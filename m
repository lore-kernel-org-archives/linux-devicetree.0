From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [RFC next v1 3/5] net: stmmac: use GPIO descriptors in
 stmmac_mdio_reset
Date: Sun, 9 Jun 2019 22:52:45 +0200
Message-ID: <20190609205245.GC8247@lunn.ch>
References: <20190609180621.7607-1-martin.blumenstingl@googlemail.com>
 <20190609180621.7607-4-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190609180621.7607-4-martin.blumenstingl@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: netdev@vger.kernel.org, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linus.walleij@linaro.org, bgolaszewski@baylibre.com, peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com, devicetree@vger.kernel.org, narmstrong@baylibre.com, khilman@baylibre.com, linux-kernel@vger.kernel.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

> +		struct gpio_desc *reset_gpio;
> +
>  		if (data->reset_gpio < 0) {
>  			struct device_node *np = priv->device->of_node;
>  
> -			data->reset_gpio = of_get_named_gpio(np,
> -						"snps,reset-gpio", 0);
> -			if (data->reset_gpio < 0)
> -				return 0;
> +			reset_gpio = devm_gpiod_get_optional(priv->device,
> +							     "snps,reset",
> +							     GPIOD_OUT_LOW);
> +			if (IS_ERR(reset_gpio))
> +				return PTR_ERR(reset_gpio);
>  
> -			data->active_low = of_property_read_bool(np,
> -						"snps,reset-active-low");

Hi Martin

I think you need to keep this here. You can then use it to decide how
to change gpio_desc to remove flags that should be ignored.

   Andrew
