From: Peter Rosin <peda@axentia.se>
Subject: [RFC PATCH 0/3] allow override of bus format in bridges
Date: Sat, 17 Mar 2018 23:15:22 +0100
Message-ID: <20180317221525.18534-1-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Daniel Vetter <daniel.vetter@intel.com>, Gustavo Padovan <gustavo@padovan.org>, Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

I'm trying to get something to work that I assumed would not
need patches, so I think I might be missing something completely
obvious...

I have an Atmel sama5d31 hooked up to an lvds encoder and then
on to an lvds panel. Which seems like something that has been
done one or two times before...

The problem (I think) is that the bus_format of the SoC and the
panel do not agree. The SoC driver (atmel-hlcdc) can handle the
rgb444, rgb565, rgb666 and rgb888 bus formats. The hardware is
wired for the rgb565 case. The lvds encoder supports rgb888 on
its input side with the LSB wires simply pulled down internally
in the encoder in my case. And the panel is expecting lvds
(vesa-24), which is what the encoder outputs.

The reason I "blame" the bus_format of the drm_connector is that
with the below DT snippet, things do not work *exactly* due to
that. At least, it starts to work if I hack the panel-lvds driver
to report the rgb565 bus_format instead of vesa-24.

	panel: panel {
		compatible = "panel-lvds";

		width-mm = <476>;
		height-mm = <268>;

		data-mapping = "vesa-24";

		panel-timing {
			// 1024x768 @ 60Hz (typical)
			clock-frequency = <52140000 65000000 71100000>;
			hactive = <1024>;
			vactive = <768>;
			hfront-porch = <59 107 107>;
			hback-porch = <59 107 107>;
			hsync-len = <59 106 106>;
			vfront-porch = <8 13 14>;
			vback-porch = <8 13 14>;
			vsync-len = <8 12 14>;
		};

		port {
			panel_input: endpoint {
				remote-endpoint = <&lvds_encoder_output>;
			};
		};
	};

	lvds-encoder {
		compatible = "ti,ds90c187", "lvds-encoder";

		ports {
			#address-cells = <1>;
			#size-cells = <0>;

			port@0 {
				reg = <0>;

				lvds_encoder_input: endpoint {
					remote-endpoint = <&hlcdc_output>;
				};
			};

			port@1 {
				reg = <1>;

				lvds_encoder_output: endpoint {
					remote-endpoint = <&panel_input>;
				};
			};
		};
	};

But, instead of perverting the panel-lvds driver with support
for a totally fake non-lvds bus_format, I came up with an optional
bus_format override in the lvds-encoder driver, which I trigger with
this addition to the lvds-encoder DT node:

		interface-pix-fmt = "rgb565";

There are some issues with the interface-pix-fmt name. I copied it
from the freescale fsl-imx-drm binding, but a) I personally don't
like how that binding uses rgb24 instead of rgb888 and b) I don't
like how the implementation of that binding selects rgb666 when you
say bgr666 in the DT, but for parallel hardware interface the bit
order is not really relevant so I swallowed that. Anyway, it might
be better to use something else than interface-pix-fmt? Perhaps
reuse the "data-mapping" name from the panel-lvds binding? But that
seems somewhat lvds specific? Then there a couple of instances of
"bus-format-override" in some dtsi files, but that name is not
mentioned in any binding, nor in (upstream) code...

And maybe it should be fourcc codes or something instead of these
"rgb565" names?

I threw in the first patch, since that is the actual lvds encoder
I have in this case.

Suggestions welcome.

Cheers,
Peter

Peter Rosin (3):
  dt-bindings: display: bridge: lvds-transmitter: add ti,ds90c185
  drm: bridge: panel: allow override of the bus format
  drm: bridge: lvds-encoder: on request, override the bus format

 .../bindings/display/bridge/lvds-transmitter.txt   | 13 +++++++++++++
 drivers/gpu/drm/bridge/lvds-encoder.c              | 18 ++++++++++++++++++
 drivers/gpu/drm/bridge/panel.c                     | 22 +++++++++++++++++++++-
 include/drm/drm_bridge.h                           |  1 +
 4 files changed, 53 insertions(+), 1 deletion(-)

-- 
2.11.0
