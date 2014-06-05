From: Andrew Ruder <andrew.ruder@elecsyscorp.com>
Subject: [PATCH 4/6] arm: pxa2xx.dtsi: disable RTC by default
Date: Thu,  5 Jun 2014 14:27:06 -0500
Message-ID: <5a807a8d36ef3313b0d48a2fe88720f1fe246d7f.1401995177.git.andrew.ruder@elecsyscorp.com>
References: <cover.1401995177.git.andrew.ruder@elecsyscorp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1401995177.git.andrew.ruder@elecsyscorp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org
Cc: mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, linux@arm.linux.org.uk, pawel.moll@arm.com, linux-doc@vger.kernel.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, galak@codeaurora.org, Andrew Ruder <andrew.ruder@elecsyscorp.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This sets the status="disabled" flag in pxa2xx.dtsi in the same style as
the other optional components.  This can be overridden on a case-by-case
basis by boards that use this functionality.

Signed-off-by: Andrew Ruder <andrew.ruder@elecsyscorp.com>
---
 arch/arm/boot/dts/pxa2xx.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/pxa2xx.dtsi b/arch/arm/boot/dts/pxa2xx.dtsi
index c08f846..d233088 100644
--- a/arch/arm/boot/dts/pxa2xx.dtsi
+++ b/arch/arm/boot/dts/pxa2xx.dtsi
@@ -130,6 +130,7 @@
 			compatible = "marvell,pxa-rtc";
 			reg = <0x40900000 0x3c>;
 			interrupts = <30 31>;
+			status = "disabled";
 		};
 	};
 };
-- 
1.9.0.rc3.12.gbc97e2d
