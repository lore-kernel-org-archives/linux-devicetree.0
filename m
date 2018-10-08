From: Jerome Forissier <jerome.forissier@linaro.org>
Subject: [PATCH v2] Documentation: dt: Add binding for /secure-chosen/stdout-path
Date: Mon,  8 Oct 2018 18:16:42 +0800
Message-ID: <20181008101642.8040-1-jerome.forissier@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Etienne Carriere <etienne.carriere@linaro.org>, tee-dev@lists.linaro.org, Jerome Forissier <jerome.forissier@linaro.org>
List-Id: devicetree@vger.kernel.org

Some platforms may use a single device tree to describe two address
spaces, as described in d9f43babb998 ("Documentation: dt: Add bindings
for Secure-only devices"). For these platforms it makes sense to define
a secure counterpart of /chosen, namely: /secure-chosen. This new node
is meant to be used by the secure firmware to pass data to the secure
OS. Only the stdout-path property is supported for now.

Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
---

Notes:
    Sending this again, slightly modified. Previous submission was in March
    2017 [1]. Since then, OP-TEE has implemented this binding for platforms
    that use DT [2] (fallback to /chosen/stdout-path to be implemented in
    [3]). A patch for QEMU has been proposed [4], to which the maintainer
    responded "Are the DT bindings upstream yet?" ;-)
    
    [1] https://patchwork.kernel.org/patch/9602401/
    [2] https://github.com/OP-TEE/optee_os/commit/4dc31c52544a
    [3] https://github.com/OP-TEE/optee_os/pull/2569
    [4] https://patchwork.ozlabs.org/patch/979345/
    
    Changes since v1:
    - Use "should" instead of "may" ("...the Secure OS should use the value
    of /chosen/stdout-path...").

 Documentation/devicetree/bindings/arm/secure.txt | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/secure.txt b/Documentation/devicetree/bindings/arm/secure.txt
index e31303fb233a..f27bbff2c780 100644
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
+  /secure-chosen does not exist, the Secure OS should use the value of
+  /chosen/stdout-path instead (that is, use the same device as the
+  Normal world OS).
-- 
2.15.1
