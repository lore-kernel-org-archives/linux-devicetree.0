From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Subject: Re: [linux-sunxi] [PATCH v6 5/6] drm: sun4i: Add support for enabling
 DDC I2C bus to sun8i_dw_hdmi glue
Date: Sun, 16 Jun 2019 13:05:13 +0200
Message-ID: <1823986.m04BvQ5ALy@jernej-laptop>
References: <20190527162237.18495-1-megous@megous.com>
 <20190527162237.18495-6-megous@megous.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190527162237.18495-6-megous@megous.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-sunxi@googlegroups.com, megous@megous.com
Cc: Mark Rutland <mark.rutland@arm.com>, Jose Abreu <joabreu@synopsys.com>, Alexandre Torgue <alexandre.torgue@st.com>, devicetree@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, "David S. Miller" <davem@davemloft.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Ondrej!

Dne ponedeljek, 27. maj 2019 ob 18:22:36 CEST je megous via linux-sunxi 
napisal(a):
> From: Ondrej Jirman <megous@megous.com>
> 
> Orange Pi 3 board requires enabling a voltage shifting circuit via GPIO
> for the DDC bus to be usable.
> 
> Add support for hdmi-connector node's optional ddc-en-gpios property to
> support this use case.
> 
> Signed-off-by: Ondrej Jirman <megous@megous.com>
> ---
>  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c | 55 +++++++++++++++++++++++++--
>  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h |  3 ++
>  2 files changed, 55 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c index 39d8509d96a0..59b81ba02d96
> 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> @@ -98,6 +98,30 @@ static u32 sun8i_dw_hdmi_find_possible_crtcs(struct
> drm_device *drm, return crtcs;
>  }
> 
> +static int sun8i_dw_hdmi_find_connector_pdev(struct device *dev,
> +					     struct 
platform_device **pdev_out)
> +{
> +	struct platform_device *pdev;
> +	struct device_node *remote;
> +
> +	remote = of_graph_get_remote_node(dev->of_node, 1, -1);
> +	if (!remote)
> +		return -ENODEV;
> +
> +	if (!of_device_is_compatible(remote, "hdmi-connector")) {
> +		of_node_put(remote);
> +		return -ENODEV;
> +	}
> +
> +	pdev = of_find_device_by_node(remote);
> +	of_node_put(remote);
> +	if (!pdev)
> +		return -ENODEV;
> +
> +	*pdev_out = pdev;
> +	return 0;
> +}
> +
>  static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
>  			      void *data)
>  {
> @@ -151,16 +175,29 @@ static int sun8i_dw_hdmi_bind(struct device *dev,
> struct device *master, return PTR_ERR(hdmi->regulator);
>  	}
> 
> +	ret = sun8i_dw_hdmi_find_connector_pdev(dev, &hdmi->connector_pdev);
> +	if (!ret) {
> +		hdmi->ddc_en = gpiod_get_optional(&hdmi->connector_pdev-
>dev,
> +						  "ddc-en", 
GPIOD_OUT_HIGH);
> +		if (IS_ERR(hdmi->ddc_en)) {
> +			platform_device_put(hdmi->connector_pdev);
> +			dev_err(dev, "Couldn't get ddc-en gpio\n");
> +			return PTR_ERR(hdmi->ddc_en);
> +		}
> +	}
> +
>  	ret = regulator_enable(hdmi->regulator);
>  	if (ret) {
>  		dev_err(dev, "Failed to enable regulator\n");
> -		return ret;
> +		goto err_unref_ddc_en;
>  	}
> 
> +	gpiod_set_value(hdmi->ddc_en, 1);

Why don't you do that inside if clause where hdmi->ddc_en is assigned? It's 
not useful otherwise anyway.

Besides, you would then only need to adjust one goto label in error path.

> +
>  	ret = reset_control_deassert(hdmi->rst_ctrl);
>  	if (ret) {
>  		dev_err(dev, "Could not deassert ctrl reset 
control\n");
> -		goto err_disable_regulator;
> +		goto err_disable_ddc_en;
>  	}
> 
>  	ret = clk_prepare_enable(hdmi->clk_tmds);
> @@ -213,8 +250,14 @@ static int sun8i_dw_hdmi_bind(struct device *dev,
> struct device *master, clk_disable_unprepare(hdmi->clk_tmds);
>  err_assert_ctrl_reset:
>  	reset_control_assert(hdmi->rst_ctrl);
> -err_disable_regulator:
> +err_disable_ddc_en:
> +	gpiod_set_value(hdmi->ddc_en, 0);
>  	regulator_disable(hdmi->regulator);
> +err_unref_ddc_en:
> +	if (hdmi->ddc_en)
> +		gpiod_put(hdmi->ddc_en);
> +
> +	platform_device_put(hdmi->connector_pdev);
> 
>  	return ret;
>  }
> @@ -228,7 +271,13 @@ static void sun8i_dw_hdmi_unbind(struct device *dev,
> struct device *master, sun8i_hdmi_phy_remove(hdmi);
>  	clk_disable_unprepare(hdmi->clk_tmds);
>  	reset_control_assert(hdmi->rst_ctrl);
> +	gpiod_set_value(hdmi->ddc_en, 0);
>  	regulator_disable(hdmi->regulator);
> +
> +	if (hdmi->ddc_en)
> +		gpiod_put(hdmi->ddc_en);
> +
> +	platform_device_put(hdmi->connector_pdev);
>  }
> 
>  static const struct component_ops sun8i_dw_hdmi_ops = {
> diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
> b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h index 720c5aa8adc1..dad66b8301c2
> 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
> @@ -9,6 +9,7 @@
>  #include <drm/bridge/dw_hdmi.h>
>  #include <drm/drm_encoder.h>
>  #include <linux/clk.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/reset.h>
> @@ -190,6 +191,8 @@ struct sun8i_dw_hdmi {
>  	struct regulator		*regulator;
>  	const struct sun8i_dw_hdmi_quirks *quirks;
>  	struct reset_control		*rst_ctrl;
> +	struct platform_device		*connector_pdev;

It seems that connector_pdev is needed only during intialization. Why do you 
store it?

Best regards,
Jernej

> +	struct gpio_desc		*ddc_en;
>  };
> 
>  static inline struct sun8i_dw_hdmi *
