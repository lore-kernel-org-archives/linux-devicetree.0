From: Claudiu Manoil <claudiu.manoil@freescale.com>
Subject: [PATCH,v3 1/3] doc: dt: Update eTSEC bindings doc
Date: Tue, 28 Jul 2015 17:43:54 +0300
Message-ID: <1438094636-20421-1-git-send-email-claudiu.manoil@freescale.com>
References: <20150727142816.GP12927@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20150727142816.GP12927@tiger>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, shawnguo@kernel.org
Cc: shawn.guo@linaro.org, galak@codeaurora.org
List-Id: devicetree@vger.kernel.org

Update the eTSEC bindings document with missing info on
properties that are already in use for the PPC platforms:
* "tbi-phy" property;
* "fsl,etsec2" compatibility string;

Signed-off-by: Claudiu Manoil <claudiu.manoil@freescale.com>
---
v2 - none;
v3 - added "tbi-handle" documentation;
   - fixed typo ("fsl,etsec2" is the correct string);

 Documentation/devicetree/bindings/net/fsl-tsec-phy.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/fsl-tsec-phy.txt b/Documentation/devicetree/bindings/net/fsl-tsec-phy.txt
index 1e97532..325c07d 100644
--- a/Documentation/devicetree/bindings/net/fsl-tsec-phy.txt
+++ b/Documentation/devicetree/bindings/net/fsl-tsec-phy.txt
@@ -45,12 +45,15 @@ Properties:
 
   - device_type : Should be "network"
   - model : Model of the device.  Can be "TSEC", "eTSEC", or "FEC"
-  - compatible : Should be "gianfar"
+  - compatible : "gianfar", "fsl,etsec2"
   - reg : Offset and length of the register set for the device
   - interrupts : For FEC devices, the first interrupt is the device's
     interrupt.  For TSEC and eTSEC devices, the first interrupt is
     transmit, the second is receive, and the third is error.
   - phy-handle : See ethernet.txt file in the same directory.
+  - tbi-handle : Handle to a tbi-phy node containing information about
+    the TBIPA register needed to initialize the TBI PHY.  See
+    "TBI Internal MDIO bus", this document.
   - fixed-link : See fixed-link.txt in the same directory.
   - phy-connection-type : See ethernet.txt file in the same directory.
     This property is only really needed if the connection is of type
-- 
1.7.11.7
