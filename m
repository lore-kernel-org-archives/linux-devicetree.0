From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v5 5/5] drm: rockchip: add fixed screen size DVI-D support for rk3066 hdmi
Date: Sun, 31 Mar 2019 18:19:45 +0200
Message-ID: <4928946.oK5HkskicG@phil>
References: <20190321001440.31057-1-jbx6244@gmail.com> <20190321001440.31057-6-jbx6244@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190321001440.31057-6-jbx6244@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Jonker <jbx6244@gmail.com>
Cc: hjc@rock-chips.com, airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org, mark.rutland@arm.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Johan,

Am Donnerstag, 21. März 2019, 01:14:40 CEST schrieb Johan Jonker:
> Add fixed screen size DVI-D support
> for rk3066 hdmi with an extra patch.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>

> +static const struct drm_display_mode edid_cea_modes[] = {
> +	/* 4 - 1280x720@60Hz 16:9 */
> +	{ DRM_MODE("1280x720", DRM_MODE_TYPE_DRIVER, 74250, 1280, 1390,
> +		   1430, 1650, 0, 720, 725, 730, 750, 0,
> +		   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
> +	  .vrefresh = 60, .picture_aspect_ratio = HDMI_PICTURE_ASPECT_16_9, },
> +};

you already dropped this patch from v6, but just for completeness sake,
I don't think there should be a static mode for dvi displays.

Similar to hdmi, dvi also can use ddc to read the monitor edid and some
sort of static mode might behave badly if for example a display with less
than this 720p is connected.

I think I remember reading in the Rockchip tree that they added that for
the case reading the edid fails, but if that happens the reading should
be fixed and not worked around a failure :-)


Heiko
