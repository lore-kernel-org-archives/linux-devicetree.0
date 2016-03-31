From: <tthayer@opensource.altera.com>
Subject: [PATCHv2 4/7] Documentation: dt: socfpga: Add Altera Arria10 OCRAM
 binding
Date: Thu, 31 Mar 2016 13:48:04 -0500
Message-ID: <1459450087-24792-5-git-send-email-tthayer@opensource.altera.com>
References: <1459450087-24792-1-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1459450087-24792-1-git-send-email-tthayer@opensource.altera.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: bp@alien8.de, dougthompson@xmission.com, m.chehab@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, dinguyen@opensource.altera.com, grant.likely@linaro.org
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, tthayer@opensource.altera.com, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <tthayer@opensource.altera.com>

Add the device tree bindings needed to support the Altera On-Chip
RAM ECC on the Arria10 chip.

Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
---
v2: Align Required Properties descriptions
---
 .../bindings/arm/altera/socfpga-eccmgr.txt         |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/altera/socfpga-eccmgr.txt b/Documentation/devicetree/bindings/arm/altera/socfpga-eccmgr.txt
index 37ff9bf..5a6b160 100644
--- a/Documentation/devicetree/bindings/arm/altera/socfpga-eccmgr.txt
+++ b/Documentation/devicetree/bindings/arm/altera/socfpga-eccmgr.txt
@@ -71,6 +71,11 @@ Required Properties:
 - compatible : Should be "altr,socfpga-a10-l2-ecc"
 - reg : Address and size for ECC error interrupt clear registers.
 
+On-Chip RAM ECC
+Required Properties:
+- compatible : Should be "altr,socfpga-a10-ocram-ecc"
+- reg        : Address and size for ECC block registers.
+
 Example:
 
 	eccmgr: eccmgr@ffd06000 {
@@ -86,4 +91,9 @@ Example:
 			compatible = "altr,socfpga-a10-l2-ecc";
 			reg = <0xffd06010 0x4>;
 		};
+
+		ocram-ecc@ff8c3000 {
+			compatible = "altr,socfpga-a10-ocram-ecc";
+			reg = <0xff8c3000 0x90>;
+		};
 	};
-- 
1.7.9.5
