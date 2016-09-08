From: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Subject: Re: [PATCH 4/7] phy: meson: add USB2 PHY support for Meson8b and GXBB
Date: Thu, 8 Sep 2016 20:40:58 +0100
Message-ID: <7d631565-287c-ab38-c152-d65b5ace1e0e@codethink.co.uk>
References: <20160904213152.25837-1-martin.blumenstingl@googlemail.com>
 <20160904213152.25837-5-martin.blumenstingl@googlemail.com>
 <m260q6jibf.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <m260q6jibf.fsf-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, kishon-l0cyMroinI0@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/09/16 20:35, Kevin Hilman wrote:
> Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> writes:
>
>> This is a new driver for the USB PHY found in Meson8b and GXBB SoCs.
>>
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
>> Signed-off-by: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>
> I tested this on meson-gxbb-p200 with USB host and a mass storage
> device.
>
> Tested-by: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>
> A minor question/comment below, for you and for Kishon...
>
> [...]
>
>> +static int phy_meson_usb2_probe(struct platform_device *pdev)
>> +{
>> +	struct phy_meson_usb2_priv *priv;
>> +	struct resource *res;
>> +	struct phy *phy;
>> +	struct phy_provider *phy_provider;
>> +	int ret;
>> +
>> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
>> +	if (!priv)
>> +		return -ENOMEM;
>> +
>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	priv->regs = devm_ioremap_resource(&pdev->dev, res);
>> +	if (IS_ERR(priv->regs))
>> +		return PTR_ERR(priv->regs);
>> +
>> +	priv->clk_usb_general = devm_clk_get(&pdev->dev, "usb_general");
>> +	if (IS_ERR(priv->clk_usb_general))
>> +		return PTR_ERR(priv->clk_usb_general);
>> +
>> +	priv->clk_usb = devm_clk_get(&pdev->dev, "usb");
>> +	if (IS_ERR(priv->clk_usb))
>> +		return PTR_ERR(priv->clk_usb);
>> +
>> +	priv->dr_mode = of_usb_get_dr_mode_by_phy(pdev->dev.of_node, -1);
>> +	if (priv->dr_mode == USB_DR_MODE_UNKNOWN) {
>> +		dev_err(&pdev->dev,
>> +			"missing dual role configuration of the controller\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	phy = devm_phy_create(&pdev->dev, NULL, &phy_meson_usb2_ops);
>> +	if (IS_ERR(phy)) {
>> +		dev_err(&pdev->dev, "failed to create PHY\n");
>> +		return PTR_ERR(phy);
>> +	}
>> +
>> +	if (usb_reset_refcnt++ == 0) {
>> +		ret = device_reset(&pdev->dev);
>> +		if (ret) {
>> +			dev_err(&phy->dev, "Failed to reset USB PHY\n");
>> +			return ret;
>> +		}
>> +	}
>
> The ref count + reset here looks like something that could/should be
> handled in a runtime PM callback.
>
> IOW, there should be a pm_runtime_get_sync() here, and in the
> ->runtime_resume() callback, the device_reset() would be called.
> Runtime PM does the refcounting, and only calls ->runtime_resume() on
> the 0 -> 1 transition.
>
> This isn't a big deal for now, so I'll let Kishon decide, but using
> runtime PM from the start will help enabling other PM features later.

I agree, pm_runtime would probably be the best place to handle >1
device with shared items such as reset.

The version I wrote, I simply enabled the clocks and reset the device
when probed to work around the shared reset.


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
