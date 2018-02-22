Return-Path: <SRS0=KPmr=FQ=cavium.com=David.Daney@kernel.org>
From: David Daney <david.daney@cavium.com>
Subject: [PATCH v8 3/3] MAINTAINERS: Add entry for drivers/net/ethernet/cavium/octeon/octeon3-*
Date: Thu, 22 Feb 2018 15:32:05 -0800
Message-Id: <20180222233205.28857-4-david.daney@cavium.com>
In-Reply-To: <20180222233205.28857-1-david.daney@cavium.com>
References: <20180222233205.28857-1-david.daney@cavium.com>
MIME-Version: 1.0
Content-Type: text/plain
To: linux-mips@linux-mips.org, ralf@linux-mips.org, James Hogan <james.hogan@mips.com>, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org, "Steven J. Hill" <steven.hill@cavium.com>, devicetree@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Philippe Ombredanne <pombredanne@nexb.com>, David Daney <david.daney@cavium.com>
List-ID: <devicetree@vger.kernel.org>

Signed-off-by: David Daney <david.daney@cavium.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9a7f76eadae9..b36371ae590f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3259,6 +3259,12 @@ W:	http://www.cavium.com
 S:	Supported
 F:	drivers/mmc/host/cavium*
 
+CAVIUM OCTEON-III NETWORK DRIVER
+M:	Steven J. Hill <Steven.Hill@cavium.com>
+L:	netdev@vger.kernel.org
+S:	Supported
+F:	drivers/net/ethernet/cavium/octeon/octeon3-*
+
 CAVIUM OCTEON-TX CRYPTO DRIVER
 M:	George Cherian <george.cherian@cavium.com>
 L:	linux-crypto@vger.kernel.org
-- 
2.14.3
