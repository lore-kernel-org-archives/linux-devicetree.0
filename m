From: Hong Xu <hong.xu@atmel.com>
Subject: [PATCH v2 0/3] Add support for Atmel's AT91SAM9N12-EK (With DT)
Date: Mon, 16 Apr 2012 17:39:24 +0800
Message-ID: <1334569167-7064-1-git-send-email-hong.xu@atmel.com>
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
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: nicolas.ferre@atmel.com
Cc: devicetree-discuss@lists.ozlabs.org, plagnioj@jcrosoft.com, Hong Xu <hong.xu@atmel.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This series adds support for Atmel's AT91SAM9N12-EK.

Patches are on top of v3.4-rc2 and target for v3.5

Hong Xu (3):
  AT91: Add DT description files for AT91SAM9N12-EK
  AT91: Add machine header file for AT91SAM9N12 SoC
  AT91: Add machine files for AT91SAM9N12 SoC

 arch/arm/boot/dts/at91sam9n12.dtsi                 |  223 ++++++++++++++++
 arch/arm/boot/dts/at91sam9n12ek.dts                |   99 +++++++
 arch/arm/mach-at91/Kconfig                         |    9 +
 arch/arm/mach-at91/Makefile                        |    1 +
 arch/arm/mach-at91/Makefile.boot                   |    2 +
 arch/arm/mach-at91/at91sam9n12.c                   |  275 ++++++++++++++++++++
 arch/arm/mach-at91/clock.c                         |   15 +-
 arch/arm/mach-at91/include/mach/at91sam9n12.h      |   60 +++++
 .../mach-at91/include/mach/at91sam9n12_matrix.h    |   53 ++++
 arch/arm/mach-at91/include/mach/cpu.h              |   10 +
 arch/arm/mach-at91/include/mach/hardware.h         |    2 +
 arch/arm/mach-at91/setup.c                         |    6 +
 arch/arm/mach-at91/soc.h                           |    5 +
 13 files changed, 755 insertions(+), 5 deletions(-)
 create mode 100644 arch/arm/boot/dts/at91sam9n12.dtsi
 create mode 100644 arch/arm/boot/dts/at91sam9n12ek.dts
 create mode 100644 arch/arm/mach-at91/at91sam9n12.c
 create mode 100644 arch/arm/mach-at91/include/mach/at91sam9n12.h
 create mode 100644 arch/arm/mach-at91/include/mach/at91sam9n12_matrix.h

-- 
1.7.10
