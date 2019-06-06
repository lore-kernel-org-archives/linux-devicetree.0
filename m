From: Keerthy <j-keerthy@ti.com>
Subject: [RFC RESEND PATCH v2 0/4] arm64: dts: ti: am6: Add gpio nodes
Date: Thu, 6 Jun 2019 15:26:16 +0530
Message-ID: <20190606095620.6211-1-j-keerthy@ti.com>
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
To: t-kristo@ti.com, nm@ti.com, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, lokeshvutla@ti.com, j-keerthy@ti.com, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, bgolaszewski@baylibre.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

K3 AM6 platform has 2 instances of gpio banks on main domain
and 1 instance on wakeup domin. All are capable of generating
banked interrupts.

This series also adds 2 goio_keys nodes connected to SW6 SW5
switches and tested for gpio_keys interrupts.

The series depends on:
https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=112791

Posting as RFC as it has dependencies to be merged.

Resending with the linux-gpio and gpio Maintainers copied.

Changes in v2:

  * Added a separate am654 compatible. 

Keerthy (4):
  dt-bindings: gpio: davinci: Add k3 am654 compatible
  arm64: dts: ti: am6-wakeup: Add gpio node
  arm64: dts: ti: am6-main: Add gpio nodes
  arm64: dts: ti: am654-base-board: Add gpio_keys node

 .../devicetree/bindings/gpio/gpio-davinci.txt | 18 +++++++++++
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi      | 32 +++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi    | 15 +++++++++
 .../arm64/boot/dts/ti/k3-am654-base-board.dts | 27 ++++++++++++++++
 4 files changed, 92 insertions(+)

-- 
2.17.1
