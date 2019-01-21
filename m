Return-Path: <SRS0=xJLh=P5=davidjohnsummers.uk=beagleboard@kernel.org>
From: David Summers <beagleboard@davidjohnsummers.uk>
Subject: [PATCH v4 1/2] Bluetooth: hci_h5: Add the Realtek compatible flags for the device tree
Date: Mon, 21 Jan 2019 20:39:27 +0000
Message-Id: <20190121203928.32723-1-beagleboard@davidjohnsummers.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: robh+dt@kernel.org, mark.rutland@arm.com, marcel@holtmann.org, johan.hedberg@gmail.com
Cc: David Summers <beagleboard@davidjohnsummers.uk>, linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

With the changes requested by Marcel Holtmann and Rob Herring.

The patch is unchanged, but subject changed to the norm.

Signed-off-by: David Summers <beagleboard@davidjohnsummers.uk>
---
 drivers/bluetooth/hci_h5.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/bluetooth/hci_h5.c b/drivers/bluetooth/hci_h5.c
index 8eede1197cd2..056ab2decccc 100644
--- a/drivers/bluetooth/hci_h5.c
+++ b/drivers/bluetooth/hci_h5.c
@@ -925,6 +925,22 @@ static struct h5_vnd rtl_vnd = {
 };
 #endif
 
+#ifdef CONFIG_OF
+static const struct of_device_id h5_of_match[] = {
+#ifdef CONFIG_BT_HCIUART_RTL
+       { .compatible = "realtek,rtl8723as-bt"},
+       { .compatible = "realtek,rtl8723bs-bt"},
+       { .compatible = "realtek,rtl8723ds-bt"},
+       { .compatible = "realtek,rtl8761atv"},
+       { .compatible = "realtek,rtl8821as-bt"},
+       { .compatible = "realtek,rtl8821cs-bt"},
+       { .compatible = "realtek,rtl8822bs-bt"},
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
