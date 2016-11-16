From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v4 0/2] ARM: dts: sun6i: hummingbird-a31: Enable
 display output through VGA bridge
Date: Wed, 16 Nov 2016 23:42:30 +0800
Message-ID: <20161116154232.872-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBB3H4WHAQKGQEMY2VWYQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

This is v4 of my sun6i DRM/KMS display enablement series. It adds
regulator support to the dumb-vga-dac bridge and enables the VGA
output on the A31 Hummingbird.


Changes since v3:

  - Add Rob's Ack.

  - Fix up enable/disable callbacks as Archit suggested.

  - Dropped pinmux settings for GPIO pin.

Changes since v2:

  - Changed the enable-gpio of dumb-vga-dac to vdd-supply regulator.
    This better matches the hardware that I have: the DAC has a fixed
    regulator dropping the voltage from the board-wide 5V to 3.3V the
    DAC uses. The regulator is controlled through a GPIO pin.

  - Renamed the node of the VGA connector from "vga" to "vga-connector".

  - Renamed the node of the VGA DAC from "bridge" to "vga-dac".


Regards
ChenYu


Chen-Yu Tsai (2):
  drm/bridge: dumb-vga-dac: Support a VDD regulator supply
  ARM: dts: sun6i: hummingbird-a31: Enable display output through VGA
    bridge

 .../bindings/display/bridge/dumb-vga-dac.txt       |  2 +
 arch/arm/boot/dts/sun6i-a31-hummingbird.dts        | 67 ++++++++++++++++++++++
 drivers/gpu/drm/bridge/dumb-vga-dac.c              | 35 +++++++++++
 3 files changed, 104 insertions(+)

-- 
2.10.2
