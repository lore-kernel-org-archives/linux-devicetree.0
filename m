From: David Daney <david.daney@cavium.com>
Subject: [PATCH v5 6/6] MAINTAINERS: Add entry for THUNDERX GPIO Driver.
Date: Tue, 28 Feb 2017 17:48:52 -0800
Message-ID: <1488332932-2691-7-git-send-email-david.daney@cavium.com>
References: <1488332932-2691-1-git-send-email-david.daney@cavium.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1488332932-2691-1-git-send-email-david.daney@cavium.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: David Daney <david.daney@cavium.com>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 76dfb51..c281607 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11033,6 +11033,11 @@ M:	Andreas Noever <andreas.noever@gmail.com>
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

