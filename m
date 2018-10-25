From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH v3 0/3] of/fdt: Absorb ARM64's __early_init_dt_declare_initrd()
Date: Wed, 24 Oct 2018 17:17:39 -0700
Message-ID: <20181025001742.6510-1-f.fainelli@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com, Florian Fainelli <f.fainelli@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Marc Zyngier <marc.zyngier@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Christoffer Dall <christoffer.dall@arm.com>, Andrey Konovalov <andreyknvl@google.com>, "moderated list:ARM64 PORT
        AARCH64 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE" <devicetree@vger.kernel.org>, arnd@arndb.de
List-Id: devicetree@vger.kernel.org

Hi all,

Based on Rob's suggestion, this is a follow-up to the patch series
posted here previously that aims at cutting the ARM64 rebuild
time/number of objects. Rob indicated that he was adamant to just having
drivers/of/fdt.c contain the ARM64 specific behavior, so this patch
series does exactly that.

https://www.spinics.net/lists/devicetree/msg255512.html

Florian Fainelli (3):
  of/fdt: Absorb ARM64's __early_init_dt_declare_initrd()
  arm64: Remove custom __early_init_dt_declare_initrd implenentation
  of/fdt: Remove definition check for __early_init_dt_declare_initrd

 arch/arm64/include/asm/memory.h | 8 --------
 drivers/of/fdt.c                | 7 +++++--
 2 files changed, 5 insertions(+), 10 deletions(-)

-- 
2.17.1
