From: "=?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?=" <vokac.m@gmail.com>
Subject: [PATCH net-next v3 6/7] net: dsa: qca8k: Replace GPL boilerplate by SPDX
Date: Wed, 23 May 2018 08:20:23 +0200
Message-ID: <1527056424-14528-7-git-send-email-michal.vokac@ysoft.com>
References: <1527056424-14528-1-git-send-email-michal.vokac@ysoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1527056424-14528-1-git-send-email-michal.vokac@ysoft.com>
Sender: linux-kernel-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, f.fainelli@gmail.com, vivien.didelot@savoirfairelinux.com, andrew@lunn.ch, mark.rutland@arm.com, robh+dt@kernel.org, davem@davemloft.net, michal.vokac@ysoft.com
List-Id: devicetree@vger.kernel.org

Replace the GPLv2 license boilerplate with the SPDX license identifier.

Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
---
Changes in v3:
 - none

Changes in v2:
 - Add commit message.
 - Add "Reviewed-by" tags from Andrew and Florian.

 drivers/net/dsa/qca8k.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/net/dsa/qca8k.c b/drivers/net/dsa/qca8k.c
index 7eba987..c834893 100644
--- a/drivers/net/dsa/qca8k.c
+++ b/drivers/net/dsa/qca8k.c
@@ -1,17 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (C) 2009 Felix Fietkau <nbd@nbd.name>
  * Copyright (C) 2011-2012 Gabor Juhos <juhosg@openwrt.org>
  * Copyright (c) 2015, The Linux Foundation. All rights reserved.
  * Copyright (c) 2016 John Crispin <john@phrozen.org>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 and
- * only version 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
  */
 
 #define DEBUG
-- 
2.7.4
