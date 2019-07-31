From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH v2 0/4] Rework secure-monitor driver
Date: Wed, 31 Jul 2019 09:23:35 +0100
Message-ID: <20190731082339.20163-1-ccaione@baylibre.com>
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
To: srinivas.kandagatla@linaro.org, khilman@baylibre.com, narmstrong@baylibre.com, robh+dt@kernel.org, tglx@linutronix.de, jbrunet@baylibre.com, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Cc: Carlo Caione <ccaione@baylibre.com>
List-Id: devicetree@vger.kernel.org

The secure-monitor driver is currently in really bad shape, not my 
proudest piece of code (thanks Jerome for pointing that out ;). I tried 
to rework it a bit to make it a bit more tolerable.

I needed to change a bit the APIs and consequently adapt the only user 
we have, that is the nvmem/efuses driver. To not break bisectability I 
added one single commit to change both the drivers.

The remaining commits are cosmetic and DTS/docs fixes.

Changelog:
- Changed patches order to not break bisect
- Removed non-functional changes (PATCH 1/5) of the nvmem driver
- Fix gxbb/gxl DTS

Carlo Caione (4):
  firmware: meson_sm: Mark chip struct as static const
  nvmem: meson-efuse: bindings: Add secure-monitor phandle
  arm64: dts: meson: Link nvmem and secure-monitor nodes
  firmware: meson_sm: Rework driver as a proper platform driver

 .../bindings/nvmem/amlogic-efuse.txt          |  6 ++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi    |  1 +
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi   |  1 +
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi     |  1 +
 drivers/firmware/meson/meson_sm.c             | 96 +++++++++++++------
 drivers/nvmem/meson-efuse.c                   | 24 ++++-
 include/linux/firmware/meson/meson_sm.h       | 15 +--
 7 files changed, 104 insertions(+), 40 deletions(-)

-- 
2.20.1
