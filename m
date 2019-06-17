From: Loys Ollivier <lollivier@baylibre.com>
Subject: [PATCH 2/3] riscv: select SiFive platform drivers with SOC_SIFIVE
Date: Mon, 17 Jun 2019 21:29:49 +0200
Message-ID: <1560799790-20287-3-git-send-email-lollivier@baylibre.com>
References: <1560799790-20287-1-git-send-email-lollivier@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560799790-20287-1-git-send-email-lollivier@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>
Cc: Loys Ollivier <lollivier@baylibre.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>
List-Id: devicetree@vger.kernel.org

On selection of SOC_SIFIVE select the corresponding platform drivers.

Signed-off-by: Loys Ollivier <lollivier@baylibre.com>
---
 arch/riscv/Kconfig.socs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 60dae1b5f276..536c0ef4aee8 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -2,6 +2,11 @@ menu "SoC selection"
 
 config SOC_SIFIVE
        bool "SiFive SoCs"
+       select SERIAL_SIFIVE
+       select SERIAL_SIFIVE_CONSOLE
+       select CLK_SIFIVE
+       select CLK_SIFIVE_FU540_PRCI
+       select SIFIVE_PLIC
        help
          This enables support for SiFive SoC platform hardware.
 
-- 
2.7.4
