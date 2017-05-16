From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH 2/4] dt-bindings: Document the Raspberry Pi Touchscreen nodes.
Date: Tue, 16 May 2017 10:20:26 +0300
Message-ID: <6676454.oPjrLVBqHn@avalon>
References: <20170511235625.22427-1-eric@anholt.net> <1579603.xgvSgGFBs8@avalon> <87shk53bxq.fsf@eliezer.anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87shk53bxq.fsf-omZaPlIz5HhaEpDpdNBo/KxOck334EZe@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Eric,

On Monday 15 May 2017 17:03:29 Eric Anholt wrote:
> Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org> writes:
> > On Thursday 11 May 2017 16:56:23 Eric Anholt wrote:
> >> The Raspberry Pi 7" Touchscreen is a DPI touchscreen panel with
> >> DSI->DPI bridge and touchscreen controller integrated, that connects
> >> to the Raspberry Pi through its 15-pin "DSI" connector (some lines are
> >> DSI, some lines are I2C).
> >> 
> >> This device is represented in the DT as three nodes (DSI device, I2C
> >> device, panel).  Input will be left to a separate binding later, as it
> >> will be a basic I2C client device.
> >> 
> >> Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
> >> ---
> >> 
> >>  .../raspberrypi,7inch-touchscreen-bridge.txt       | 68 +++++++++++++++
> >>  .../panel/raspberrypi,7inch-touchscreen-panel.txt  |  7 +++
> >>  2 files changed, 75 insertions(+)
> >>  create mode 100644
> >> 
> >> Documentation/devicetree/bindings/display/bridge/raspberrypi,7inch-touchs
> >> cr
> >> een-bridge.txt create mode 100644
> >> Documentation/devicetree/bindings/display/panel/raspberrypi,7inch-touchsc
> >> re
> >> en-panel.txt
> >> 
> >> diff --git
> >> a/Documentation/devicetree/bindings/display/bridge/raspberrypi,7inch-touc
> >> hs
> >> creen-bridge.txt
> >> b/Documentation/devicetree/bindings/display/bridge/raspberrypi,7inch-touc
> >> hs
> >> creen-bridge.txt new file mode 100644
> >> index 000000000000..a5669beaf68f
> >> --- /dev/null
> >> +++
> >> b/Documentation/devicetree/bindings/display/bridge/raspberrypi,7inch-touc
> >> hs
> >> creen-bridge.txt @@ -0,0 +1,68 @@
> >> +Official 7" (800x480) Raspberry Pi touchscreen panel's bridge.
> >> +
> >> +This DSI panel contains:
> >> +
> >> +- TC358762 DSI->DPI bridge
> >> +- Atmel microcontroller on I2C for power sequencing the DSI bridge and
> >> +  controlling backlight
> >> +- Touchscreen controller on I2C for touch input
> >> +
> >> +and this covers the TC358762 bridge and Atmel microcontroller, while
> >> +../panel/raspberrypi,7inch-touchscreen-panel.txt covers the panel.
> > 
> > The TC358762 is a standalone bridge that doesn't depend on the ATTiny
> > microcontroller used by the RPI. As it's usable standalone, I believe this
> > binding should be split in two.
> 
> Do you have a plan for how I would implement a driver on top of that
> binding change, though?  Note that we don't program the Toshiba
> directly, we only send commands to the Atmel.

I'm not too familiar with the hardware architecture, let me have a look. Is 
the schematics publicly available somewhere ?

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
