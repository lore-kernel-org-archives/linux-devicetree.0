From: Philip Avinash <avinashphilip-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 1/2] pwm: pwm-tiecap: Update device-tree binding document
Date: Mon, 25 Mar 2013 12:34:52 +0530
Message-ID: <1364195093-1357-2-git-send-email-avinashphilip@ti.com>
References: <1364195093-1357-1-git-send-email-avinashphilip@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1364195093-1357-1-git-send-email-avinashphilip-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org
Cc: davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, prakash.pm-l0cyMroinI0@public.gmane.org, Philip Avinash <avinashphilip-l0cyMroinI0@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Update binding document of pwm-tiecap to reflect the usage of similar
modules in da850 and am3xx SOCs.

Signed-off-by: Philip Avinash <avinashphilip-l0cyMroinI0@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
---
 .../devicetree/bindings/pwm/pwm-tiecap.txt         |   12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-tiecap.txt b/Documentation/devicetree/bindings/pwm/pwm-tiecap.txt
index 131e8c1..43c4e81 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-tiecap.txt
+++ b/Documentation/devicetree/bindings/pwm/pwm-tiecap.txt
@@ -1,7 +1,9 @@
 TI SOC ECAP based APWM controller
 
 Required properties:
-- compatible: Must be "ti,am33xx-ecap"
+- compatible: Must be "ti,<soc>-ecap".
+  for am33xx - compatible = "ti,am33xx-ecap";
+  for da850  - compatible = "ti,da850-ecap", "ti,am33xx-ecap";
 - #pwm-cells: Should be 3. Number of cells being used to specify PWM property.
   First cell specifies the per-chip index of the PWM to use, the second
   cell is the period in nanoseconds and bit 0 in the third cell is used to
@@ -15,9 +17,15 @@ Optional properties:
 
 Example:
 
-ecap0: ecap@0 {
+ecap0: ecap@0 {  /* ECAP on am33xx */
 	compatible = "ti,am33xx-ecap";
 	#pwm-cells = <3>;
 	reg = <0x48300100 0x80>;
 	ti,hwmods = "ecap0";
 };
+
+ecap0: ecap@0 { /* ECAP on da850 */
+	compatible = "ti,da850-ecap", "ti,am33xx-ecap";
+	#pwm-cells = <3>;
+	reg = <0x306000 0x80>;
+};
-- 
1.7.9.5
