From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH v2 1/7] dt-bindings: interconnect: Add a dma interconnect name
Date: Wed,  6 Feb 2019 20:41:18 +0100
Message-ID: <43eeca13733faefe62f9facc25b8e88f7e593f61.1549482066.git-series.maxime.ripard@bootlin.com>
References: <cover.ddd928eab0069d426b711e69940918eaf85625ce.1549482066.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.ddd928eab0069d426b711e69940918eaf85625ce.1549482066.git-series.maxime.ripard@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>
Cc: devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org, Georgi Djakov <georgi.djakov@linaro.org>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Yong Deng <yong.deng@magewell.com>, Robin Murphy <robin.murphy@arm.com>, Dave Martin <dave.martin@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The current DT bindings assume that the DMA will be performed by the
devices through their parent DT node, and rely on that assumption for the
address translation using dma-ranges.

However, some SoCs have devices that will perform DMA through another bus,
with separate address translation rules. We therefore need to express that
relationship, through the special interconnect name "dma".

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 Documentation/devicetree/bindings/interconnect/interconnect.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/interconnect/interconnect.txt b/Documentation/devicetree/bindings/interconnect/interconnect.txt
index 5a3c575b387a..e69fc2d992c3 100644
--- a/Documentation/devicetree/bindings/interconnect/interconnect.txt
+++ b/Documentation/devicetree/bindings/interconnect/interconnect.txt
@@ -51,6 +51,9 @@ interconnect-names : List of interconnect path name strings sorted in the same
 		     interconnect-names to match interconnect paths with interconnect
 		     specifier pairs.
 
+                     Reserved interconnect names:
+                         * dma: Path from the device to the main memory of the system
+
 Example:
 
 	sdhci@7864000 {
-- 
git-series 0.9.1
