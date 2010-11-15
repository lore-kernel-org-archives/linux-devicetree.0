From: Wolfram Sang <w.sang@pengutronix.de>
Subject: [PATCH 2/2] powerpc: pcm030/032: add pagesize to dts
Date: Mon, 15 Nov 2010 18:25:16 +0100
Message-ID: <1289841916-3825-2-git-send-email-w.sang@pengutronix.de>
References: <1289841916-3825-1-git-send-email-w.sang@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <1289841916-3825-1-git-send-email-w.sang@pengutronix.de>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: devicetree-discuss@ozlabs.org
Cc: linuxppc-dev@ozlabs.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
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
