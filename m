From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 0/5] ARM64: dts: meson: Add CEC,
 Ethernet Link and SPI pins nodes
Date: Wed, 24 May 2017 10:28:20 +0200
Message-ID: <1495614505-4437-1-git-send-email-narmstrong@baylibre.com>
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
To: khilman@baylibre.com
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org

This patchset adds the following DT Pins nodes :
 - CEC Pins for GXBB and GXL
 - SPICC Pins for GXBB and GXL
 - Internal Ethernet PHY LEDS pins for GXL

Neil Armstrong (5):
  ARM64: dts: meson-gxbb: Add CEC pins nodes
  ARM64: dts: meson-gxl: Add CEC pins nodes
  ARM64: dts: meson-gxl: Add Ethernet PHY LEDS pins nodes
  ARM64: dts: meson-gxbb: Add SPI pinctrl nodes
  ARM64: dts: meson-gxl: Add SPI pinctrl nodes

 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 30 ++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi  | 44 +++++++++++++++++++++++++++++
 2 files changed, 74 insertions(+)

-- 
1.9.1
