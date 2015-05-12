From: Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 04/13] ARM: STi: STiH416-b2020e: Enable PWM on the B2020 Rev-E
Date: Tue, 12 May 2015 13:51:41 +0100
Message-ID: <1431435110-22595-5-git-send-email-lee.jones@linaro.org>
References: <1431435110-22595-1-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1431435110-22595-1-git-send-email-lee.jones@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, Ajit Pal Singh <ajitpal.singh@st.com>, Lee Jones <lee.jones@linaro.org>, kernel@stlinux.com
List-Id: devicetree@vger.kernel.org

All the infrastructure is now in place for ST's PWM controller.  This
patch takes the final step and enables the IP on the 2020 Rev-E
development platform.

Signed-off-by: Ajit Pal Singh <ajitpal.singh@st.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 arch/arm/boot/dts/stih416-b2020e.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/stih416-b2020e.dts b/arch/arm/boot/dts/stih416-b2020e.dts
index 961799e..f1ceee1 100644
--- a/arch/arm/boot/dts/stih416-b2020e.dts
+++ b/arch/arm/boot/dts/stih416-b2020e.dts
@@ -51,5 +51,15 @@
 		sata0: sata@fe380000{
 			status = "okay";
 		};
+
+		/* SAS PWM Module */
+		pwm0: pwm@fed10000 {
+			status		= "okay";
+		};
+
+		/* SBC PWM Module */
+		pwm1: pwm@fe510000 {
+			status		= "okay";
+		};
 	};
 };
-- 
1.9.1
