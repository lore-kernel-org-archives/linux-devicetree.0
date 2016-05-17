From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 0/6] ARM: dts: sun5i: q8-common: Enable various peripherals
Date: Tue, 17 May 2016 23:56:05 +0800
Message-ID: <1463500571-28970-1-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>, David Airlie <airlied@linux.ie>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi everyone,

This series enables more peripherals for Allwinner A13-based Q8 devices.
The peripherals include the WiFi, the PMIC's micro-usb power supply
(driver), audio codec (headphone and speaker), and full display support
with the new DRM KMS driver. The series is based on parts of Maxime's
"drm: Add Support for Passive RGB to VGA bridges" series, specifically
the clk and drm fixes, and common DTS bits.

Hans, since you have a collection of q8 tablets, I'm hoping you could
test these bits and provide some feedback.


Patch 1 is a small fix for part of the init failure path.

Patch 2 disables ldo5 on the axp209 by default. This regulator output is
muxed with a gpio, and the regulator on/off settings override the gpio.

Patch 3 enables the USB WiFi module found.

Patch 4 enables the USB/VBUS power supply of the PMIC.

Patch 5 enables the audio codec, with support for the speaker amp.

Patch 6 enables the LCD panel with the display pipeline.


Regards
ChenYu


Chen-Yu Tsai (6):
  drm: sun4i: do cleanup if RGB output init fails
  ARM: dts: axp209: Disable ldo5 by default
  ARM: dts: sun5i: q8-common: Enable USB-based WiFi
  ARM: dts: sun5i: q8-common: Enable USB power supply
  ARM: dts: sun5i: q8-common: Enable audio codec
  ARM: dts: sun5i: q8-common: Enable display pipeline and LCD display

 arch/arm/boot/dts/axp209.dtsi          |  1 +
 arch/arm/boot/dts/sun5i-q8-common.dtsi | 62 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/sun4i/sun4i_tcon.c     |  6 +++-
 3 files changed, 68 insertions(+), 1 deletion(-)

-- 
2.8.1
