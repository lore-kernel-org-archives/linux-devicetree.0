From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 0/3] ARM: add UART and EHCI support for UniPhier DTS and enable them.
Date: Mon,  6 Jul 2015 12:47:27 +0900
Message-ID: <1436154450-21102-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: arm@kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, devicetree@vger.kernel.org, Olof Johansson <olof@lixom.net>, Peter Griffin <peter.griffin@linaro.org>, linux-kernel@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Pawel Moll <pawel.moll@arm.com>, Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Ray Jui <rjui@broadcom.com>, linux-arm-kernel@lists.infradead.org, Stephen Warren <swarren@nvidia.com>
List-Id: devicetree@vger.kernel.org


The basic support for UniPhier SoC family (arch/arm/mach-uniphier)
was mainlined at Linux 4.1-rc1.
I am now tackling some drivers to support them in the mainline.

I've got UART and EHCI done, so I'd like to enable them from
the ARM-SOC subsystem.



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
