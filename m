From: =?UTF-8?q?Myl=C3=A8ne=20Josserand?=
        <mylene.josserand@free-electrons.com>
Subject: [PATCH v2 5/5] arm: dts: sun8i: a83t: Fix undefined offset with virtual timer
Date: Fri, 29 Dec 2017 11:55:06 +0100
Message-ID: <20171229105506.24851-6-mylene.josserand@free-electrons.com>
References: <20171229105506.24851-1-mylene.josserand@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171229105506.24851-1-mylene.josserand@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: maxime.ripard@free-electrons.com, wens@csie.org, linux@armlinux.org.uk, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, clabbe.montjoie@gmail.com, thomas.petazzoni@free-electrons.com, mylene.josserand@free-electrons.com, quentin.schulz@free-electrons.com
List-Id: devicetree@vger.kernel.org

The ARM architected timers use an offset between their physical and
virtual counters. That offset should be configured by the bootloader
in CNTVOFF.

However, the A83t bootloader fails to do so, and we end up with an
undefined offset (which in our case is random), meaning that each CPU
will have a different time, which isn't working very well.

Fix that by setting the arm,cpu-registers-not-fw-configured that will
make Linux use the physical timers instead of the virtual ones. One
possible side effect would be that the virtualization features would
be disabled. However, due to the way the GIC has been integrated in
the system, it is already unusable so we're effectively not losing any
feature.

Signed-off-by: Mylène Josserand <mylene.josserand@free-electrons.com>
---
 arch/arm/boot/dts/sun8i-a83t.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
index aa27ffb7db81..ddcd90ae3a73 100644
--- a/arch/arm/boot/dts/sun8i-a83t.dtsi
+++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
@@ -121,6 +121,7 @@
 			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
+		arm,cpu-registers-not-fw-configured;
 	};
 
 	clocks {
-- 
2.11.0
