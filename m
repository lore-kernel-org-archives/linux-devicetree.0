From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v3 1/4] firmware: Amlogic: Add secure monitor driver
Date: Mon, 23 May 2016 13:58:05 -0700
Message-ID: <m2posco5k2.fsf@baylibre.com>
References: <1464021024-29380-1-git-send-email-carlo@caione.org>
	<1464021024-29380-2-git-send-email-carlo@caione.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1464021024-29380-2-git-send-email-carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org> (Carlo
	Caione's message of "Mon, 23 May 2016 18:30:21 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-6IF/jdPJHihWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, afaerber-l3A5Bk7waGM@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org> writes:

> From: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
>
> Introduce a driver to provide calls into secure monitor mode.
>
> In the Amlogic SoCs these calls are used for multiple reasons: access to
> NVMEM, set USB boot, enable JTAG, etc...
>
> Signed-off-by: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>

[...]

> +static int meson_sm_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +	struct meson_sm_firmware *fw;
> +	u32 sm_phy_in_base, sm_phy_out_base;
> +	int cmd_in, cmd_out;
> +
> +	fw = devm_kzalloc(&pdev->dev, sizeof(*fw), GFP_KERNEL);
> +	if (!fw)
> +		return -ENOMEM;
> +
> +	fw->dev = &pdev->dev;
> +
> +	if (of_property_read_u32(np, "amlogic,sm-cmd-input-base", &cmd_in))
> +		return -EINVAL;
> +
> +	if (of_property_read_u32(np, "amlogic,sm-cmd-output-base", &cmd_out))
> +		return -EINVAL;
> +
> +	sm_phy_in_base = meson_sm_call(cmd_in, 0, 0, 0, 0, 0);

Should there be any error checking here?  Do we have any info on the
return values here in case of error, or in case of missing firmware,
etc.

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
