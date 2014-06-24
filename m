From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH v14 08/10] drm/panel: Add Eukrea mbimxsd51 displays.
Date: Tue, 24 Jun 2014 16:06:00 +0100
Message-ID: <20140624150600.GT32514@n2100.arm.linux.org.uk>
References: <1402913484-25910-1-git-send-email-denis@eukrea.com> <1402913484-25910-8-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1402913484-25910-8-git-send-email-denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Eric =?iso-8859-1?Q?B=E9nard?= <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Denis,

This patch creates binding documentation.  Any patch which does so
should be copied to the DT people so they can review the bindings
and give appropriate acks.  It would be better if you separate the
binding documentation updates from the other functional changes too.

I've added them on this reply to see whether they'll feel friendly
enough to comment on the patch as it stands to avoid having to go
through two more rounds on this already-fourteen revision patch set.

On Mon, Jun 16, 2014 at 12:11:22PM +0200, Denis Carikli wrote:
> Signed-off-by: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
> ---
> ChangeLog v13->v14:
> - None
> 
> ChangeLog v12->v13:
> - Added a note explaining why the size is zero in
>   the eukrea_mbimxsd51_dvi(s)vga structs.
> ChangeLog v11->v12:
> - Rebased: It now uses the new DRM_MODE_FLAG_POL_DE flags defines names
> 
> ChangeLog v10->v11:
> - New patch.
> ---
>  .../bindings/panel/eukrea,mbimxsd51-cmo-qvga.txt   |    7 ++
>  .../bindings/panel/eukrea,mbimxsd51-dvi-svga.txt   |    7 ++
>  .../bindings/panel/eukrea,mbimxsd51-dvi-vga.txt    |    7 ++
>  drivers/gpu/drm/panel/panel-simple.c               |   83 ++++++++++++++++++++
>  4 files changed, 104 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/panel/eukrea,mbimxsd51-cmo-qvga.txt
>  create mode 100644 Documentation/devicetree/bindings/panel/eukrea,mbimxsd51-dvi-svga.txt
>  create mode 100644 Documentation/devicetree/bindings/panel/eukrea,mbimxsd51-dvi-vga.txt
> 
> diff --git a/Documentation/devicetree/bindings/panel/eukrea,mbimxsd51-cmo-qvga.txt b/Documentation/devicetree/bindings/panel/eukrea,mbimxsd51-cmo-qvga.txt
> new file mode 100644
> index 0000000..03679d0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/panel/eukrea,mbimxsd51-cmo-qvga.txt
> @@ -0,0 +1,7 @@
> +Eukrea CMO-QVGA (320x240 pixels) TFT LCD panel
> +
> +Required properties:
> +- compatible: should be "eukrea,mbimxsd51-cmo-qvga"
> +
> +This binding is compatible with the simple-panel binding, which is specified
> +in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/panel/eukrea,mbimxsd51-dvi-svga.txt b/Documentation/devicetree/bindings/panel/eukrea,mbimxsd51-dvi-svga.txt
> new file mode 100644
> index 0000000..f408c9a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/panel/eukrea,mbimxsd51-dvi-svga.txt
> @@ -0,0 +1,7 @@
> +Eukrea DVI-SVGA (800x600 pixels) DVI output.
> +
> +Required properties:
> +- compatible: should be "eukrea,mbimxsd51-dvi-svga"
> +
> +This binding is compatible with the simple-panel binding, which is specified
> +in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/panel/eukrea,mbimxsd51-dvi-vga.txt b/Documentation/devicetree/bindings/panel/eukrea,mbimxsd51-dvi-vga.txt
> new file mode 100644
> index 0000000..8ea90da
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/panel/eukrea,mbimxsd51-dvi-vga.txt
> @@ -0,0 +1,7 @@
> +Eukrea DVI-VGA (640x480 pixels) DVI output.
> +
> +Required properties:
> +- compatible: should be "eukrea,mbimxsd51-dvi-vga"
> +
> +This binding is compatible with the simple-panel binding, which is specified
> +in simple-panel.txt in this directory.
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index a251361..adc40a7 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -403,6 +403,80 @@ static const struct panel_desc edt_etm0700g0dh6 = {
>  	},
>  };
>  
> +static const struct drm_display_mode eukrea_mbimxsd51_cmoqvga_mode = {
> +	.clock = 6500,
> +	.hdisplay = 320,
> +	.hsync_start = 320 + 38,
> +	.hsync_end = 320 + 38 + 20,
> +	.htotal = 320 + 38 + 20 + 30,
> +	.vdisplay = 240,
> +	.vsync_start = 240 + 15,
> +	.vsync_end = 240 + 15 + 4,
> +	.vtotal = 240 + 15 + 4 + 3,
> +	.vrefresh = 60,
> +	.pol_flags = DRM_MODE_FLAG_POL_PIXDATA_NEGEDGE |
> +		     DRM_MODE_FLAG_POL_DE_LOW,
> +};
> +
> +static const struct panel_desc eukrea_mbimxsd51_cmoqvga = {
> +	.modes = &eukrea_mbimxsd51_cmoqvga_mode,
> +	.num_modes = 1,
> +	.size = {
> +		.width = 73,
> +		.height = 56,
> +	},
> +};
> +
> +static const struct drm_display_mode eukrea_mbimxsd51_dvisvga_mode = {
> +	.clock = 44333,
> +	.hdisplay = 800,
> +	.hsync_start = 800 + 112,
> +	.hsync_end = 800 + 112 + 32,
> +	.htotal = 800 + 112 + 32 + 80,
> +	.vdisplay = 600,
> +	.vsync_start = 600 + 3,
> +	.vsync_end = 600 + 3 + 17,
> +	.vtotal = 600 + 3 + 17 + 4,
> +	.vrefresh = 60,
> +	.pol_flags = DRM_MODE_FLAG_POL_PIXDATA_POSEDGE |
> +		     DRM_MODE_FLAG_POL_DE_HIGH,
> +};
> +
> +static const struct panel_desc eukrea_mbimxsd51_dvisvga = {
> +	.modes = &eukrea_mbimxsd51_dvisvga_mode,
> +	.num_modes = 1,
> +	/* This is a DVI adapter for external displays */
> +	.size = {
> +		.width = 0,
> +		.height = 0,
> +	},
> +};
> +
> +static const struct drm_display_mode eukrea_mbimxsd51_dvivga_mode = {
> +	.clock = 23750,
> +	.hdisplay = 640,
> +	.hsync_start = 640 + 80,
> +	.hsync_end = 640 + 80 + 16,
> +	.htotal = 640 + 80 + 16 + 64,
> +	.vdisplay = 480,
> +	.vsync_start = 480 + 3,
> +	.vsync_end = 480 + 3 + 13,
> +	.vtotal  = 480 + 3 + 13 + 4,
> +	.vrefresh = 60,
> +	.pol_flags = DRM_MODE_FLAG_POL_PIXDATA_POSEDGE |
> +		     DRM_MODE_FLAG_POL_DE_HIGH,
> +};
> +
> +static const struct panel_desc eukrea_mbimxsd51_dvivga = {
> +	.modes = &eukrea_mbimxsd51_dvivga_mode,
> +	.num_modes = 1,
> +	/* This is a DVI adapter for external displays */
> +	.size = {
> +		.width = 0,
> +		.height = 0,
> +	},
> +};
> +
>  static const struct drm_display_mode lg_lp129qe_mode = {
>  	.clock = 285250,
>  	.hdisplay = 2560,
> @@ -458,6 +532,15 @@ static const struct of_device_id platform_of_match[] = {
>  		.compatible = "chunghwa,claa101wa01a",
>  		.data = &chunghwa_claa101wa01a
>  	}, {
> +		.compatible = "eukrea,mbimxsd51-cmo-qvga",
> +		.data = &eukrea_mbimxsd51_cmoqvga,
> +	}, {
> +		.compatible = "eukrea,mbimxsd51-dvi-svga",
> +		.data = &eukrea_mbimxsd51_dvisvga,
> +	}, {
> +		.compatible = "eukrea,mbimxsd51-dvi-vga",
> +		.data = &eukrea_mbimxsd51_dvivga,
> +	}, {
>  		.compatible = "chunghwa,claa101wb01",
>  		.data = &chunghwa_claa101wb01
>  	}, {
> -- 
> 1.7.9.5
> 

-- 
FTTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... slowly
improving, and getting towards what was expected from it.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
