From: Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v1 0/3] arm: npcm: add basic support for Nuvoton BMCs
Date: Mon, 21 Aug 2017 20:34:59 -0700
Message-ID: <20170822033502.4100-1-brendanhiggins@google.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, avifishman70@gmail.com, tmaimon77@gmail.com, raltherr@google.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

This patch set adds support for the Nuvoton NPCM Baseboard Management Controller
(BMC) SoC architecture as well as the NPCM750 variant. NPCM is an ARM based SoC
with external DDR RAM and supports a large set of peripherals.

The NPCM750 is based on Cortex A9 and comes in single core and dual core
flavors.

The device tree added in this patchset has a number of bindings for which the
corresponding drivers will be sent out later and thus do not yet have binding
documentation. Apologies in advance if you would like the bindings to be added
along with the corresponding drivers.

Thanks!
