From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 0/3] ARM64: meson-gxbb: Add WeTek Boards
Date: Wed, 18 Jan 2017 11:50:39 +0100
Message-ID: <1484736642-5451-1-git-send-email-narmstrong@baylibre.com>
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
To: khilman@baylibre.com, carlo@caione.org
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org

This serie adds support for the WeTek Hub and Play2 boards.
The Hub is an extremely small IPTv Set-Top-Box and the Play2 is a more
traditionnal Satellite or Terrestrial and IPTv Set-Top-Box.

Both are based on the p200 Reference Design and out-of-tree support is
based on OpenELEC kernel at [1].

[1] https://github.com/wetek-enigma/linux-amlogic

Neil Armstrong (3):
  dt-bindings: vendor-prefix: Add wetek vendor prefix
  ARM64: dts: meson-gxbb: Add support for WeTek Hub and Play
  dt-bindings: amlogic: Add WeTek boards

 Documentation/devicetree/bindings/arm/amlogic.txt  |  2 +
 .../devicetree/bindings/vendor-prefixes.txt        |  1 +
 arch/arm64/boot/dts/amlogic/Makefile               |  2 +
 .../boot/dts/amlogic/meson-gxbb-wetek-hub.dts      | 66 +++++++++++++++
 .../boot/dts/amlogic/meson-gxbb-wetek-play2.dts    | 94 ++++++++++++++++++++++
 5 files changed, 165 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts

-- 
1.9.1
