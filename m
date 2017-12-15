From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] drm/panel: Add support for AUO G104SN02 V2 panel
Date: Fri, 15 Dec 2017 17:07:54 -0600
Message-ID: <20171215230754.cnepbs34t5gp2rsf@rob-hp-laptop>
References: <1513173656.2322.16.camel@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1513173656.2322.16.camel-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christoph Fritz <chf.fritz-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stefan =?iso-8859-1?Q?Riedm=FCller?= <S.Riedmueller-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 13, 2017 at 03:00:56PM +0100, Christoph Fritz wrote:
> This patch adds support for AUO G104SN02 V2 800x600 10.4" panel to DRM
> simple panel driver.
> 
> Signed-off-by: Christoph Fritz <chf.fritz-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
> Signed-off-by: Stefan Riedmueller <s.riedmueller-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
> ---
>  .../bindings/display/panel/auo,g104sn02.txt        |  7 ++++++
>  drivers/gpu/drm/panel/panel-simple.c               | 26 ++++++++++++++++++++++
>  2 files changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/auo,g104sn02.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/auo,g104sn02.txt b/Documentation/devicetree/bindings/display/panel/auo,g104sn02.txt
> new file mode 100644
> index 0000000..050ac90
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/auo,g104sn02.txt
> @@ -0,0 +1,7 @@
> +AU Optronics Corporation 10.4" (800x600) color TFT LCD panel
> +
> +Required properties:
> +- compatible: should be "auo,g104sn02"
> +
> +This binding is compatible with the simple-panel binding, which is specified
> +in simple-panel.txt in this directory.

Please be explicit as to which properties apply. power-supply?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
