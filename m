Return-Path: <SRS0=n0G4=QW=vger.kernel.org=devicetree-owner@kernel.org>
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:28020 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726238AbfBOQ0q (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 15 Feb 2019 11:26:46 -0500
From: Daire McNamara <daire.mcnamara@microchip.com>
Subject: [PATCH v3 1/3] PCI: Add vendor ID for Microsemi
Date: Fri, 15 Feb 2019 16:24:22 +0000
Message-ID: <20190215162424.564-2-daire.mcnamara@microchip.com>
In-Reply-To: <20190215162424.564-1-daire.mcnamara@microchip.com>
References: <20190215162424.564-1-daire.mcnamara@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: linux-pci@vger.kernel.org, devicetree@vger.kernel.org
Cc: Daire McNamara <daire.mcnamara@microchip.com>
List-ID: <devicetree@vger.kernel.org>

This patch adds a new PCI vendor ID for Microsemi.

Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 4b1a2a8fcc16..d13f6e40dbf4 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -238,6 +238,7 @@ micrel	Micrel Inc.
 microchip	Microchip Technology Inc.
 microcrystal	Micro Crystal AG
 micron	Micron Technology Inc.
+microsemi	Microsemi Corporation
 mikroe		MikroElektronika d.o.o.
 minix	MINIX Technology Ltd.
 miramems	MiraMEMS Sensing Technology Co., Ltd.
-- 
2.17.0
