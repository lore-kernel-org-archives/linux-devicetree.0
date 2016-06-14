From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v5 2/2] phy: rockchip-inno-usb2: add a new driver for
 Rockchip usb2phy
Date: Tue, 14 Jun 2016 07:52:13 -0700
Message-ID: <57601A1D.9020803@roeck-us.net>
References: <1465783810-18756-1-git-send-email-frank.wang@rock-chips.com>
 <1465783810-18756-3-git-send-email-frank.wang@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465783810-18756-3-git-send-email-frank.wang@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Wang <frank.wang@rock-chips.com>, heiko@sntech.de, dianders@chromium.org, groeck@chromium.org, jwerner@chromium.org, kishon@ti.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-rockchip@lists.infradead.org, xzy.xu@rock-chips.com, kever.yang@rock-chips.com, huangtao@rock-chips.com, william.wu@rock-chips.com
List-Id: devicetree@vger.kernel.org

On 06/12/2016 07:10 PM, Frank Wang wrote:
> The newer SoCs (rk3366, rk3399) take a different usb-phy IP block
> than rk3288 and before, and most of phy-related registers are also
> different from the past, so a new phy driver is required necessarily.
>
> Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
> ---
>

[ ... ]

> +
> +static int rockchip_usb2phy_resume(struct phy *phy)
> +{
> +	struct rockchip_usb2phy_port *rport = phy_get_drvdata(phy);
> +	struct rockchip_usb2phy *rphy = dev_get_drvdata(phy->dev.parent);
> +	int ret;
> +
> +	dev_dbg(&rport->phy->dev, "port resume\n");
> +
> +	ret = clk_prepare_enable(rphy->clk480m);
> +	if (ret)
> +		return ret;
> +
> +	ret = property_enable(rphy, &rport->port_cfg->phy_sus, false);
> +	if (ret)
> +		return ret;
> +
> +	rport->suspended = false;
> +	return 0;
> +}
> +
> +static int rockchip_usb2phy_suspend(struct phy *phy)
> +{
> +	struct rockchip_usb2phy_port *rport = phy_get_drvdata(phy);
> +	struct rockchip_usb2phy *rphy = dev_get_drvdata(phy->dev.parent);
> +	int ret;
> +
> +	dev_dbg(&rport->phy->dev, "port suspend\n");
> +
> +	ret = property_enable(rphy, &rport->port_cfg->phy_sus, true);
> +	if (ret)
> +		return ret;
> +
> +	rport->suspended = true;
> +	clk_disable_unprepare(rphy->clk480m);
> +	return 0;
> +}
> +

I am still quite confused by the clock handling.

The above will be called for each instantiated phy (user, otg).
Each time, clk_disable_unprepare() will be called. Yet, there
is no matching clk_prepare_enable() call during initialization.

How does this work ?

Thanks,
Guenter
