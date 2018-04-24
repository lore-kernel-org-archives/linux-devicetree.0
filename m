From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH 0/4] add additional required properties for UniPhier ethernet
 nodes
Date: Tue, 24 Apr 2018 13:46:59 +0900
Message-ID: <1524545223-5893-1-git-send-email-hayashi.kunihiko@socionext.com>
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
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Jassi Brar <jaswinder.singh@linaro.org>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Add required clocks and their names, resets and their names, and system
controller properties to fix the activation issues for the ethernet
controllers implemented on some UniPhier SoCs.

Kunihiko Hayashi (4):
  ARM: dts: uniphier: add required clocks and resets to Pro4 ethernet
    node
  arm64: dts: uniphier: add clock-names and reset-names to ethernet node
  ARM: dts: uniphier: add syscon-phy-mode property to each ethernet node
  arm64: dts: uniphier: add syscon-phy-mode property to each ethernet
    node

 arch/arm/boot/dts/uniphier-pro4.dtsi             | 10 +++++++---
 arch/arm/boot/dts/uniphier-pxs2.dtsi             |  3 +++
 arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi |  5 ++++-
 arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi |  3 +++
 arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi |  8 +++++++-
 5 files changed, 24 insertions(+), 5 deletions(-)

-- 
2.7.4
