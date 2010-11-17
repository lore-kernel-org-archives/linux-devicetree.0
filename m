From: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 3/3] powerpc: pcm030/032: add pagesize to dts
Date: Wed, 17 Nov 2010 13:00:50 +0100
Message-ID: <1289995250-17927-4-git-send-email-w.sang@pengutronix.de>
References: <1289995250-17927-1-git-send-email-w.sang@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1289995250-17927-1-git-send-email-w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, Anton Vorontsov <cbouatmailru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 arch/powerpc/boot/dts/pcm030.dts |    1 +
 arch/powerpc/boot/dts/pcm032.dts |    3 ++-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/arch/powerpc/boot/dts/pcm030.dts b/arch/powerpc/boot/dts/pcm030.dts
index 8a4ec30..e7c36bc 100644
--- a/arch/powerpc/boot/dts/pcm030.dts
+++ b/arch/powerpc/boot/dts/pcm030.dts
@@ -259,6 +259,7 @@
 			eeprom@52 {
 				compatible = "catalyst,24c32";
 				reg = <0x52>;
+				pagesize = <32>;
 			};
 		};
 
diff --git a/arch/powerpc/boot/dts/pcm032.dts b/arch/powerpc/boot/dts/pcm032.dts
index 85d857a..e175e2c 100644
--- a/arch/powerpc/boot/dts/pcm032.dts
+++ b/arch/powerpc/boot/dts/pcm032.dts
@@ -257,8 +257,9 @@
 				reg = <0x51>;
 			};
 			eeprom@52 {
-				compatible = "at24,24c32";
+				compatible = "catalyst,24c32";
 				reg = <0x52>;
+				pagesize = <32>;
 			};
 		};
 
-- 
1.7.2.3
