From: David Daney <david.daney@cavium.com>
Subject: [PATCH v3 8/8] MAINTAINERS: Add entry for
 drivers/net/ethernet/cavium/octeon/octeon3-*
Date: Thu,  9 Nov 2017 11:29:15 -0800
Message-ID: <20171109192915.11912-9-david.daney@cavium.com>
References: <20171109192915.11912-1-david.daney@cavium.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20171109192915.11912-1-david.daney@cavium.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: linux-mips@linux-mips.org, ralf@linux-mips.org, James Hogan <james.hogan@mips.com>, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, David Daney <david.daney@cavium.com>, linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, "Steven J. Hill" <steven.hill@cavium.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: David Daney <david.daney@cavium.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9a24f56e0451..142af33adc35 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3212,6 +3212,12 @@ W:	http://www.cavium.com
 S:	Supported
 F:	drivers/mmc/host/cavium*
 
+CAVIUM OCTEON-III NETWORK DRIVER
+M:	David Daney <david.daney@cavium.com>
+L:	netdev@vger.kernel.org
+S:	Supported
+F:	drivers/net/ethernet/cavium/octeon/octeon3-*
+
 CAVIUM OCTEON-TX CRYPTO DRIVER
 M:	George Cherian <george.cherian@cavium.com>
 L:	linux-crypto@vger.kernel.org
-- 
2.13.6
