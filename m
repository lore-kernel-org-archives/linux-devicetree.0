From: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v7 06/14] drm/mediatek: Add HDMI support
Date: Tue, 29 Dec 2015 16:49:33 +0800
Message-ID: <1451378973.15546.3.camel@mtksdaap41>
References: <1448917676-25584-1-git-send-email-p.zabel@pengutronix.de>
	 <1448917676-25584-7-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1448917676-25584-7-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>, YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jitao Shi <jitao.shi-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jie Qiu <jie.qiu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Cawa Cheng <cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Daniel Stone <daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org>, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 2015-11-30 at 22:07 +0100, Philipp Zabel wrote:
> From: Jie Qiu <jie.qiu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> 
> This patch adds drivers for the HDMI bridge connected to the DPI0
> display subsystem function block, for the HDMI DDC block, and for
> the HDMI PHY to support HDMI output.
> 
> Signed-off-by: Jie Qiu <jie.qiu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
<...>
> +static int mtk_hdmi_setup_avi_infoframe(struct mtk_hdmi *hdmi,
> +					struct drm_display_mode *mode)
> +{
> +	struct hdmi_avi_infoframe frame;
> +	u8 buffer[17];
> +	ssize_t err;
> +
> +	err = drm_hdmi_avi_infoframe_from_display_mode(&frame, mode);
> +	if (err < 0) {
> +		dev_err(hdmi->dev,
> +			"Failed to get AVI infoframe from mode: %ld\n", err);

Please use %zd instead for ssize_t, otherwise you'll see warning message
when compile this on 32bits platform.

Joe.C


> +		return err;
> +	}
> +
> +	err = hdmi_avi_infoframe_pack(&frame, buffer, sizeof(buffer));
> +	if (err < 0) {
> +		dev_err(hdmi->dev, "Failed to pack AVI infoframe: %ld\n", err);
> +		return err;
> +	}
> +
> +	mtk_hdmi_hw_send_info_frame(hdmi, buffer, sizeof(buffer));
> +	return 0;
> +}
> +

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
