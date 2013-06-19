From: "Florian Fainelli" <f.fainelli@gmail.com>
Subject: [PATCH] ARM: kernel: document ARM CPUs clock-frequency property
Date: Wed, 19 Jun 2013 10:47:17 +0100
Message-ID: <1371635237-22860-1-git-send-email-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: lorenzo.pieralisi@arm.com
Cc: Florian Fainelli <f.fainelli@gmail.com>, nico@linaro.org, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, grant.likely@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

ARM CPU device tree nodes may contain an optional clock-frequency
property, when set, this property must contain the CPU frequency in Hz,
which is then used by the topology parsing code in
arch/arm/kernel/topology.c to infer the CPU capacity.

Document this property to avoid any possible confusion on the
clock-frequency unit.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 Documentation/devicetree/bindings/arm/cpus.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.txt b/Documentation/devicetree/bindings/arm/cpus.txt
index f32494d..a33b956 100644
--- a/Documentation/devicetree/bindings/arm/cpus.txt
+++ b/Documentation/devicetree/bindings/arm/cpus.txt
@@ -45,6 +45,8 @@ For the ARM architecture every CPU node must contain the following properties:
 		"marvell,xsc3"
 		"marvell,xscale"
 
+- clock-frequency : The frequency of the CPU, in Hz. Optional.
+
 Example:
 
 	cpus {
-- 
1.8.1.2
