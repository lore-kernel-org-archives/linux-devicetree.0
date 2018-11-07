From: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Subject: [PATCH v3 0/8] BL035-RGB-002 3.5" LCD sunxi DRM support
Date: Wed,  7 Nov 2018 19:18:35 +0100
Message-ID: <20181107181843.27628-1-contact@paulk.fr>
Reply-To: contact-W9ppeneeCTY@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBC75HK6WUAEBBY6YRTPQKGQEUCPIEHA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Mark Van den Borre <mark-8Ycg9RsmSNMdnm+yROfE0A@public.gmane.org>, Gerry Demaret <gerry-8Ycg9RsmSNMdnm+yROfE0A@public.gmane.org>, Luc Verhaegen <libv-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The series adds support for the BL035-RGB-002 LCD panel and the required
device-tree bindings for using it on the BananaPi M1.

Only the changes related to the DRM driver and the panel are submitted
for merge, which does not include the two final commits.

Changes since v2:
* Split the commit using the encoder instead of panel;
* Mentionned that the lemaker prefix was already used;
* Included all properties in the panel binding documentation;
* Fixed panel binding in BananaPi device-tree;
* Switched backlight levels to a 1.8-gamma-corrected table.

Changes since v1:
* Rebased on drm-misc next;
* Used the full name of the panel for dt bindings;
* Removed helper to match flags in order to only retrieve the connector
  once, as it was already done.
* Made the bus flags checking possible without a panel;

Paul Kocialkowski (8):
  drm/sun4i: tcon: Pass encoder to RGB setup function
  drm/sun4i: tcon: Get the connector from the encoder in RGB setup
  drm/sun4i: tcon: Support an active-low DE signal with RGB interface
  dt-bindings: Add vendor prefix for LeMaker
  dt-bindings: Add bindings for the LeMaker BL035-RGB-002 LCD panel
  drm/panel: simple: Add support for the LeMaker BL035-RGB-002 3.5" LCD
  ARM: dts: sun7i: Add pinmux configuration for LCD0 RGB888 pins
  ARM: dts: sun7i-a20-bananapi: Add bindings for the LeMaker 3.5" LCD

 .../display/panel/lemaker,bl035-rgb-002.txt   | 12 ++++
 .../devicetree/bindings/vendor-prefixes.txt   |  1 +
 arch/arm/boot/dts/sun7i-a20-bananapi.dts      | 71 +++++++++++++++++++
 arch/arm/boot/dts/sun7i-a20.dtsi              | 11 +++
 drivers/gpu/drm/panel/panel-simple.c          | 27 +++++++
 drivers/gpu/drm/sun4i/sun4i_tcon.c            | 29 ++++----
 drivers/gpu/drm/sun4i/sun4i_tcon.h            |  1 +
 7 files changed, 138 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/lemaker,bl035-rgb-002.txt

-- 
2.19.1
