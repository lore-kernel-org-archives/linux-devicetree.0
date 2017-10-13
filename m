From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/9] drm/panel: simple: make it possible to override LCD
 bus format
Date: Fri, 13 Oct 2017 17:13:39 -0500
Message-ID: <20171013221339.w4ci3hcz4svupvpt@rob-hp-laptop>
References: <1507721021-28174-1-git-send-email-LW@KARO-electronics.de>
 <1507721021-28174-4-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1507721021-28174-4-git-send-email-LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 11, 2017 at 01:23:35PM +0200, Lothar Waﬂmann wrote:
> The baseboards for the Ka-Ro electronics series of i.MX modules
> use a 24bit LCD interface, no matter what LCD bus width the SoC on the
> module provides and what the LCD panel expects. LCDs with 6bit per color
> will ignore the 2 LSBs of each color lane, and modules using a SoC
> that provides only 6bit per color, drive the display information on the
> 6 MSBs of each color lane and tie the 2 LSBs of each color lane to GND.
> 
> Thus, no matter what combination of LCD and SoC is used, the LCD port
> can be used without shuffling bit lanes by always configuring the LCD
> output to 24bit mode.

Thanks for providing good reasoning as to why this is needed.

> 
> Add a function to handle certain quirks of the LCD interface to the
> panel driver to be able to override the bus format specified in a
> panel's display_mode.
> 
> Signed-off-by: Lothar Waﬂmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
> ---
>  .../bindings/display/panel/simple-panel.txt        |  2 ++
>  drivers/gpu/drm/panel/panel-simple.c               | 40 +++++++++++++++++++++-
>  2 files changed, 41 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/simple-panel.txt b/Documentation/devicetree/bindings/display/panel/simple-panel.txt
> index 1341bbf..e2308c3 100644
> --- a/Documentation/devicetree/bindings/display/panel/simple-panel.txt
> +++ b/Documentation/devicetree/bindings/display/panel/simple-panel.txt
> @@ -7,6 +7,8 @@ Optional properties:
>  - ddc-i2c-bus: phandle of an I2C controller used for DDC EDID probing
>  - enable-gpios: GPIO pin to enable or disable the panel
>  - backlight: phandle of the backlight device attached to the panel
> +- bus-format-override: override the bus_format setting of the panel's
> +  display_mode settings

You need to define valid values here.

However, we also have this proposal[1]. Please align to a common one. 
BTW, we don't need another common panel binding file that [1] added. We 
already have panel-dpi.txt for parallel interface panels. And 
personally, I'd like to see simple-panel.txt disappear.

Rob

[1] https://patchwork.ozlabs.org/patch/823104/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
