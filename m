From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 0/3] ARM: dts: uniphier: DTS updates for UniPhier SoCs for
 Linux 4.14-rc1
Date: Thu, 15 Oct 2015 18:05:31 +0900
Message-ID: <1444899934-4754-1-git-send-email-yamada.masahiro@socionext.com>
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
To: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Hi Olof and Arnd,

Please apply this series to ARM-SOC for the next merge window.

Thanks
Masahiro Yamada



Masahiro Yamada (3):
  ARM: dts: uniphier: change the external bus address mapping
  ARM: dts: uniphier: add ProXstream2 Vodka board support
  ARM: dts: uniphier: add ProXstream2 Gentil board support

 arch/arm/boot/dts/Makefile                        |  4 +-
 arch/arm/boot/dts/uniphier-ph1-ld4-ref.dts        |  5 +-
 arch/arm/boot/dts/uniphier-ph1-ld6b-ref.dts       |  5 +-
 arch/arm/boot/dts/uniphier-ph1-pro4-ref.dts       |  5 +-
 arch/arm/boot/dts/uniphier-ph1-sld3-ref.dts       |  5 +-
 arch/arm/boot/dts/uniphier-ph1-sld8-ref.dts       |  5 +-
 arch/arm/boot/dts/uniphier-proxstream2-gentil.dts | 79 +++++++++++++++++++++++
 arch/arm/boot/dts/uniphier-proxstream2-vodka.dts  | 79 +++++++++++++++++++++++
 8 files changed, 171 insertions(+), 16 deletions(-)
 create mode 100644 arch/arm/boot/dts/uniphier-proxstream2-gentil.dts
 create mode 100644 arch/arm/boot/dts/uniphier-proxstream2-vodka.dts

-- 
1.9.1
