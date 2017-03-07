From: Alban <albeu@free.fr>
Subject: [PATCH v2 1/2] doc: bindings: Add bindings documentation for mtd nvmem
Date: Tue,  7 Mar 2017 09:26:03 +0100
Message-ID: <1488875164-30440-2-git-send-email-albeu@free.fr>
References: <1488875164-30440-1-git-send-email-albeu@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1488875164-30440-1-git-send-email-albeu@free.fr>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Moritz Fischer <moritz.fischer@ettus.com>, devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>, Alban <albeu@free.fr>, Rob Herring <robh+dt@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-mtd@lists.infradead.org, Maxime Ripard <maxime.ripard@free-electrons.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Cyrille Pitchen <cyrille.pitchen@atmel.com>
List-Id: devicetree@vger.kernel.org

Config data for drivers, like MAC addresses, is often stored in MTD.
Add a binding that define how such data storage can be represented in
device tree.

Signed-off-by: Alban <albeu@free.fr>
---
Changelog:
v2: * Added a "Required properties" section with the nvmem-provider
      property
---
 .../devicetree/bindings/nvmem/mtd-nvmem.txt        | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt

diff --git a/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt b/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
new file mode 100644
index 0000000..8ed25e6
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
@@ -0,0 +1,33 @@
+= NVMEM in MTD =
+
+Config data for drivers, like MAC addresses, is often stored in MTD.
+This binding define how such data storage can be represented in device tree.
+
+An MTD can be defined as an NVMEM provider by adding the `nvmem-provider`
+property to their node. Data cells can then be defined as child nodes
+of the partition as defined in nvmem.txt.
+
+Required properties:
+nvmem-provider:	Indicate that the device should be registered as
+		NVMEM provider
+
+Example:
+
+	flash@0 {
+		...
+
+		partition@2 {
+			label = "art";
+			reg = <0x7F0000 0x010000>;
+			read-only;
+
+			nvmem-provider;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			eeprom@1000 {
+				label = "wmac-eeprom";
+				reg = <0x1000 0x1000>;
+			};
+		};
+	};
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
