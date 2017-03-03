From: Jerome Forissier <jerome.forissier@linaro.org>
Subject: [PATCH] Documentation: dt: Add binding for /secure-chosen/stdout-path
Date: Fri,  3 Mar 2017 10:24:33 +0100
Message-ID: <e3e007ef9ee6a622ae4ccc74fd0fca32b3c5dfb5.1488531370.git.jerome.forissier@linaro.org>
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
Cc: mark.rutland@arm.com, peter.maydell@linaro.org, Jerome Forissier <jerome.forissier@linaro.org>, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, robin.murphy@arm.com, jens.wiklander@linaro.org, christoffer.dall@linaro.org
List-Id: devicetree@vger.kernel.org

Some platforms may use a single device tree to describe two address
spaces, as described in d9f43babb998 ("Documentation: dt: Add bindings
for Secure-only devices"). For these platforms it makes sense to define
a secure counterpart of /chosen, namely: /secure-chosen. This new node
is meant to be used by the secure firmware to pass data to the secure
OS. Only the stdout-path property is supported for now.

Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
---
 Documentation/devicetree/bindings/arm/secure.txt | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

v2

- Clarify the expected behavior when /secure-chosen/stdout-path is not
present (either the property or the node itself), as proposed by Peter
and Robin. Note that I have made the fallback to /chosen optional.

diff --git a/Documentation/devicetree/bindings/arm/secure.txt b/Documentation/devicetree/bindings/arm/secure.txt
index e31303f..c4a818e 100644
--- a/Documentation/devicetree/bindings/arm/secure.txt
+++ b/Documentation/devicetree/bindings/arm/secure.txt
@@ -32,7 +32,8 @@ describe the view of Secure world using the standard bindings. These
 secure- bindings only need to be used where both the Secure and Normal
 world views need to be described in a single device tree.
 
-Valid Secure world properties:
+Valid Secure world properties
+-----------------------------
 
 - secure-status : specifies whether the device is present and usable
   in the secure world. The combination of this with "status" allows
@@ -51,3 +52,19 @@ Valid Secure world properties:
    status = "disabled"; secure-status = "okay";     /* S-only */
    status = "disabled";                             /* disabled in both */
    status = "disabled"; secure-status = "disabled"; /* disabled in both */
+
+The secure-chosen node
+----------------------
+
+Similar to the /chosen node which serves as a place for passing data
+between firmware and the operating system, the /secure-chosen node may
+be used to pass data to the Secure OS. Only the properties defined
+below may appear in the /secure-chosen node.
+
+- stdout-path : specifies the device to be used by the Secure OS for
+  its console output. The syntax is the same as for /chosen/stdout-path.
+  If the /secure-chosen node exists but the stdout-path property is not
+  present, the Secure OS should not perform any console output. If
+  /secure-chosen does not exist, the Secure OS may use the value of
+  /chosen/stdout-path instead (that is, use the same device as the
+  Normal world OS).
-- 
2.7.4
