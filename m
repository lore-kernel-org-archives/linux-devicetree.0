From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 0/2] pinctrl: meson-gx: Add HDMI HDP/DDC pins functions
Date: Tue, 17 Jan 2017 13:05:36 +0100
Message-ID: <1484654738-5496-1-git-send-email-narmstrong@baylibre.com>
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
To: khilman@baylibre.com, carlo@caione.org, linus.walleij@linaro.org
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

In order to support HDMI HPD and DDC, add missing functions in pinctrl
driver and add corresponding nodes in dts for GXBB and GXL.

Neil Armstrong (2):
  pinctrl: meson: Add HDMI HPD/DDC pins functions
  ARM64: dts: meson-gx: Add HDMI HPD/DDC pinctrl nodes

 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 14 ++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi  | 14 ++++++++++++++
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c  | 19 +++++++++++++++++++
 drivers/pinctrl/meson/pinctrl-meson-gxl.c   | 19 +++++++++++++++++++
 4 files changed, 66 insertions(+)

-- 
1.9.1
