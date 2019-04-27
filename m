From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 2/3] drm: Add bus flag for Sharp-specific signals
Date: Sat, 27 Apr 2019 08:32:14 +0200
Message-ID: <20190427063214.GA13123@ravnborg.org>
References: <20190425231854.24479-1-paul@crapouillou.net>
 <20190425231854.24479-2-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190425231854.24479-2-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Thierry Reding <thierry.reding@gmail.com>, od@zcrc.me, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Paul

On Fri, Apr 26, 2019 at 01:18:53AM +0200, Paul Cercueil wrote:
> Add the DRM_BUS_FLAG_SHARP_SIGNALS to the drm_bus_flags enum.
> 
> This flags can be used when the display must be driven with the
> Sharp-specific signals SPL, CLS, REV, PS.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> 
> Notes:
>     v3: New patch
> 
>  include/drm/drm_connector.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 02a131202add..ac7d58fd1e03 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -323,6 +323,8 @@ enum drm_panel_orientation {
>   *					edge of the pixel clock
>   * @DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE:	Sync signals are sampled on the falling
>   *					edge of the pixel clock
> + * @DRM_BUS_FLAG_SHARP_SIGNALS:		Set if the Sharp-specific signals
> + *					(SPL, CLS, PS, REV) must be used
>   */
>  enum drm_bus_flags {
>  	DRM_BUS_FLAG_DE_LOW = BIT(0),
> @@ -341,6 +343,7 @@ enum drm_bus_flags {
>  	DRM_BUS_FLAG_SYNC_DRIVE_NEGEDGE = DRM_BUS_FLAG_SYNC_NEGEDGE,
>  	DRM_BUS_FLAG_SYNC_SAMPLE_POSEDGE = DRM_BUS_FLAG_SYNC_NEGEDGE,
>  	DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE = DRM_BUS_FLAG_SYNC_POSEDGE,
> +	DRM_BUS_FLAG_SHARP_SIGNALS = BIT(8),
>  };

This solutions looks very good to me.
Now the panel can report to the display driver that is needs the
DRM_BUS_FLAG_SHARP_SIGNALS, so the display driver can adapt to the
connected display.
Obviously not many display drivers will support DRM_BUS_FLAG_SHARP_SIGNALS
but the one that does now no longer need to include panel configuration.

You can add:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

But we need Thierry or someone else with more knowledge in this
area to comment on this before we can apply it.
drm_bus_flag is today only timing related config, and there be a better
way to do this.

Thierry?

	Sam
