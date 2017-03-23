From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/8] pinctrl: meson: add audio output pins
Date: Thu, 23 Mar 2017 17:50:53 +0100
Message-ID: <20170323165101.29262-1-jbrunet@baylibre.com>
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
To: Linus Walleij <linus.walleij@linaro.org>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
List-Id: devicetree@vger.kernel.org

This patchset adds the pinctrl definition and the related device-tree
bindings of the i2s output and spdif output pins on the meson gxbb and
gxl SoCs.

This is part of the ongoing work to bring audio output suppot on the
meson family. It was tested on the gxbb p200 and gxl p230.

Jerome Brunet (8):
  pinctrl: meson: gxbb: add i2s output pins
  pinctrl: meson: gxbb: add spdif output pins
  pinctrl: meson: gxl: add i2s output pins
  pinctrl: meson: gxl: add spdif output pins
  ARM64: dts: meson-gxbb: add i2s output pins
  ARM64: dts: meson-gxbb: add spdif output pins
  ARM64: dts: meson-gxl: add i2s output pins
  ARM64: dts: meson-gxl: add spdif output pins

 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 84 +++++++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi  | 83 ++++++++++++++++++++++++++++
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c  | 49 +++++++++++++++++
 drivers/pinctrl/meson/pinctrl-meson-gxl.c   | 49 +++++++++++++++++
 4 files changed, 265 insertions(+)

-- 
2.9.3
