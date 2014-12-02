From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v15 12/12] drm: bridge/dw_hdmi: add rockchip rk3288 support
Date: Tue, 02 Dec 2014 11:24:42 +0100
Message-ID: <1417515882.3411.8.camel@pengutronix.de>
References: <1417505778-18341-1-git-send-email-andy.yan@rock-chips.com>
 <1417506327-18908-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1417506327-18908-1-git-send-email-andy.yan@rock-chips.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Andy Yan <andy.yan@rock-chips.com>
Cc: Mark Rutland <mark.rutland@arm.com>, heiko@sntech.de, airlied@linux.ie, dri-devel@lists.freedesktop.org, ykk@rock-chips.com, devel@driverdev.osuosl.org, Pawel Moll <pawel.moll@arm.com>, linux-rockchip@lists.infradead.org, Grant Likely <grant.likely@linaro.org>, Dave Airlie <airlied@redhat.com>, jay.xu@rock-chips.com, devicetree@vger.kernel.org, Zubair.Kakakhel@imgtec.com, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>, rmk+kernel@arm.linux.org.uk, mark.yao@rock-chips.com, fabio.estevam@freescale.com, Josh Boyer <jwboyer@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, djkurtz@google.com, Kumar Gala <galak@codeaurora.org>, Shawn Guo <shawn.guo@linaro.org>, vladimir_zapolskiy@mentor.com
List-Id: devicetree@vger.kernel.org

Hi Andy,

Am Dienstag, den 02.12.2014, 15:45 +0800 schrieb Andy Yan:
[...]
> +static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
> +				 void *data)
> +{
> +	struct platform_device *pdev = to_platform_device(dev);
> +	const struct dw_hdmi_plat_data *plat_data;
> +	const struct of_device_id *match;
> +	struct drm_device *drm = data;
> +	struct drm_encoder *encoder;
> +	struct rockchip_hdmi *hdmi;
> +	int ret;
> +
> +	if (!pdev->dev.of_node)
> +		return -ENODEV;
> +
> +	hdmi = devm_kzalloc(&pdev->dev, sizeof(*hdmi), GFP_KERNEL);
> +	if (!hdmi)
> +		return -ENOMEM;
> +
> +	match = of_match_node(dw_hdmi_rockchip_ids, pdev->dev.of_node);
> +	plat_data = match->data;
> +	hdmi->dev = &pdev->dev;
> +	encoder = &hdmi->encoder;
> +	platform_set_drvdata(pdev, hdmi);
> +
> +	ret = rockchip_hdmi_parse_dt(hdmi);
> +	if (ret) {
> +		dev_err(hdmi->dev, "Unable to parse OF data\n");
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(hdmi->clk);
> +	if (ret) {
> +		dev_err(hdmi->dev, "Cannot enable HDMI clock: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(hdmi->hdcp_clk);
> +	if (ret) {
> +		dev_err(hdmi->dev, "Cannot enable HDMI hdcp clock: %d\n", ret);
> +		return ret;
> +	}

Could we have a look at the clocks again? Basically the Rockchip clock
handling is exactly the same, except the clocks are called by other
names.

On i.MX6, according to the reference manual, the HDMI TX module has four
clock inputs: "iahbclk" (bus clock), "icecclk" (32 kHz CEC clock),
"ihclk" (module clock), and "isfrclk" (27 MHz internal SFR clock).
The "iahbclk" and "ihclk" are both sourced from the SoC AHB root clock,
the 32 kHz reference input can't be gated, and the "isfrclk" has its own
gate.

Does the HDMI TX implementation on Rockchip still have the separate
external sfr bus and module clock inputs? I assume that your "clk" input
is a single gate bit for bus and module clocks at the same time?
If possible, I'd prefer to find a common binding for the clocks with
some of the clocks being optional, but for that we need to know the
actual clock inputs to the HDMI TX module.

regards
Philipp
