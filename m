From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 0/3] arm,
 arm64: dts: uniphier: remove skeleton.dtsi inclusion and fix warnings
Date: Sun, 26 Feb 2017 14:04:06 +0900
Message-ID: <1488085449-28922-1-git-send-email-yamada.masahiro@socionext.com>
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
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Masahiro Yamada <yamada.masahiro@socionext.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

  - The inclusion of skeleton.dtsi is deprecated.
    Specify #address-cells and #size-cells explicitly

  - If built with W=1, many warnings are displayed.  Fix them.


Masahiro Yamada (3):
  ARM: dts: uniphier: remove skeleton.dtsi inclusion
  ARM: dts: uniphier: fix no unit name warnings
  arm64: dts: uniphier: fix no unit name warnings

 arch/arm/boot/dts/uniphier-ld4-ref.dts              | 2 +-
 arch/arm/boot/dts/uniphier-ld4.dtsi                 | 4 ++--
 arch/arm/boot/dts/uniphier-ld6b-ref.dts             | 2 +-
 arch/arm/boot/dts/uniphier-pro4-ace.dts             | 2 +-
 arch/arm/boot/dts/uniphier-pro4-ref.dts             | 2 +-
 arch/arm/boot/dts/uniphier-pro4-sanji.dts           | 2 +-
 arch/arm/boot/dts/uniphier-pro4.dtsi                | 4 ++--
 arch/arm/boot/dts/uniphier-pro5.dtsi                | 4 ++--
 arch/arm/boot/dts/uniphier-pxs2-gentil.dts          | 2 +-
 arch/arm/boot/dts/uniphier-pxs2-vodka.dts           | 2 +-
 arch/arm/boot/dts/uniphier-pxs2.dtsi                | 4 ++--
 arch/arm/boot/dts/uniphier-sld3-ref.dts             | 2 +-
 arch/arm/boot/dts/uniphier-sld3.dtsi                | 4 ++--
 arch/arm/boot/dts/uniphier-sld8-ref.dts             | 2 +-
 arch/arm/boot/dts/uniphier-sld8.dtsi                | 4 ++--
 arch/arm/boot/dts/uniphier-support-card.dtsi        | 2 +-
 arch/arm64/boot/dts/socionext/uniphier-ld11-ref.dts | 2 +-
 arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi    | 2 +-
 arch/arm64/boot/dts/socionext/uniphier-ld20-ref.dts | 2 +-
 arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi    | 2 +-
 20 files changed, 26 insertions(+), 26 deletions(-)

-- 
2.7.4
