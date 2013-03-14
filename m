From: Philip Avinash <avinashphilip-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 3/3] pwm: pwm-tiehrpwm: Add device tree binding support for
 da850 SOC
Date: Thu, 14 Mar 2013 16:02:38 +0530
Message-ID: <1363257158-11615-4-git-send-email-avinashphilip@ti.com>
References: <1363257158-11615-1-git-send-email-avinashphilip@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1363257158-11615-1-git-send-email-avinashphilip-l0cyMroinI0@public.gmane.org>
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

EHRPWM IP is used in da850 SOC's also. Hence adds EHRPWM device tree
binding support for da850.

Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
Signed-off-by: Philip Avinash <avinashphilip-l0cyMroinI0@public.gmane.org>
---
:100644 100644 4fc7079... 0442d65... M	Documentation/devicetree/bindings/pwm/pwm-tiehrpwm.txt
:100644 100644 8b4c86f... 6561ec2... M	drivers/pwm/pwm-tiehrpwm.c
 .../devicetree/bindings/pwm/pwm-tiehrpwm.txt       |    2 +-
 drivers/pwm/pwm-tiehrpwm.c                         |    1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-tiehrpwm.txt b/Documentation/devicetree/bindings/pwm/pwm-tiehrpwm.txt
index 4fc7079..0442d65 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-tiehrpwm.txt
+++ b/Documentation/devicetree/bindings/pwm/pwm-tiehrpwm.txt
@@ -1,7 +1,7 @@
 TI SOC EHRPWM based PWM controller
 
 Required properties:
-- compatible : Must be "ti,am33xx-ehrpwm"
+- compatible : Must be "ti,am33xx-ehrpwm" or "ti,da850-ehrpwm"
 - #pwm-cells: Should be 3. Number of cells being used to specify PWM property.
   First cell specifies the per-chip index of the PWM to use, the second
   cell is the period in nanoseconds and bit 0 in the third cell is used to
diff --git a/drivers/pwm/pwm-tiehrpwm.c b/drivers/pwm/pwm-tiehrpwm.c
index 8b4c86f..6561ec2 100644
--- a/drivers/pwm/pwm-tiehrpwm.c
+++ b/drivers/pwm/pwm-tiehrpwm.c
@@ -428,6 +428,7 @@ static const struct pwm_ops ehrpwm_pwm_ops = {
 
 static const struct of_device_id ehrpwm_of_match[] = {
 	{ .compatible	= "ti,am33xx-ehrpwm" },
+	{ .compatible	= "ti,da850-ehrpwm" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, ehrpwm_of_match);
-- 
1.7.9.5
