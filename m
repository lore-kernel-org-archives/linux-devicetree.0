From: bpqw <bpqw@micron.com>
Subject: [PATCH 1/1] devicetree: bindings: Add vendor prefix for Micron
 Technology Co., Ltd.
Date: Tue, 21 Oct 2014 08:50:24 +0000
Message-ID: <A765B125120D1346A63912DDE6D8B6315E745D@NTXXIAMBX02.xacn.micron.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: Jason Cooper <jason@lakedaemon.net>, Mark Brown <broonie@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Thierry Reding <treding@nvidia.com>, Florian Vaussard <florian.vaussard@epfl.ch>, Andrew Lunn <andrew@lunn.ch>, Silvio F <silvio.fricke@gmail.com>, Hayato Suzuki <hytszk@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

This patch is used to add vendor prefix for Micron Technology Inc in the vendor-prefixes.txt file.

Micron Technology, Inc. is an American multinational corporation
based in Boise, Idaho, best known for producing many forms of
semiconductor devices. This includes DRAM, SDRAM, flash memory,
eMMC and SSDs.

Signed-off-by: bean huo <beanhuo@micron.com>
---
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 723999d..a7bbf6e 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -92,6 +92,7 @@ maxim	Maxim Integrated Products
 mediatek	MediaTek Inc.
 micrel	Micrel Inc.
 microchip	Microchip Technology Inc.
+micron	Micron Technology Inc.
 mitsubishi	Mitsubishi Electric Corporation
 mosaixtech	Mosaix Technologies, Inc.
 moxa	Moxa
-- 
1.7.9.5
