Return-Path: <SRS0=mxgJ=FQ=jmondi.org=jacopo+renesas@kernel.org>
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH 3/6] arm64: dts: renesas: r8a77965: Remove stale reg property
Date: Thu, 22 Feb 2018 20:06:07 +0100
Message-Id: <1519326370-15805-4-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1519326370-15805-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1519326370-15805-1-git-send-email-jacopo+renesas@jmondi.org>
To: arnd@arndb.de, geert@linux-m68k.org, horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Remove "reg" property from cache-controller-0 device node as it does not
have any unit address.

This silences the following DTC compiler warning:
Warning (unit_address_vs_reg): Node /cpus/cache-controller-0 has a reg
or ranges property, but no unit name

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index ab46cd2..be4f25c 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -47,7 +47,6 @@
 
 		L2_CA57: cache-controller-0 {
 			compatible = "cache";
-			reg = <0>;
 			power-domains = <&sysc 12>;
 			cache-unified;
 			cache-level = <2>;
-- 
2.7.4
