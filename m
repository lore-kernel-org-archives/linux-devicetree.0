From: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH RFC 2/2] regulator: twl: Re-add clk32kg to get wifi working
Date: Mon, 28 Jul 2014 18:27:53 -0700
Message-ID: <20140729012753.4906.94396@quantum>
References: <1405338655-18415-1-git-send-email-sassmann@kpanic.de>
 <1405338655-18415-3-git-send-email-sassmann@kpanic.de>
 <20140714120051.GF6800@sirena.org.uk> <53C3C77F.7080208@kpanic.de>
 <20140714181338.GR6800@sirena.org.uk> <53C525A2.8080609@kpanic.de>
 <20140716212340.GZ17528@sirena.org.uk> <53D12044.1060500@kpanic.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53D12044.1060500-llIHtaV5axyzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Assmann <sassmann-llIHtaV5axyzQB+pC5nmwQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Quoting Stefan Assmann (2014-07-24 08:03:32)
> +#define to_twl6030_desc(_hw) container_of(_hw, struct twl6030_desc, hw)
> +
> +static int twl6030_clk32kg_enable(struct clk_hw *hw)
> +{
> +       struct twl6030_desc *desc = to_twl6030_desc(hw);
> +       int ret;
> +
> +       ret = twl_i2c_write_u8(TWL_MODULE_PM_RECEIVER,
> +                              TWL6030_GRP_CON << TWL6030_CFG_STATE_GRP_SHIFT |
> +                              TWL6030_CFG_STATE_ON,
> +                              TWL6030_PM_RECEIVER_CLK32KG_CFG_STATE);
> +       if (ret == 0)
> +               desc->enabled = true;
> +
> +       return ret;
> +}
> +void twl6030_clk32kg_disable(struct clk_hw *hw)
> +{
> +       struct twl6030_desc *desc = to_twl6030_desc(hw);
> +
> +       twl_i2c_write_u8(TWL_MODULE_PM_RECEIVER,
> +                        TWL6030_GRP_CON << TWL6030_CFG_STATE_GRP_SHIFT |
> +                        TWL6030_CFG_STATE_OFF,
> +                        TWL6030_PM_RECEIVER_CLK32KG_CFG_STATE);
> +       desc->enabled = false;
> +}
> +
> +static int twl6030_clk32kg_is_enabled(struct clk_hw *hw)
> +{
> +       struct twl6030_desc *desc = to_twl6030_desc(hw);
> +
> +       return desc->enabled;
> +}
> +
> +static const struct clk_ops twl6030_clk32kg_ops = {
> +       .enable         = twl6030_clk32kg_enable,
> +       .disable        = twl6030_clk32kg_disable,
> +       .is_enabled     = twl6030_clk32kg_is_enabled,
> +};

All three above need to be converted from {en|dis}able to {un}prepare.
The reason is that clk_enable/clk_disable must not sleep and of course
i2c transactions might do just that.

Please Cc me on the next version :-)

Regards,
Mike
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
