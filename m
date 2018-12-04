From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH 0/2] meson: Fix IRQ trigger type
Date: Tue,  4 Dec 2018 16:04:45 +0000
Message-ID: <20181204160447.27869-1-ccaione@baylibre.com>
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
To: robh+dt@kernel.org, mark.rutland@arm.com, khilman@baylibre.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, martin.blumenstingl@googlemail.com
Cc: Carlo Caione <ccaione@baylibre.com>
List-Id: devicetree@vger.kernel.org

The wrong IRQ trigger type for the macirq was causing the connection
speed to drop after a few hours when stress testing the DUT. The fix
seems also to fix another long standing issue with EEE.

The fixes are tested on a AXG board but we think that the same fix is
valid also for all the others Amlogic SoC families.

Carlo Caione (2):
  arm64: dts: meson: Fix IRQ trigger type for macirq
  arm64: dts: meson: Remove eee-broken-1000t quirk

 arch/arm/boot/dts/meson.dtsi                        | 2 +-
 arch/arm/boot/dts/meson8b-odroidc1.dts              | 1 -
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts      | 1 -
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi          | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi           | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 1 -
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi   | 1 -
 7 files changed, 3 insertions(+), 7 deletions(-)

-- 
2.19.1
