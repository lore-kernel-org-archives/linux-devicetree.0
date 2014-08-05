From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 07/15] drm/exynos: dsi: Add support for panel prepare
 and unprepare routines
Date: Tue, 05 Aug 2014 12:03:56 +0200
Message-ID: <53E0AC0C.9030309@samsung.com>
References: <1406828534-10072-1-git-send-email-ajaykumar.rs@samsung.com> <1406828534-10072-8-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1406828534-10072-8-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.orgdri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

Hi Ajay,


On 07/31/2014 07:42 PM, Ajay Kumar wrote:
> Modify exynos_dsi driver to support the new panel calls:
> prepare and unprepare.
> 
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c |   12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index dc7c80b..4834932 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -1351,7 +1351,7 @@ static int exynos_dsi_enable(struct exynos_dsi *dsi)
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = drm_panel_enable(dsi->panel);
> +	ret = drm_panel_prepare(dsi->panel);
>  	if (ret < 0) {
>  		exynos_dsi_poweroff(dsi);
>  		return ret;
> @@ -1360,6 +1360,13 @@ static int exynos_dsi_enable(struct exynos_dsi *dsi)
>  	exynos_dsi_set_display_mode(dsi);
>  	exynos_dsi_set_display_enable(dsi, true);
>  
> +	ret = drm_panel_enable(dsi->panel);
> +	if (ret < 0) {
> +		exynos_dsi_set_display_enable(dsi, false);

I guess drm_panel_unprepare(dsi->panel) should be here.

Regards
Andrzej

> +		exynos_dsi_poweroff(dsi);
> +		return ret;
> +	}
> +
>  	dsi->state |= DSIM_STATE_ENABLED;
>  
>  	return 0;
> @@ -1370,8 +1377,9 @@ static void exynos_dsi_disable(struct exynos_dsi *dsi)
>  	if (!(dsi->state & DSIM_STATE_ENABLED))
>  		return;
>  
> -	exynos_dsi_set_display_enable(dsi, false);
>  	drm_panel_disable(dsi->panel);
> +	exynos_dsi_set_display_enable(dsi, false);
> +	drm_panel_unprepare(dsi->panel);
>  	exynos_dsi_poweroff(dsi);
>  
>  	dsi->state &= ~DSIM_STATE_ENABLED;
> 
