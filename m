From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 1/3] dt-bindings: Add doc for the ingenic-drm driver
Date: Fri, 1 Mar 2019 21:16:24 +0100
Message-ID: <20190301201624.GA22317@ravnborg.org>
References: <20190228220756.20262-1-paul@crapouillou.net>
 <20190228220756.20262-2-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190228220756.20262-2-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org, linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Paul.

Good to see work migrating fbdev => drm.

Following comments is based on experience while working on migrating
another driver from fbdev => drm.

On Thu, Feb 28, 2019 at 07:07:54PM -0300, Paul Cercueil wrote:
> Add documentation for the devicetree bindings of the DRM driver for the
> JZ47xx family of SoCs from Ingenic.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Tested-by: Artur Rojek <contact@artur-rojek.eu>
> ---
>  .../devicetree/bindings/display/ingenic,drm.txt    | 30 ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ingenic,drm.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/ingenic,drm.txt b/Documentation/devicetree/bindings/display/ingenic,drm.txt
> new file mode 100644
> index 000000000000..52a368ec35cd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/ingenic,drm.txt
> @@ -0,0 +1,30 @@
> +Ingenic JZ47xx DRM driver
> +
> +Required properties:
> +- compatible: one of:
> +  * ingenic,jz4740-drm
> +  * ingenic,jz4725b-drm
> +- reg: LCD registers location and length
The fbdev way of doing this was to hardcode register setttings.
In the drm world we read the configuration of the panel and let
this decide the actual configuration.

Note that no drm drivers supports stn displays and that there
is really no use for this these days. So you can skip the STN parts.

Also the modern way to specify a panel in the DT is using OF graph bindings.
You can find many examples how to do this.

I was there with the atmel LCDC driver (not in the kernel yet),
and had some challenges with this.

	Sam
