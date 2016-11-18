From: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: am335x-boneblack: Add blue-and-red-wiring
 -property to LCDC node
Date: Thu, 17 Nov 2016 17:25:32 -0800
Message-ID: <20161118012531.GI7129@atomide.com>
References: <a7a7cd2666199316cbf13f5c1c9a387838f645bf.1479413359.git.jsarha@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <a7a7cd2666199316cbf13f5c1c9a387838f645bf.1479413359.git.jsarha-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tomi.valkeinen-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

* Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org> [161117 12:14]:
> Add blue-and-red-wiring -property to LCDC node. Also adds comments on
> how to get support 24 bit RGB mode. After this patch am335x-boneblack
> support RGB565, BGR888, and XBGR8888 color formats. See details in
> Documentation/devicetree/bindings/display/tilcdc/tilcdc.txt.
> 
> The BBB has straight color wiring from am335x to tda19988, however the
> tda19988 can be configured to cross the blue and red wires. The
> comments show how to do that with video-ports property of tda19988
> node and how to tell LCDC that blue and red wires are crossed, with
> blue-and-red-wiring LCDC node property. This changes supported color
> formats from 16 bit RGB and 24 bit BGR to 16 bit BGR and 24 bit RGB.
> 
> Signed-off-by: Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
> ---
> Hi Tony,
> Could you pick this for 4.10. We left it out form 4.9 to avoid
> conflict with beaglebone-back hdmi audio dts patches that slipped in
> trough drm branch.

Thanks applying into omap-for-v4.10/dt.

Tony
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
