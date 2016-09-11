From: Jagan Teki <jagannadh.teki@gmail.com>
Subject: [PATCH v4 1/5] of: Add vendor prefix for Engicam s.r.l company
Date: Mon, 12 Sep 2016 00:00:37 +0530
Message-ID: <1473618641-10159-2-git-send-email-jagan@amarulasolutions.com>
References: <1473618641-10159-1-git-send-email-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1473618641-10159-1-git-send-email-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jagan Teki <jagan@amarulasolutions.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Matteo Lisi <matteo.lisi@engicam.com>, Michael Trimarchi <michael@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

Engicam providing design services of electronic systems with
high content of technology, relying on a long experience in
electronic design.

For more info visit
http://www.engicam.com/en/

Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Matteo Lisi <matteo.lisi@engicam.com>
Cc: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v4:
	- none

 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 3003f33..327e4c7 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -85,6 +85,7 @@ elan	Elan Microelectronic Corp.
 embest	Shenzhen Embest Technology Co., Ltd.
 emmicro	EM Microelectronic
 energymicro	Silicon Laboratories (formerly Energy Micro AS)
+engicam	Engicam S.r.l.
 epcos	EPCOS AG
 epfl	Ecole Polytechnique Fédérale de Lausanne
 epson	Seiko Epson Corp.
-- 
2.7.4
