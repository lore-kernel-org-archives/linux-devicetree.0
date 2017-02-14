From: David Daney <david.daney@cavium.com>
Subject: [PATCH v3 6/6] MAINTAINERS: Add entry for THUNDERX GPIO Driver.
Date: Tue, 14 Feb 2017 09:49:36 -0800
Message-ID: <1487094576-229208-7-git-send-email-david.daney@cavium.com>
References: <1487094576-229208-1-git-send-email-david.daney@cavium.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1487094576-229208-1-git-send-email-david.daney@cavium.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: David Daney <david.daney@cavium.com>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 107c10e..9238cd0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10904,6 +10904,11 @@ M:	Andreas Noever <andreas.noever@gmail.com>
 S:	Maintained
 F:	drivers/thunderbolt/
 
+THUNDERX GPIO DRIVER
+M:	David Daney <david.daney@cavium.com>
+S:	Maintained
+F:	drivers/gpio/gpio-thunderx.c
+
 TI BQ27XXX POWER SUPPLY DRIVER
 R:	Andrew F. Davis <afd@ti.com>
 F:	include/linux/power/bq27xxx_battery.h
-- 
1.8.3.1

