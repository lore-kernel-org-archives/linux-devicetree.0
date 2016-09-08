From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 4/7] phy: meson: add USB2 PHY support for Meson8b and GXBB
Date: Thu, 08 Sep 2016 12:35:32 -0700
Message-ID: <m260q6jibf.fsf@baylibre.com>
References: <20160904213152.25837-1-martin.blumenstingl@googlemail.com>
 <20160904213152.25837-5-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160904213152.25837-5-martin.blumenstingl@googlemail.com>
 (Martin Blumenstingl's message of "Sun, 4 Sep 2016 23:31:49 +0200")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, kishon@ti.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, johnyoun@synopsys.com, will.deacon@arm.com, mturquette@baylibre.com, linux-usb@vger.kernel.org, sboyd@codeaurora.org, robh+dt@kernel.org, catalin.marinas@arm.com, carlo@caione.org, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
List-Id: devicetree@vger.kernel.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> This is a new driver for the USB PHY found in Meson8b and GXBB SoCs.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

I tested this on meson-gxbb-p200 with USB host and a mass storage
device.

Tested-by: Kevin Hilman <khilman@baylibre.com>

A minor question/comment below, for you and for Kishon...

[...]

> +static int phy_meson_usb2_probe(struct platform_device *pdev)
> +{
> +	struct phy_meson_usb2_priv *priv;
> +	struct resource *res;
> +	struct phy *phy;
> +	struct phy_provider *phy_provider;
> +	int ret;
> +
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	priv->regs = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(priv->regs))
> +		return PTR_ERR(priv->regs);
> +
> +	priv->clk_usb_general = devm_clk_get(&pdev->dev, "usb_general");
> +	if (IS_ERR(priv->clk_usb_general))
> +		return PTR_ERR(priv->clk_usb_general);
> +
> +	priv->clk_usb = devm_clk_get(&pdev->dev, "usb");
> +	if (IS_ERR(priv->clk_usb))
> +		return PTR_ERR(priv->clk_usb);
> +
> +	priv->dr_mode = of_usb_get_dr_mode_by_phy(pdev->dev.of_node, -1);
> +	if (priv->dr_mode == USB_DR_MODE_UNKNOWN) {
> +		dev_err(&pdev->dev,
> +			"missing dual role configuration of the controller\n");
> +		return -EINVAL;
> +	}
> +
> +	phy = devm_phy_create(&pdev->dev, NULL, &phy_meson_usb2_ops);
> +	if (IS_ERR(phy)) {
> +		dev_err(&pdev->dev, "failed to create PHY\n");
> +		return PTR_ERR(phy);
> +	}
> +
> +	if (usb_reset_refcnt++ == 0) {
> +		ret = device_reset(&pdev->dev);
> +		if (ret) {
> +			dev_err(&phy->dev, "Failed to reset USB PHY\n");
> +			return ret;
> +		}
> +	}

The ref count + reset here looks like something that could/should be
handled in a runtime PM callback.

IOW, there should be a pm_runtime_get_sync() here, and in the
->runtime_resume() callback, the device_reset() would be called.
Runtime PM does the refcounting, and only calls ->runtime_resume() on
the 0 -> 1 transition.

This isn't a big deal for now, so I'll let Kishon decide, but using
runtime PM from the start will help enabling other PM features later.

Kevin
