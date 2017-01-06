From: David Daney <ddaney.cavm@gmail.com>
Subject: [PATCH v2 3/3] MAINTAINERS: Add entry for THUNDERX GPIO Driver.
Date: Fri,  6 Jan 2017 15:23:00 -0800
Message-ID: <1483744980-25898-4-git-send-email-ddaney.cavm@gmail.com>
References: <1483744980-25898-1-git-send-email-ddaney.cavm@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1483744980-25898-1-git-send-email-ddaney.cavm@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: David Daney <david.daney@cavium.com>
List-Id: devicetree@vger.kernel.org

From: David Daney <david.daney@cavium.com>

Signed-off-by: David Daney <david.daney@cavium.com>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 97d0b68..3d254e9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10886,6 +10886,11 @@ M:	Andreas Noever <andreas.noever@gmail.com>
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
