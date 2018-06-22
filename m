From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v4] MAINTAINERS: Add file patterns for dsa device tree bindings
Date: Fri, 22 Jun 2018 12:08:13 +0200
Message-ID: <20180622100813.29122-1-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S . Miller" <davem@davemloft.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: devicetree@vger.kernel.org

Submitters of device tree binding documentation may forget to CC
the subsystem maintainer if this is missing.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
v3:
  - Update for next-20180622,

v2.1:
  - Moved pattern to "NETWORKING [DSA]",

v2:
  - Rebased on top of commit 0d3cd4b6b49865e8 ("net: dsa: mv88e6xxx:
    move driver in its own folder").

Impact on "scripts/get_maintainer.pl -f Documentation/devicetree/bindings/net/dsa/":

-"David S. Miller" <davem@davemloft.net> (odd fixer:NETWORKING DRIVERS,commit_signer:6/8=75%)
-Rob Herring <robh+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS,commit_signer:3/8=38%,authored:1/8=12%)
+Andrew Lunn <andrew@lunn.ch> (maintainer:NETWORKING [DSA])
+Vivien Didelot <vivien.didelot@savoirfairelinux.com> (maintainer:NETWORKING [DSA])
+Florian Fainelli <f.fainelli@gmail.com> (maintainer:NETWORKING [DSA])
+"David S. Miller" <davem@davemloft.net> (odd fixer:NETWORKING DRIVERS)
+Rob Herring <robh+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
 Mark Rutland <mark.rutland@arm.com> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
-Andrew Lunn <andrew@lunn.ch> (commit_signer:3/8=38%)
-Florian Fainelli <f.fainelli@gmail.com> (commit_signer:3/8=38%)
-Brandon Streiff <brandon.streiff@ni.com> (commit_signer:1/8=12%)
-Egil Hjelmeland <privat@egil-hjelmeland.no> (authored:1/8=12%)
-Fabio Estevam <fabio.estevam@nxp.com> (authored:1/8=12%)
-"Damien Thébault" <damien.thebault@vitec.com> (authored:1/8=12%)
-"Michal Vokáč" <vokac.m@gmail.com> (authored:1/8=12%)
 netdev@vger.kernel.org (open list:NETWORKING DRIVERS)
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
 linux-kernel@vger.kernel.org (open list)
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e5db502df5afdd8b..07a4927b1e7aada4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9884,6 +9884,7 @@ M:	Andrew Lunn <andrew@lunn.ch>
 M:	Vivien Didelot <vivien.didelot@savoirfairelinux.com>
 M:	Florian Fainelli <f.fainelli@gmail.com>
 S:	Maintained
+F:	Documentation/devicetree/bindings/net/dsa/
 F:	net/dsa/
 F:	include/net/dsa.h
 F:	include/linux/dsa/
-- 
2.17.1
