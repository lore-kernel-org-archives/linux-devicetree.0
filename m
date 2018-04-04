From: Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH v2 2/5] drm: bridge: add API to query the expected input
 formats of bridges
Date: Wed, 4 Apr 2018 16:40:03 +0200
Message-ID: <9463e10c-120f-28f1-ef38-b0c8acedd1bd@axentia.se>
References: <20180326212447.7380-1-peda@axentia.se>
 <fcc47402-d758-4062-0565-f5977b85b206@axentia.se>
 <20180327130231.GO27746@w540> <1811029.jLvDxETu2H@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1811029.jLvDxETu2H@avalon>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, jacopo mondi <jacopo@jmondi.org>
Cc: linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>, Daniel Vetter <daniel.vetter@intel.com>, Gustavo Padovan <gustavo@padovan.org>, Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 2018-04-04 15:07, Laurent Pinchart wrote:
> First of all, thank you for the patch. This generates more discussion than I 
> had anticipated, which is both good and bad. I'll comment through the e-mail, 
> and try to explain both my initial idea, and also where it could lead us.

*snip*

Thank you for the long interesting mail! I will read it again, but my
immediate reaction is that I am not the man to attempt anything heavier
than static format information in drm bridges, and that I will hold off
any further work until some consensus has been reached.

> Finally, still regarding Peter's case, the decision to output RGB565 instead 
> of RGB888 (which the LVDS encoder expects) is due to PCB routing between the 
> display controller and the LVDS encoder. This isn't a property of the LVDS 
> encoder or the display controller, but of their hardware connection. This 
> patch series uses a DT property in the LVDS encoder DT node to convey that 
> information, but wouldn't it be equally correct (or incorrect :-)) to instead 
> use a DT property in the display controller DT node ?

Right, it might even be more correct to do it there? Thinking about it, I
have this in the DT

#include "sama5d3_lcd.dtsi"

&hlcdc {
	hlcdc-display-controller {
		pinctrl-names = "default";
		pinctrl-0 = <&pinctrl_lcd_base &pinctrl_lcd_rgb565>;

		port@0 {
			hlcdc_output: endpoint {
				remote-endpoint = <&lvds_encoder_input>;
			};
		};
	};
};

Where the &pinctrl_lcd_rgb565 handle tells the chip to not even bother
routing all of the rgb888 signals to pins and thus not waste pins that
are in fact used for other things. Maybe it is possible for the hlcdc
driver to look at that info and suggest rgb565 instead of rgb888 without
anything further in the DT? But maybe it's difficult to peek into pinctrl
bindings like that?

Cheers,
Peter
