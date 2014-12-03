From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v16 03/12] drm: imx: imx-hdmi: convert imx-hdmi to
 drm_bridge mode
Date: Wed, 3 Dec 2014 15:38:47 +0000
Message-ID: <20141203153847.GC11285@n2100.arm.linux.org.uk>
References: <1417620408-30354-1-git-send-email-andy.yan@rock-chips.com>
 <1417620566-30496-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <1417620566-30496-1-git-send-email-andy.yan@rock-chips.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, heiko@sntech.de, airlied@linux.ie, dri-devel@lists.freedesktop.org, ykk@rock-chips.com, devel@driverdev.osuosl.org, Pawel Moll <pawel.moll@arm.com>, linux-rockchip@lists.infradead.org, Grant Likely <grant.likely@linaro.org>, Dave Airlie <airlied@redhat.com>, jay.xu@rock-chips.com, devicetree@vger.kernel.org, Zubair.Kakakhel@imgtec.com, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>, mark.yao@rock-chips.com, fabio.estevam@freescale.com, Josh Boyer <jwboyer@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, djkurtz@google.com, Philipp Zabel <p.zabel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Shawn Guo <shawn.guo@linaro.org>, vladimir_zapolskiy@mentor.com, Luc
List-Id: devicetree@vger.kernel.org

On Wed, Dec 03, 2014 at 11:29:26PM +0800, Andy Yan wrote:
> +int imx_hdmi_bind(struct device *dev, struct device *master,
> +		  void *data, struct drm_encoder *encoder,
> +		  const struct imx_hdmi_plat_data *plat_data)
>  {
>  	struct platform_device *pdev = to_platform_device(dev);
> -	const struct of_device_id *of_id =
> -				of_match_device(imx_hdmi_dt_ids, dev);
>  	struct drm_device *drm = data;
>  	struct device_node *np = dev->of_node;
>  	struct device_node *ddc_node;
> @@ -1594,19 +1566,16 @@ static int imx_hdmi_bind(struct device *dev, struct device *master, void *data)
>  	struct resource *iores;
>  	int ret, irq;
>  
> -	hdmi = devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
> +	hdmi = devm_kzalloc(&pdev->dev, sizeof(*hdmi), GFP_KERNEL);
>  	if (!hdmi)
>  		return -ENOMEM;
>  
> -	hdmi->dev = dev;
> +	hdmi->plat_data = plat_data;
> +	hdmi->dev = &pdev->dev;
> +	hdmi->dev_type = plat_data->dev_type;
>  	hdmi->sample_rate = 48000;
>  	hdmi->ratio = 100;
> -
> -	if (of_id) {
> -		const struct platform_device_id *device_id = of_id->data;
> -
> -		hdmi->dev_type = device_id->driver_data;
> -	}
> +	hdmi->encoder = encoder;

I'd suggest changing imx_hdmi_bind() to take the struct resource and irq
number, and avoiding the platform device stuff altogether in here.

-- 
FTTC broadband for 0.8mile line: currently at 9.5Mbps down 400kbps up
according to speedtest.net.
