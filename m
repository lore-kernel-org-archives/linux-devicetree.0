From: Colin King <colin.king@canonical.com>
Subject: [PATCH][V2] Documentation: bus: ti-sysc: fix spelling mistakes "multipe" and "interconnet"
Date: Thu,  4 Apr 2019 12:16:57 +0100
Message-ID: <20190404111657.21477-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tony Lindgren <tony@atomide.com>, Faiz Abbas <faiz_abbas@ti.com>, devicetree@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is are a couple of spelling mistakes in the Documentation. Fix them.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---

V2: Add fix to interconnect, thanks to Mukesh Ojha for spotting that

---
 Documentation/devicetree/bindings/bus/ti-sysc.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/bus/ti-sysc.txt b/Documentation/devicetree/bindings/bus/ti-sysc.txt
index 85a23f551f02..cf0e1d6d6f2e 100644
--- a/Documentation/devicetree/bindings/bus/ti-sysc.txt
+++ b/Documentation/devicetree/bindings/bus/ti-sysc.txt
@@ -131,6 +131,6 @@ using offsets from l4_cfg second segment (0x4a000000 + 0x80000 = 0x4a0ab000):
 		};
 	};
 
-Note that other SoCs, such as am335x can have multipe child devices. On am335x
+Note that other SoCs, such as am335x can have multiple child devices. On am335x
 there are two MUSB instances, two USB PHY instances, and a single CPPI41 DMA
-instance as children of a single interconnet target module.
+instance as children of a single interconnect target module.
-- 
2.20.1
