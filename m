From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v4 0/6] Add Meson 8b / GXBB support to the IR driver
Date: Fri, 19 Aug 2016 23:55:41 +0200
Message-ID: <20160819215547.20063-1-martin.blumenstingl@googlemail.com>
References: <20160628191802.21227-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160628191802.21227-1-martin.blumenstingl@googlemail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-media@vger.kernel.org, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, narmstrong@baylibre.com, khilman@baylibre.com, carlo@caione.org
Cc: mark.rutland@arm.com, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, catalin.marinas@arm.com, linus.walleij@linaro.org, will.deacon@arm.com, robh+dt@kernel.org, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Newer Amlogic platforms (Meson 8b and GXBB) use a slightly different
register layout for their Infrared Remoete Controller. The decoder mode
is now configured in another register. Without the changes to the
meson-ir driver we are simply getting incorrect "durations" reported
from the hardware (because the hardware is not in time measurement aka
software decode mode).

This problem was also noticed by some people trying to use this on an
ODROID-C1 and ODROID-C2 - the workaround there (probably because the
datasheets were not publicy available yet at that time) was to switch
to ir_raw_event_store_edge (which leaves it up to the kernel to measure
the duration of a pulse). See [0] and [1] for the corresponding
patches.

Changes in v4:
- added support for pinctrl configuration which makes it possible to
  use the IR decoder when doing a cold-boot. Without these pinctrl
  changes the IR decoder was only working when booting into stock
  Android, then rebooting and booting the mainline kernel (with the
  other patches from this series). Thanks to Kevin Hilman for spotting
  this issue.
- rebased dts changes to Kevin's v4.8/integ branch

As discussed on IRC (thanks Neil):

Tested-by: Neil Armstrong <narmstrong@baylibre.com>


[0] https://github.com/erdoukki/linux-amlogic-1/commit/969b2e2242fb14a13cb651f9a1cf771b599c958b
[1] http://forum.odroid.com/viewtopic.php?f=135&t=20504


Martin Blumenstingl (3):
  pinctrl: amlogic: gxbb: add the IR remote pin
  ARM64: dts: amlogic: add the pin for the IR remote
  ARM64: dts: meson-gxbb: Enable the the IR decoder on supported boards

Neil Armstrong (3):
  dt-bindings: media: meson-ir: Add Meson8b and GXBB compatible strings
  media: rc: meson-ir: Add support for newer versions of the IR decoder
  ARM64: dts: meson-gxbb: Add Infrared Remote Controller decoder

 .../devicetree/bindings/media/meson-ir.txt         |  5 +++-
 .../arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts |  6 +++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi   |  6 +++++
 .../boot/dts/amlogic/meson-gxbb-vega-s95.dtsi      |  6 +++++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        | 14 +++++++++++
 drivers/media/rc/meson-ir.c                        | 29 ++++++++++++++++++----
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c         |  8 ++++++
 7 files changed, 68 insertions(+), 6 deletions(-)

-- 
2.9.3
