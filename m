From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v2 0/6] drm/sun4i: Support color dithering for
 LCD panels
Date: Fri,  7 Sep 2018 12:19:42 +0800
Message-ID: <20180907041948.19913-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBB2XYY7OAKGQEVUCJX5Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Jonathan Liu <net147-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


Hi,

This is v2 of my sun4i-drm LCD color dithering series. v1 was from back
in April [1]. Most of the driver code is unchanged.

Changes since v1:

  - Explicitly list properties from the simple-panel binding that apply
    to the Bananapi 7" panel

  - Moved an incorrectly squashed change from patch 3 to patch 1, where
    it belongs


[1] https://patchwork.ozlabs.org/cover/900725/

Original cover letter follows:

Dithering is a method of approximating a color from a mixture of other
colors when the required color isn't available. It reduces color
banding artifacts that can be observed when displaying gradients
(e.g. grayscale gradients). This may occur when the image that needs
to be displayed is 24-bit but the LCD panel is a lower bit depth and
does not perform dithering on its own.

The TCON (LCD controller) found in Allwinner SoCs has hardware support
for dithering on channel 0, the channel used to feed LCD panels. This
series adds support for it.

Patch 1 reworks the mode set function for the CPU interface to pass
the encoder object, so it can be passed to other helper functions.

Patch 2 renames the dithering related register macros to reflect the
fact that dithering is only supported on channel 0.

Patch 3 adds support for dithering on all LCD panel output types.

Patch 4 adds support for Banana Pi's 7" DPI LCD panel.

Patch 5 adds a pinmux setting for RGB888 for the Allwinner A20 SoC.
This change has been sent by others before.

Patch 6 provides an example for enabling the Banana Pi 7" DPI LCD panel
on the Banana Pi M1+. This should not be merged. I will likely rework
this into an overlay in the future.

Note that I was only able to test dithering with DPI, as I do not have
other panel types. However the underlying concept and core code is the
same, as are the drm objects accessed. Nevertheless I'm hoping Jonathan
can test LVDS and Maxime can test MIPI DSI.

Also it seems pwm-backlight hardware is unusable at the moment. I'm not
sure whether the pwm-backlight or sun4i-pwm driver is to blame. I had to
manually poke the pwm registers so the LCD backlight wouldn't be
completely black.


Regards
ChenYu

Chen-Yu Tsai (5):
  drm/sun4i: tcon: Pass drm_encoder * into sun4i_tcon0_mode_set_cpu
  drm/sun4i: tcon: Rename Dithering related register macros
  drm/panel: simple: Add support for Banana Pi 7" S070WV20-CT16 panel
  ARM: dts: sun7i: add pinmux setting for RGB888 output for LCD0
  [DO NOT MERGE] ARM: dts: sun7i: bananapi-m1-plus: Enable Bananapi 7"
    800x480 RGB LCD panel

Jonathan Liu (1):
  drm/sun4i: tcon: Add dithering support for RGB565/RGB666 LCD panels

 .../display/panel/bananapi,s070wv20-ct16.txt  | 12 +++
 .../boot/dts/sun7i-a20-bananapi-m1-plus.dts   | 56 ++++++++++++++
 arch/arm/boot/dts/sun7i-a20.dtsi              | 11 +++
 drivers/gpu/drm/panel/panel-simple.c          | 25 ++++++
 drivers/gpu/drm/sun4i/sun4i_tcon.c            | 76 ++++++++++++++++---
 drivers/gpu/drm/sun4i/sun4i_tcon.h            | 27 ++++---
 6 files changed, 186 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/bananapi,s070wv20-ct16.txt

-- 
2.19.0.rc1
