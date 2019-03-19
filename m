From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 2/6] drm/exynos: dsi: Use drm_bridge_detach
Date: Tue, 19 Mar 2019 12:59:49 +0900
Message-ID: <e7d55512-41be-b3a7-a23b-59fd6bfbcbc3@samsung.com>
References: <20190315130825.9005-1-jagan@amarulasolutions.com>
        <CGME20190315130851epcas1p2412844a1a23d72e725ac6e2d23179fbd@epcas1p2.samsung.com>
        <20190315130825.9005-3-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190315130825.9005-3-jagan@amarulasolutions.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jagan Teki <jagan@amarulasolutions.com>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Michael Trimarchi <michael@amarulasolutions.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com, linux-amarula@amarulasolutions.com, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: devicetree@vger.kernel.org



19. 3. 15. 오후 10:08에 Jagan Teki 이(가) 쓴 글:
> drm_bridge_detach now available to use while detaching
> bridge, use this core wrapper instead of explicitly
> pointing the bridge funcs.
> 
> Cc: Dae <inki.dae@samsung.com>
> Cc: Joonyoung Shim <jy0922.shim@samsung.com>
> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Acked-by: Inki Dae <inki.dae@samsung.com>

Thanks,
Inki Dae

> ---
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index a4253dd55f86..5daf43d02768 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -1583,8 +1583,7 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
>  		dsi->connector.status = connector_status_disconnected;
>  		mutex_unlock(&drm->mode_config.mutex);
>  	} else {
> -		if (dsi->out_bridge->funcs->detach)
> -			dsi->out_bridge->funcs->detach(dsi->out_bridge);
> +		drm_bridge_detach(dsi->out_bridge);
>  		dsi->out_bridge = NULL;
>  	}
>  
> 
