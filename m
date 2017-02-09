From: Jayachandran C <jnair@caviumnetworks.com>
Subject: [PATCH v4 4/5] dt-bindings: arm64 ARCH_THUNDER2 platform documentation
Date: Thu,  9 Feb 2017 19:13:32 +0000
Message-ID: <1486667612-8168-1-git-send-email-jnair@caviumnetworks.com>
References: <CAK8P3a07eo0htv_y6H_aHvAaeo5two3vQTaySuFXpG+dzYguUQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAK8P3a07eo0htv_y6H_aHvAaeo5two3vQTaySuFXpG+dzYguUQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Jayachandran C <jnair@caviumnetworks.com>
List-Id: devicetree@vger.kernel.org

Add documentation for Cavium ThunderX2 CN99XX ARM64 processor family.
The the SoC will use the ID "cavium,thunderx2-cn9900".

Add documentation entry for the "cavium,thunder2" cpu core as well.

Signed-off-by: Jayachandran C <jnair@caviumnetworks.com>
---

v3->v4
Documentation updates to reflect changes in device tree.

 Documentation/devicetree/bindings/arm/cavium-thunder2.txt | 8 ++++++++
 Documentation/devicetree/bindings/arm/cpus.txt            | 1 +
 2 files changed, 9 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/cavium-thunder2.txt

diff --git a/Documentation/devicetree/bindings/arm/cavium-thunder2.txt b/Documentation/devicetree/bindings/arm/cavium-thunder2.txt
new file mode 100644
index 0000000..dc5dd65
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/cavium-thunder2.txt
@@ -0,0 +1,8 @@
+Cavium ThunderX2 CN99XX platform tree bindings
+----------------------------------------------
+
+Boards with Cavium ThunderX2 CN99XX SoC shall have the root property:
+  compatible = "cavium,thunderx2-cn9900", "brcm,vulcan-soc";
+
+These SoC uses the "cavium,thunder2" core which will be compatible
+with "brcm,vulcan".
diff --git a/Documentation/devicetree/bindings/arm/cpus.txt b/Documentation/devicetree/bindings/arm/cpus.txt
index a1bcfee..74f0b23 100644
--- a/Documentation/devicetree/bindings/arm/cpus.txt
+++ b/Documentation/devicetree/bindings/arm/cpus.txt
@@ -169,6 +169,7 @@ nodes to be present and contain the properties described below.
 			    "brcm,brahma-b15"
 			    "brcm,vulcan"
 			    "cavium,thunder"
+			    "cavium,thunder2"
 			    "faraday,fa526"
 			    "intel,sa110"
 			    "intel,sa1100"
-- 
2.7.4
