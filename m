From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH 0/3] arm: owl: Add initial Allo Sparky support
Date: Tue, 14 Nov 2017 19:01:11 +0100
Message-ID: <20171114180114.26408-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Thomas Liau <thomas.liau@actions-semi.com>, Jeff Chen <jeff.chen@actions-semi.com>, =?UTF-8?q?=E5=BC=A0=E4=B8=9C=E9=A3=8E?= <zhangdf@actions-semi.com>, =?UTF-8?q?=E5=88=98=E7=82=9C?= <liuwei@actions-semi.com>, =?UTF-8?q?=E5=BC=A0=E5=A4=A9=E7=9B=8A?= <tyzhang@actions-semi.com>, =?UTF-8?q?=E6=A2=85=E5=88=A9?= <harrymei@actions-semi.com>, Ioan B <ioan@allo.com>, Sudeep Kumar <sudeepkumar@cem-solutions.net>, linux-kernel@vger.kernel.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, "Andre M . Strul" <andre@allo.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello,

This series adds a Device Tree for the Allo.com Sparky SBC.

Cf. https://en.opensuse.org/HCL:Sparky

Work branch:
https://github.com/afaerber/linux/commits/bg96-next

Have a lot of fun!

Cheers,
Andreas

Cc: Andre M. Strul <andre@allo.com>
Cc: Ioan B. <ioan@allo.com>
Cc: Sudeep Kumar <sudeepkumar@cem-solutions.net>
Cc: Jeff Chen <jeff.chen@actions-semi.com>

Cc: devicetree@vger.kernel.org

Andreas Färber (3):
  dt-bindings: Add vendor prefix for Allo.com
  dt-bindings: arm: actions: Add Sparky
  arm: dts: owl-s500: Add Sparky

 Documentation/devicetree/bindings/arm/actions.txt  |  1 +
 .../devicetree/bindings/vendor-prefixes.txt        |  1 +
 arch/arm/boot/dts/Makefile                         |  3 +-
 arch/arm/boot/dts/owl-s500-sparky.dts              | 44 ++++++++++++++++++++++
 4 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/owl-s500-sparky.dts

-- 
2.13.6
