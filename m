From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 1/2] drm: panel-simple: Add simple-panel driver.
Date: Wed, 10 Apr 2019 16:50:30 +0200
Message-ID: <7915415.Bhcl4jWJiJ@diego>
References: <20190410141045.58097-1-christoph.muellner@theobroma-systems.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190410141045.58097-1-christoph.muellner@theobroma-systems.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Muellner <christoph.muellner@theobroma-systems.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Christoph,

Am Mittwoch, 10. April 2019, 16:10:44 CEST schrieb Christoph Muellner:
> On our RK3399-Q7 EVK base board we have the option to connect an arbitrary
> monitor via DP cable. The actual monitor is therefore not known in advance.
> This means, we don't have any panel information besides the EDID
> data from the device itself.

Just so I understand correctly, you have a real dp-connector wired to
the Analogix dp-controller, and therefore want to connect actual
monitors to it.

So the problem you're trying to work around is probably that the
rockchip-driver of the analogix controller explictly expects a bridge
to be present during probe, right?

I think hacking up the panel-driver is not an ideal approach:
(1) bridges/panels do expect to stay connected all the time
    and are meant for devices with actual hard-wired displays with specific
    power-sequence requirements
(2) devicetree is expected to describe the real hardware, therefore the
    dt should not describe one thing while the actual hardware is really
    different

So, I guess a more ideal approach could perhaps be to:
(1) define a "dp-connector" devicetree binding, see
    Documentation/devicetree/bindings/display/connector/hdmi-connector.txt
    for a similar one
(2) steal an idea from drivers/gpu/drm/mediatek/mtk_hdmi.c and check
    for that new compatible:
	if (!of_device_is_compatible(remote, "hdmi-connector")) {
		//move bridge handling here
	}

    and modify both the rockchip-part and the generic analogix bridge code
    to work with the connector declared instead of a panel?


Heiko

> The functionality for a 'simple-panel' has been remove a couple
> of years ago with 81cf32b. This patch brings this feature back.
> 
> Signed-off-by: Christoph Muellner <christoph.muellner@theobroma-systems.com>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 24 ++++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 9e8218f6a3f2..1f69283f3e4b 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -176,7 +176,7 @@ static int panel_simple_disable(struct drm_panel *panel)
>  		backlight_update_status(p->backlight);
>  	}
>  
> -	if (p->desc->delay.disable)
> +	if (p->desc && p->desc->delay.disable)
>  		msleep(p->desc->delay.disable);
>  
>  	p->enabled = false;
> @@ -195,7 +195,7 @@ static int panel_simple_unprepare(struct drm_panel *panel)
>  
>  	regulator_disable(p->supply);
>  
> -	if (p->desc->delay.unprepare)
> +	if (p->desc && p->desc->delay.unprepare)
>  		msleep(p->desc->delay.unprepare);
>  
>  	p->prepared = false;
> @@ -220,11 +220,13 @@ static int panel_simple_prepare(struct drm_panel *panel)
>  
>  	gpiod_set_value_cansleep(p->enable_gpio, 1);
>  
> -	delay = p->desc->delay.prepare;
> -	if (p->no_hpd)
> -		delay += p->desc->delay.hpd_absent_delay;
> -	if (delay)
> -		msleep(delay);
> +	if (p->desc) {
> +		delay = p->desc->delay.prepare;
> +		if (p->no_hpd)
> +			delay += p->desc->delay.hpd_absent_delay;
> +		if (delay)
> +			msleep(delay);
> +	}
>  
>  	p->prepared = true;
>  
> @@ -238,7 +240,7 @@ static int panel_simple_enable(struct drm_panel *panel)
>  	if (p->enabled)
>  		return 0;
>  
> -	if (p->desc->delay.enable)
> +	if (p->desc && p->desc->delay.enable)
>  		msleep(p->desc->delay.enable);
>  
>  	if (p->backlight) {
> @@ -280,6 +282,9 @@ static int panel_simple_get_timings(struct drm_panel *panel,
>  	struct panel_simple *p = to_panel_simple(panel);
>  	unsigned int i;
>  
> +	if (!p->desc)
> +		return 0;
> +
>  	if (p->desc->num_timings < num_timings)
>  		num_timings = p->desc->num_timings;
>  
> @@ -2536,6 +2541,9 @@ static const struct panel_desc arm_rtsm = {
>  
>  static const struct of_device_id platform_of_match[] = {
>  	{
> +		.compatible = "simple-panel",
> +		.data = NULL,
> +	}, {
>  		.compatible = "ampire,am-480272h3tmqw-t01h",
>  		.data = &ampire_am_480272h3tmqw_t01h,
>  	}, {
> 
