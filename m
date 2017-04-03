From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv4 25/29] drm/omap: displays: panel-dpi: Support for
 handling backlight devices
Date: Mon, 3 Apr 2017 10:58:40 -0500
Message-ID: <20170403155840.m62fwyptmbwlsfnq@rob-hp-laptop>
References: <1490872529-23084-1-git-send-email-tomi.valkeinen@ti.com>
 <1490872529-23084-26-git-send-email-tomi.valkeinen@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1490872529-23084-26-git-send-email-tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 30, 2017 at 02:15:25PM +0300, Tomi Valkeinen wrote:
> From: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
> 
> The associated backlight device can be configured via DT by providing the
> phandle to the device.
> 
> If the backlight device is configured, the driver can manage the backligt
> along with the panel's power state, iow it can turn on the backlight when
> the panel is enabled and turn it off when the panel is disabled.
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>  .../bindings/display/panel/panel-dpi.txt           |  3 ++
>  drivers/gpu/drm/omapdrm/displays/panel-dpi.c       | 37 ++++++++++++++++++++--
>  2 files changed, 38 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-dpi.txt b/Documentation/devicetree/bindings/display/panel/panel-dpi.txt
> index d4add13e592d..6b203bc4d932 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-dpi.txt
> +++ b/Documentation/devicetree/bindings/display/panel/panel-dpi.txt
> @@ -9,6 +9,7 @@ Optional properties:
>  - enable-gpios: panel enable gpio
>  - reset-gpios: GPIO to control the RESET pin
>  - vcc-supply: phandle of regulator that will be used to enable power to the display
> +- backlight: phandle of the backlight device

Any panel can have a backlight, so please add to panel/panel.txt 
instead.

>  
>  Required nodes:
>  - "panel-timing" containing video timings
> @@ -22,6 +23,8 @@ lcd0: display@0 {
>          compatible = "samsung,lte430wq-f0c", "panel-dpi";
>          label = "lcd";
>  
> +        backlight = <&backlight>;
> +
>          port {
>              lcd_in: endpoint {
>                      remote-endpoint = <&dpi_out>;
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
