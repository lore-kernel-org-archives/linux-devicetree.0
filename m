From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 9/9] ARM: highbank: add interrupt properties to gpio nodes
Date: Wed, 14 Dec 2011 09:28:58 -0600
Message-ID: <1323876538-20406-10-git-send-email-robherring2@gmail.com>
References: <1323876538-20406-1-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1323876538-20406-1-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Kevin Hilman <khilman-l0cyMroinI0@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Linus Walleij <linus.ml.walleij-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Barry Song <baohua.song-kQvG35nSl+M@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>

Add interrupt-controller properties to pl061 gpio nodes so gpio lines can
function as interrupts.

Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/highbank.dts |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/arch/arm/boot/dts/highbank.dts b/arch/arm/boot/dts/highbank.dts
index aeb1a75..dfe2b49 100644
--- a/arch/arm/boot/dts/highbank.dts
+++ b/arch/arm/boot/dts/highbank.dts
@@ -89,7 +89,6 @@
 			#size-cells = <0>;
 			#address-cells = <1>;
 			interrupt-controller;
-			interrupt-parent;
 			reg = <0xfff11000 0x1000>,
 			      <0xfff10100 0x100>;
 		};
@@ -129,6 +128,8 @@
 			#gpio-cells = <2>;
 			compatible = "arm,pl061", "arm,primecell";
 			gpio-controller;
+			interrupt-controller;
+			#interrupt-cells = <2>;
 			reg = <0xfff30000 0x1000>;
 			interrupts = <0 14 4>;
 		};
@@ -137,6 +138,8 @@
 			#gpio-cells = <2>;
 			compatible = "arm,pl061", "arm,primecell";
 			gpio-controller;
+			interrupt-controller;
+			#interrupt-cells = <2>;
 			reg = <0xfff31000 0x1000>;
 			interrupts = <0 15 4>;
 		};
@@ -145,6 +148,8 @@
 			#gpio-cells = <2>;
 			compatible = "arm,pl061", "arm,primecell";
 			gpio-controller;
+			interrupt-controller;
+			#interrupt-cells = <2>;
 			reg = <0xfff32000 0x1000>;
 			interrupts = <0 16 4>;
 		};
@@ -153,6 +158,8 @@
 			#gpio-cells = <2>;
 			compatible = "arm,pl061", "arm,primecell";
 			gpio-controller;
+			interrupt-controller;
+			#interrupt-cells = <2>;
 			reg = <0xfff33000 0x1000>;
 			interrupts = <0 17 4>;
 		};
-- 
1.7.5.4
