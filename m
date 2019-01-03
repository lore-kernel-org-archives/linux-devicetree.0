From: David Summers <beagleboard@davidjohnsummers.uk>
Subject: [PATCHv2] Patch to add the realtek bluetooth device tree refs to the
 code
Date: Thu,  3 Jan 2019 16:35:38 +0000
Message-ID: <20190103163538.6575-2-beagleboard@davidjohnsummers.uk>
References: <20181229115513.31153-1-beagleboard@davidjohnsummers.uk>
 <20190103163538.6575-1-beagleboard@davidjohnsummers.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190103163538.6575-1-beagleboard@davidjohnsummers.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: marcel@holtmann.org, johan.hedberg@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-bluetooth@vger.kernel.org, David Summers <beagleboard@davidjohnsummers.uk>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds the necessary device tree hooks to the realtek
bluetooth driver for serial connections.

The realtek devices that are listed btrtl.c are searched on the
realtek web site for the version that have serial connections.

Most of these devices also have wi-fi connected via sdio, that is not
covered by the bluetooth driver - but as that interface will also be
needed in the device tree, the hocks here have "-bluetooth" added. The
exception to this is the rtl8761atv, which only has a serial
bluetooth.

Signed-off-by: David Summers <beagleboard@davidjohnsummers.uk>
---
 drivers/bluetooth/hci_h5.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/bluetooth/hci_h5.c b/drivers/bluetooth/hci_h5.c
index 8eede1197cd2..2fec7ff2ce7c 100644
--- a/drivers/bluetooth/hci_h5.c
+++ b/drivers/bluetooth/hci_h5.c
@@ -925,6 +925,22 @@ static struct h5_vnd rtl_vnd = {
 };
 #endif
 
+#ifdef CONFIG_OF
+static const struct of_device_id h5_of_match[] = {
+#ifdef CONFIG_BT_HCIUART_RTL
+       { .compatible = "realtek,rtl8723as-bluetooth"},
+       { .compatible = "realtek,rtl8723bs-bluetooth"},
+       { .compatible = "realtek,rtl8723ds-bluetooth"},
+       { .compatible = "realtek,rtl8761atv"},
+       { .compatible = "realtek,rtl8821as-bluetooth"},
+       { .compatible = "realtek,rtl8821cs-bluetooth"},
+       { .compatible = "realtek,rtl8822bs-bluetooth"},
+#endif
+       { }
+};
+MODULE_DEVICE_TABLE(of, h5_of_match);
+#endif
+
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id h5_acpi_match[] = {
 #ifdef CONFIG_BT_HCIUART_RTL
-- 
beagleboard@davidjohnsummers.uk
