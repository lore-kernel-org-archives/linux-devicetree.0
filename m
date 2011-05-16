From: Anatolij Gustschin <agust@denx.de>
Subject: [PATCH 1/2] powerpc/5200: mpc5200b.dtsi: add spi node address- and
	size-cells properties
Date: Mon, 16 May 2011 18:02:43 +0200
Message-ID: <1305561764-5942-1-git-send-email-agust@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: linuxppc-dev@lists.ozlabs.org
Cc: devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Both, #address-cells and #size-cells properties are required
for spi bus node, so add them.

Signed-off-by: Anatolij Gustschin <agust@denx.de>
---
 arch/powerpc/boot/dts/mpc5200b.dtsi |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/powerpc/boot/dts/mpc5200b.dtsi b/arch/powerpc/boot/dts/mpc5200b.dtsi
index bc27548..7ab286a 100644
--- a/arch/powerpc/boot/dts/mpc5200b.dtsi
+++ b/arch/powerpc/boot/dts/mpc5200b.dtsi
@@ -147,6 +147,8 @@
 		};
 
 		spi@f00 {
+			#address-cells = <1>;
+			#size-cells = <0>;
 			compatible = "fsl,mpc5200b-spi","fsl,mpc5200-spi";
 			reg = <0xf00 0x20>;
 			interrupts = <2 13 0 2 14 0>;
-- 
1.7.1
