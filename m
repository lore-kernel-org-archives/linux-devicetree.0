From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH 07/12] Documentation: dt: imx: add MSCM documentation
Date: Wed,  3 Dec 2014 01:12:06 +0100
Message-ID: <1417565531-4507-8-git-send-email-stefan@agner.ch>
References: <1417565531-4507-1-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1417565531-4507-1-git-send-email-stefan@agner.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawn.guo@linaro.org, kernel@pengutronix.de, linux@arm.linux.org.uk, u.kleine-koenig@pengutronix.de, jason@lakedaemon.net, olof@lixom.net, arnd@arndb.de, daniel.lezcano@linaro.org, tglx@linutronix.de, mark.rutland@arm.com, pawel.moll@arm.com, robh+dt@kernel.org, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: devicetree@vger.kernel.org, Stefan Agner <stefan@agner.ch>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add documentation for Miscellaneous System Control Module found in
Freescale Vybrid SoCs.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 .../devicetree/bindings/arm/freescale/fsl,vf610-mscm.txt   | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/freescale/fsl,vf610-mscm.txt

diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,vf610-mscm.txt b/Documentation/devicetree/bindings/arm/freescale/fsl,vf610-mscm.txt
new file mode 100644
index 0000000..31c58cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/freescale/fsl,vf610-mscm.txt
@@ -0,0 +1,14 @@
+Freescale Vybrid Miscellaneous System Control Module
+
+The MSCM IP contains Access Control and TrustZone Security hardware,
+CPU Configuration registers and Interrupt Router control.
+
+Required properties:
+- compatible : "fsl,vf610-mscm"
+- reg : the register range of the MSCM module
+
+Example:
+	mscm: mscm@40001000 {                 
+		compatible = "fsl,vf610-mscm";
+		reg = <0x40001000 0x1000>;    
+	};                                    
-- 
2.1.3
