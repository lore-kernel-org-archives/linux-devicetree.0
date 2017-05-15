From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH 2/4] dt-bindings: Document the Raspberry Pi Touchscreen nodes.
Date: Tue, 16 May 2017 00:56:10 +0300
Message-ID: <3258113.psJ57kzgCh@avalon>
References: <20170511235625.22427-1-eric@anholt.net> <20170511235625.22427-3-eric@anholt.net> <20170515204457.yxucspgm6yrk24pm@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170515204457.yxucspgm6yrk24pm@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Monday 15 May 2017 15:44:57 Rob Herring wrote:
> On Thu, May 11, 2017 at 04:56:23PM -0700, Eric Anholt wrote:
> > The Raspberry Pi 7" Touchscreen is a DPI touchscreen panel with
> > DSI->DPI bridge and touchscreen controller integrated, that connects
> > to the Raspberry Pi through its 15-pin "DSI" connector (some lines are
> > DSI, some lines are I2C).
> > 
> > This device is represented in the DT as three nodes (DSI device, I2C
> > device, panel).  Input will be left to a separate binding later, as it
> > will be a basic I2C client device.
> > 
> > Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
> > ---
> > 
> >  .../raspberrypi,7inch-touchscreen-bridge.txt       | 68
> >  ++++++++++++++++++++++ .../panel/raspberrypi,7inch-touchscreen-panel.txt
> >   |  7 +++
> >  2 files changed, 75 insertions(+)
> >  create mode 100644
> >  Documentation/devicetree/bindings/display/bridge/raspberrypi,7inch-touch
> >  screen-bridge.txt create mode 100644
> >  Documentation/devicetree/bindings/display/panel/raspberrypi,7inch-touchs
> >  creen-panel.txt> 
> > diff --git
> > a/Documentation/devicetree/bindings/display/bridge/raspberrypi,7inch-touc
> > hscreen-bridge.txt
> > b/Documentation/devicetree/bindings/display/bridge/raspberrypi,7inch-touc
> > hscreen-bridge.txt new file mode 100644
> > index 000000000000..a5669beaf68f
> > --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/display/bridge/raspberrypi,7inch-touc
> > hscreen-bridge.txt @@ -0,0 +1,68 @@
> > +Official 7" (800x480) Raspberry Pi touchscreen panel's bridge.
> > +
> > +This DSI panel contains:
> > +
> > +- TC358762 DSI->DPI bridge
> > +- Atmel microcontroller on I2C for power sequencing the DSI bridge and
> > +  controlling backlight
> > +- Touchscreen controller on I2C for touch input
> 
> This is 1 uC or 2?
> 
> > +
> > +and this covers the TC358762 bridge and Atmel microcontroller, while
> > +../panel/raspberrypi,7inch-touchscreen-panel.txt covers the panel.
> > +
> > +Required properties:
> > +- compatible:	Must be "raspberrypi,7inch-touchscreen-bridge"
> > +- raspberrypi,touchscreen-bridge:
> > +		Handle to the I2C device for Atmel microcontroller
> > +
> > +Example:
> > +
> > +dsi1: dsi@7e700000 {
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +	<...>
> > +
> > +	lcd-bridge@0 {
> > +		compatible = "raspberrypi,7inch-touchscreen-bridge";
> > +		reg = <0>;
> > +
> > +		raspberrypi,touchscreen-bridge = <&pitouchscreen_bridge>;
> 
> I think this should be a port with a graph connection from the DSI
> node to the i2c bridge device (and then to the panel).

No, this should actually not exist :-) The property references the I2C device 
DT node corresponding to the microcontroller that controls the backlight (and, 
if I understand correctly, handles power sequencing). The DSI driver (in patch 
3/4) then grabs the I2C device and talks to it. I don't think this is right, 
as commented separately on this patch, the bindings should be split, with a 
standalone binding for the TC358762 (and a separate standalone driver too).

> It's also how other DSI bridges like the tc358767 are done.
> 
> > +		ports {
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +			port@0 {
> > +				reg = <0>;
> 
> BTW, you don't need this when there is only 1.
> 
> > +				pitouchscreen_bridge_port: endpoint {
> > +					remote-endpoint = 
<&pitouchscreen_panel_port>;
> > +				};
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +i2c_dsi: i2c {
> > +	compatible = "i2c-gpio";
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +	gpios = <&gpio 28 0
> > +		 &gpio 29 0>;
> > +
> > +	pitouchscreen_bridge: bridge@45 {
> > +		compatible = "raspberrypi,touchscreen-bridge-i2c";
> > +		reg = <0x45>;
> > +	};
> > +};
> > +
> > +lcd {
> > +	compatible = "raspberrypi,7inch-touchscreen-panel";
> > +	ports {
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +		port@0 {
> > +			reg = <0>;
> > +			pitouchscreen_panel_port: endpoint {
> > +				remote-endpoint = 
<&pitouchscreen_bridge_port>;
> > +			};
> > +		};
> > +	};
> > +};
> > diff --git
> > a/Documentation/devicetree/bindings/display/panel/raspberrypi,7inch-touch
> > screen-panel.txt
> > b/Documentation/devicetree/bindings/display/panel/raspberrypi,7inch-touch
> > screen-panel.txt new file mode 100644
> > index 000000000000..1e84f97b3b20
> > --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/display/panel/raspberrypi,7inch-touch
> > screen-panel.txt @@ -0,0 +1,7 @@
> > +Official 7" (800x480) Raspberry Pi touchscreen panel's panel.
> > +
> > +This binding is compatible with the simple-panel binding, which is
> > specified +in simple-panel.txt in this directory.
> > +
> > +Required properties:
> > +- compatible:	Must be "raspberrypi,7inch-touchscreen-panel"

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
