From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: [PATCH 6/7] mtd: ptx1kbf: Bindings for Juniper's PTX1K Boot FPGA
Date: Fri,  7 Oct 2016 18:22:03 +0300
Message-ID: <1475853724-22557-7-git-send-email-pantelis.antoniou@konsulko.com>
References: <1475853724-22557-1-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1475853724-22557-1-git-send-email-pantelis.antoniou@konsulko.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org, Georgi Vlaev <gvlaev@juniper.net>, Frank Rowand <frowand.list@gmail.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, linux-kernel@vger.kernel.org, JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>, Wim Van Sebroeck <wim@iguana.be>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Guenter Roeck <linux@roeck-us.net>
List-Id: devicetree@vger.kernel.org

From: Georgi Vlaev <gvlaev@juniper.net>

Add binding document for Junipers Flash IP block present
in the PTX1K Boot FPGA on PTX series of routers.

Signed-off-by: Georgi Vlaev <gvlaev@juniper.net>
[Ported from Juniper kernel]
Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
---
 .../devicetree/bindings/mtd/ptx1kbf-mtd.txt        | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/ptx1kbf-mtd.txt

diff --git a/Documentation/devicetree/bindings/mtd/ptx1kbf-mtd.txt b/Documentation/devicetree/bindings/mtd/ptx1kbf-mtd.txt
new file mode 100644
index 0000000..4e25060
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/ptx1kbf-mtd.txt
@@ -0,0 +1,23 @@
+Flash device on a PTX1K Boot FPGA
+
+These flash chips are found in the PTX series of Juniper routers.
+
+Required properties:
+- compatible : must be "jnx,flash-sam"
+
+Optional properties:
+- reg : memory address for the flash chip, note that this is not
+required since usually the device is a subdevice of the SAM MFD
+driver which fills in the register fields.
+
+For the rest of the properties, see mtd-physmap.txt.
+
+The device tree may optionally contain sub-nodes describing partitions of the
+address space. See partition.txt for more detail.
+
+Example:
+
+ptx1kbf_mtd {
+	compatible = "jnx,ptx1kbf-mtd";
+	/* usually the whole flash is used */
+};
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
