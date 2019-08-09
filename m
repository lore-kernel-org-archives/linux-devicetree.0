From: Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH 0/6] arm64: dts: ti: k3-j721e: Add gpio nodes
Date: Fri, 9 Aug 2019 13:59:41 +0530
Message-ID: <20190809082947.30590-1-lokeshvutla@ti.com>
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
To: Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>, linus.walleij@linaro.org
Cc: Device Tree Mailing List <devicetree@vger.kernel.org>, Lokesh Vutla <lokeshvutla@ti.com>, Keerthy <j-keerthy@ti.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

This series adds gpio nodes for J721E SoC and enable gpio keys
in J72E common process board.

Tested Boot log: https://pastebin.ubuntu.com/p/P6QqmZYtSC/

This series depends on Power-domain cells update series:
https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=152109


Lokesh Vutla (5):
  dt-bindings: gpio: davinci: Add new compatible for J721E SoCs
  arm64: dts: ti: k3-j721e: Add gpio nodes in main domain
  arm64: dts: ti: k3-j721e: Add gpio nodes in wakeup domain
  arm64: dts: ti: k3-j721e-common-proc-board: Disable unused gpio
    modules
  dt-bindings: pinctrl: k3: Introduce pinmux definitions for J721E

Nikhil Devshatwar (1):
  arm64: dts: k3-j721e: Add gpio-keys on common processor board

 .../devicetree/bindings/gpio/gpio-davinci.txt |   1 +
 .../dts/ti/k3-j721e-common-proc-board.dts     |  65 +++++++++
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi     | 132 ++++++++++++++++++
 .../boot/dts/ti/k3-j721e-mcu-wakeup.dtsi      |  34 +++++
 include/dt-bindings/pinctrl/k3.h              |   3 +
 5 files changed, 235 insertions(+)

-- 
2.22.0
