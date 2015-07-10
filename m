From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 0/3] ARM: add UART and EHCI support for UniPhier DTS and
 enable them.
Date: Fri, 10 Jul 2015 13:53:57 +0900
Message-ID: <1436504040-16375-1-git-send-email-yamada.masahiro@socionext.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Ray Jui <rjui@broadcom.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Kukjin Kim <kgene@kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Kumar Gala <galak@codeaurora.org>, Olof Johansson <olof@lixom.net>, Stephen Warren <swarren@nvidia.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Lee Jones <lee.jones@linaro.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The basic support for UniPhier SoC family (arch/arm/mach-uniphier)
was mainlined at Linux 4.2-rc1.
I am now tackling some drivers to support them in the mainline.

I've got UART and EHCI done, so I'd like to enable them from
the ARM-SOC subsystem.


Changes in v2:
  - Add chip-specific compatible strings "socionext,uniphier-ehci"

Masahiro Yamada (3):
  ARM: multi_v7_defconfig: enable UniPhier UART driver
  ARM: dts: UniPhier: add on-chip UART device nodes
  ARM: dts: UniPhier: add USB EHCI device nodes

 arch/arm/boot/dts/uniphier-ph1-ld4-ref.dts  | 29 +++++++++++--
 arch/arm/boot/dts/uniphier-ph1-ld4.dtsi     | 63 +++++++++++++++++++++++++++++
 arch/arm/boot/dts/uniphier-ph1-pro4-ref.dts | 29 +++++++++++--
 arch/arm/boot/dts/uniphier-ph1-pro4.dtsi    | 56 +++++++++++++++++++++++++
 arch/arm/boot/dts/uniphier-ph1-sld3-ref.dts | 36 +++++++++++++++--
 arch/arm/boot/dts/uniphier-ph1-sld3.dtsi    | 61 ++++++++++++++++++++++++++++
 arch/arm/boot/dts/uniphier-ph1-sld8-ref.dts | 33 +++++++++++++--
 arch/arm/boot/dts/uniphier-ph1-sld8.dtsi    | 63 +++++++++++++++++++++++++++++
 arch/arm/configs/multi_v7_defconfig         |  1 +
 9 files changed, 359 insertions(+), 12 deletions(-)

-- 
1.9.1
