From: Loys Ollivier <lollivier@baylibre.com>
Subject: [PATCH 0/3] riscv: add SOC_SIFIVE config for SiFive specific resource
Date: Mon, 17 Jun 2019 21:29:47 +0200
Message-ID: <1560799790-20287-1-git-send-email-lollivier@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>
Cc: Loys Ollivier <lollivier@baylibre.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>
List-Id: devicetree@vger.kernel.org

Hello,

Following is a patch series that adds a SOC_SIFIVE config.
The purpose of this config is to group all the code specific to the SiFive
architecture such as device tree and platform drivers.

The initial thought/discussion came from [0].

[0] https://lore.kernel.org/linux-riscv/20190602080500.31700-1-paul.walmsley@sifive.com/

Loys Ollivier (3):
  arch: riscv: add config option for building SiFive's SoC resource
  riscv: select SiFive platform drivers with SOC_SIFIVE
  riscv: defconfig: enable SOC_SIFIVE

 arch/riscv/Kconfig                  |  2 ++
 arch/riscv/Kconfig.socs             | 13 +++++++++++++
 arch/riscv/boot/dts/sifive/Makefile |  2 +-
 arch/riscv/configs/defconfig        |  6 +-----
 4 files changed, 17 insertions(+), 6 deletions(-)
 create mode 100644 arch/riscv/Kconfig.socs

-- 
2.7.4
