Return-Path: <SRS0=8hQX=FV=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-pl0-f66.google.com ([209.85.160.66]:44888 "EHLO
        mail-pl0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752623AbeB0M7O (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 27 Feb 2018 07:59:14 -0500
From: jassisinghbrar@gmail.com
Subject: [PATCHv4 3/3] MAINTAINERS: Add entry for Synquacer SPI driver
Date: Tue, 27 Feb 2018 18:29:04 +0530
Message-Id: <1519736344-4039-1-git-send-email-jassisinghbrar@gmail.com>
In-Reply-To: <1519736182-3650-1-git-send-email-jassisinghbrar@gmail.com>
References: <1519736182-3650-1-git-send-email-jassisinghbrar@gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: linux-spi@vger.kernel.org, devicetree@vger.kernel.org
Cc: tpiepho@impinj.com, broonie@kernel.org, ard.biesheuvel@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, masami.hiramatsu@linaro.org, Jassi Brar <jaswinder.singh@linaro.org>
List-ID: <devicetree@vger.kernel.org>

From: Jassi Brar <jaswinder.singh@linaro.org>

Add entry for the Synquacer spi driver and DT bindings.

Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93a12af..866b230 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12851,6 +12851,13 @@ S:	Maintained
 F:	drivers/net/ethernet/socionext/netsec.c
 F:	Documentation/devicetree/bindings/net/socionext-netsec.txt
 
+SOCIONEXT (SNI) Synquacer SPI DRIVER
+M:	Jassi Brar <jaswinder.singh@linaro.org>
+L:	linux-spi@vger.kernel.org
+S:	Maintained
+F:	drivers/spi/spi-synquacer.c
+F:	Documentation/devicetree/bindings/spi/spi-synquacer.txt
+
 SONIC NETWORK DRIVER
 M:	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
 L:	netdev@vger.kernel.org
-- 
2.7.4

