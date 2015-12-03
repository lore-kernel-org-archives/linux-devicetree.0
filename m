From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 0/2] ARM: dts: uniphier: clean up DTSIs by factoring the
 common parts out
Date: Thu,  3 Dec 2015 15:33:55 +0900
Message-ID: <1449124437-18479-1-git-send-email-yamada.masahiro@socionext.com>
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
To: arm@kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


Masahiro Yamada (2):
  ARM: dts: uniphier: change IRQ number of UART3 of PH1-Pro4 SoC
  ARM: dts: uniphier: factor out common nodes to uniphier-common32.dtsi

 arch/arm/boot/dts/uniphier-common32.dtsi    | 135 +++++++++++++
 arch/arm/boot/dts/uniphier-ph1-ld4.dtsi     | 265 +++++++++----------------
 arch/arm/boot/dts/uniphier-ph1-pro4.dtsi    | 288 ++++++++++------------------
 arch/arm/boot/dts/uniphier-ph1-pro5.dtsi    | 274 +++++++++-----------------
 arch/arm/boot/dts/uniphier-ph1-sld8.dtsi    | 266 +++++++++----------------
 arch/arm/boot/dts/uniphier-proxstream2.dtsi | 269 +++++++++-----------------
 6 files changed, 605 insertions(+), 892 deletions(-)
 create mode 100644 arch/arm/boot/dts/uniphier-common32.dtsi

-- 
1.9.1
