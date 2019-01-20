Return-Path: <SRS0=jtBt=P4=vger.kernel.org=devicetree-owner@kernel.org>
Received: from avasout05.plus.net ([84.93.230.250]:44645 "EHLO
        avasout05.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730552AbfATMlQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 20 Jan 2019 07:41:16 -0500
From: David Summers <beagleboard@davidjohnsummers.uk>
Subject: [PATCH v3 1/2] Bluetooth: dt-bindings: Realtek serial bluetooth
Date: Sun, 20 Jan 2019 12:40:45 +0000
Message-Id: <20190120124046.6715-1-beagleboard@davidjohnsummers.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, marcel@holtmann.org, johan.hedberg@gmail.com
Cc: David Summers <beagleboard@davidjohnsummers.uk>, linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Since v2, the compatible binding names have been changed to end in
-bt, as requested by robh.

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
