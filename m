From: Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v4 0/2] arm64: rockchip: support RK3399 Ficus board
Date: Fri,  6 Jul 2018 12:08:16 -0300
Message-ID: <20180706150818.5631-1-ezequiel@collabora.com>
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
To: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Fourth round for the RK3399 Ficus support.

Changes from v3:
 * Fixed a regulator node name, as noted by Rob.
 * Fixed wrong alphabetical order in vendors prefix patch, also noted by Rob.

Changes from v2:
 * Dropped rk3399.dtsi changes and rebased on top of Randy's patch.
 * Removed double empty line.
 * Coalesced schematics comment

Changes from v1:
 * Dropoed USB support as it's not working.
 * Added schematics.
 * Splitted rk3399.dtsi from new ficus.dts file.
 * Added new vendor.
 * Cleaned regulators syntax and stlye.

Series based on: 600b359d2b98 ("arm64: dts: rockchip: add some common pin-settings to rk3399").

Ezequiel Garcia (2):
  dt-bindings: Add vendor prefix for Vamrs Ltd.
  arm64: dts: rockchip: add 96boards RK3399 Ficus board

 .../devicetree/bindings/arm/rockchip.txt      |   5 +
 .../devicetree/bindings/vendor-prefixes.txt   |   1 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 arch/arm64/boot/dts/rockchip/rk3399-ficus.dts | 514 ++++++++++++++++++
 4 files changed, 521 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-ficus.dts

-- 
2.18.0.rc2
