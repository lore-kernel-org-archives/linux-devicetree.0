From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ARM: highbank: add xgmac ethernet devices to dts
Date: Wed,  7 Dec 2011 09:26:46 -0600
Message-ID: <1323271606-11837-1-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>

Add device nodes for xgmac ethernet block in Calxeda Highbank.

Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/highbank.dts |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/highbank.dts b/arch/arm/boot/dts/highbank.dts
index aeb1a75..305635b 100644
--- a/arch/arm/boot/dts/highbank.dts
+++ b/arch/arm/boot/dts/highbank.dts
@@ -194,5 +194,17 @@
 			reg = <0xfff3d000 0x1000>;
 			interrupts = <0 92 4>;
 		};
+
+		ethernet@fff50000 {
+			compatible = "calxeda,hb-xgmac";
+			reg = <0xfff50000 0x1000>;
+			interrupts = <0 77 4  0 78 4  0 79 4>;
+		};
+
+		ethernet@fff51000 {
+			compatible = "calxeda,hb-xgmac";
+			reg = <0xfff51000 0x1000>;
+			interrupts = <0 80 4  0 81 4  0 82 4>;
+		};
 	};
 };
-- 
1.7.5.4
