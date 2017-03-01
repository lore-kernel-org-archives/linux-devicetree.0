From: Jerome Forissier <jerome.forissier@linaro.org>
Subject: [PATCH] Documentation: dt: Add binding for /chosen/secure-stdout-path
Date: Wed,  1 Mar 2017 14:29:27 +0100
Message-ID: <06154a2280a8423af80405825d7201c7aa927696.1488374335.git.jerome.forissier@linaro.org>
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org
Cc: mark.rutland@arm.com, peter.maydell@linaro.org, Jerome Forissier <jerome.forissier@linaro.org>, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, jens.wiklander@linaro.org, christoffer.dall@linaro.org
List-Id: devicetree@vger.kernel.org

Some platforms may use a single device tree to describe two address
spaces, as described in d9f43babb998 ("Documentation: dt: Add bindings
for Secure-only devices"). We extend the use of the secure- prefix to
the stdout-path property, so that the Secure firmware may use a
different console device than the one used by the kernel.

Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
---
 Documentation/devicetree/bindings/arm/secure.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/secure.txt b/Documentation/devicetree/bindings/arm/secure.txt
index e31303f..558c9a1 100644
--- a/Documentation/devicetree/bindings/arm/secure.txt
+++ b/Documentation/devicetree/bindings/arm/secure.txt
@@ -51,3 +51,8 @@ Valid Secure world properties:
    status = "disabled"; secure-status = "okay";     /* S-only */
    status = "disabled";                             /* disabled in both */
    status = "disabled"; secure-status = "disabled"; /* disabled in both */
+
+- secure-stdout-path (/chosen node): specifies the device to be used
+for console output by Secure firmware. The syntax is the same as for
+"stdout-path". If "secure-stdout-path" is not specified it defaults to
+the same value as "stdout-path".
-- 
2.7.4
