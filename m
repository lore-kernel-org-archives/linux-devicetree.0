From: Kuldeep Singh <kuldeep.singh@nxp.com>
Subject: [PATCH v2 2/2] dt-bindings: spi: spi-fsl-qspi: Add ls2080a
 compatibility string
Date: Wed, 22 May 2019 07:00:33 +0000
Message-ID: <20190522070133.24953-2-kuldeep.singh@nxp.com>
References: <20190522070133.24953-1-kuldeep.singh@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190522070133.24953-1-kuldeep.singh@nxp.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "bbrezillon@kernel.org" <bbrezillon@kernel.org>, Kuldeep Singh <kuldeep.singh@nxp.com>, Ashish Kumar <ashish.kumar@nxp.com>, "broonie@kernel.org" <broonie@kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

There are 2 version of QSPI-IP, according to which it can be big endian
or little endian. There are some other minor changes as well.
The big endian version uses driver compatible fsl,ls1021a-qspi and little
endian version uses fsl,ls10280a-qspi

Signed-off-by: Ashish Kumar <ashish.kumar@nxp.com>
Signed-off-by: Kuldeep Singh <kuldeep.singh@nxp.com>
---
Update v2: 
        Convert to patch series and rebasing done on top of tree

 Documentation/devicetree/bindings/spi/spi-fsl-qspi.txt | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/spi-fsl-qspi.txt b/Documentation/devicetree/bindings/spi/spi-fsl-qspi.txt
index a72616a1ad2d..2c2a3e919a06 100644
--- a/Documentation/devicetree/bindings/spi/spi-fsl-qspi.txt
+++ b/Documentation/devicetree/bindings/spi/spi-fsl-qspi.txt
@@ -3,9 +3,8 @@
 Required properties:
   - compatible : Should be "fsl,vf610-qspi", "fsl,imx6sx-qspi",
 		 "fsl,imx7d-qspi", "fsl,imx6ul-qspi",
-		 "fsl,ls1021a-qspi"
+		 "fsl,ls1021a-qspi", "fsl,ls2080a-qspi"
 		 or
-		 "fsl,ls2080a-qspi" followed by "fsl,ls1021a-qspi",
 		 "fsl,ls1043a-qspi" followed by "fsl,ls1021a-qspi"
 		 "fsl,ls1012a-qspi" followed by "fsl,ls1021a-qspi"
 		 "fsl,ls1088a-qspi" followed by "fsl,ls2080a-qspi"
-- 
2.17.1
