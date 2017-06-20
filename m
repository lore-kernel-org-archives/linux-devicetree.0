From: Jose Abreu <Jose.Abreu@synopsys.com>
Subject: [PATCH v4 3/4] MAINTAINERS: Add entry for Synopsys Designware HDMI drivers
Date: Tue, 20 Jun 2017 18:26:11 +0100
Message-ID: <af0dc9eac70812dd1eac411b0542c4574df6f3e9.1497978962.git.joabreu@synopsys.com>
References: <cover.1497978962.git.joabreu@synopsys.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1497978962.git.joabreu@synopsys.com>
In-Reply-To: <cover.1497978962.git.joabreu@synopsys.com>
References: <cover.1497978962.git.joabreu@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Carlos Palminha <CARLOS.PALMINHA@synopsys.com>
List-Id: devicetree@vger.kernel.org

Add a entry for Synopsys Designware HDMI Receivers drivers
and phys.

Signed-off-by: Jose Abreu <joabreu@synopsys.com>
Cc: Carlos Palminha <palminha@synopsys.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c4be6d4..7ebc6dd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11354,6 +11354,13 @@ L:	netdev@vger.kernel.org
 S:	Supported
 F:	drivers/net/ethernet/synopsys/
 
+SYNOPSYS DESIGNWARE HDMI RECEIVERS AND PHY DRIVERS
+M:	Jose Abreu <joabreu@synopsys.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	drivers/media/platform/dwc/*
+F:	include/media/dwc/*
+
 SYNOPSYS DESIGNWARE I2C DRIVER
 M:	Jarkko Nikula <jarkko.nikula@linux.intel.com>
 R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
-- 
1.9.1
