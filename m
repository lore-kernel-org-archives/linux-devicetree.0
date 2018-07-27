From: =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
Subject: [PATCH] dt-bindings: Add Y Soft Corporation vendor prefix
Date: Fri, 27 Jul 2018 14:15:15 +0200
Message-ID: <1532693715-5234-1-git-send-email-michal.vokac@ysoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
List-Id: devicetree@vger.kernel.org

Y Soft is headquartered in the Czech Republic and it is a worldwide
provider of enterprise office solutions for print management.

Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
---
I work towards upstreaming support for our custom i.MX6 based SBCs.
Those boards are used in our various products. This vendor prefix will
come handy later when the DTS files are ready for submission.

Thanks, Michal. 

 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 500d5dc..f38fe0b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -413,6 +413,7 @@ xes	Extreme Engineering Solutions (X-ES)
 xillybus	Xillybus Ltd.
 xlnx	Xilinx
 xunlong	Shenzhen Xunlong Software CO.,Limited
+ysoft	Y Soft Corporation a.s.
 zarlink	Zarlink Semiconductor
 zeitec	ZEITEC Semiconductor Co., LTD.
 zidoo	Shenzhen Zidoo Technology Co., Ltd.
-- 
2.1.4
