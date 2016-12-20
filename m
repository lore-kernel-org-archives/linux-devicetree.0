From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v4 1/5] mfd: dt: Fix "indicates" typo in mfd bindings document
Date: Tue, 20 Dec 2016 17:45:31 +1030
Message-ID: <20161220071535.27542-2-andrew@aj.id.au>
References: <20161220071535.27542-1-andrew@aj.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161220071535.27542-1-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Corey Minyard <minyard@acm.org>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/mfd/mfd.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/mfd.txt b/Documentation/devicetree/bindings/mfd/mfd.txt
index af9d6931a1a2..f1fceeda12f1 100644
--- a/Documentation/devicetree/bindings/mfd/mfd.txt
+++ b/Documentation/devicetree/bindings/mfd/mfd.txt
@@ -19,7 +19,7 @@ Optional properties:
 
 - compatible : "simple-mfd" - this signifies that the operating system should
   consider all subnodes of the MFD device as separate devices akin to how
-  "simple-bus" inidicates when to see subnodes as children for a simple
+  "simple-bus" indicates when to see subnodes as children for a simple
   memory-mapped bus. For more complex devices, when the nexus driver has to
   probe registers to figure out what child devices exist etc, this should not
   be used. In the latter case the child devices will be determined by the
-- 
2.9.3
