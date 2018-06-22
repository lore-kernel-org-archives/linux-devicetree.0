From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 01/17] platform-msi: allow creation of MSI domain without
 interrupt number
Date: Fri, 22 Jun 2018 17:14:16 +0200
Message-ID: <20180622151432.1566-2-miquel.raynal@bootlin.com>
References: <20180622151432.1566-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180622151432.1566-1-miquel.raynal@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Haim Boot <hayim@marvell.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Hanna Hawa <hannah@marvell.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

platform_msi_alloc_priv_data() checks that a number of interrupts is
always given. This extra-check has no real impact and just prevents
uselessly the user to create an MSI tree domain: remove it.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/base/platform-msi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/platform-msi.c b/drivers/base/platform-msi.c
index 60d6cc618f1c..9f001f4ccc0f 100644
--- a/drivers/base/platform-msi.c
+++ b/drivers/base/platform-msi.c
@@ -203,7 +203,7 @@ platform_msi_alloc_priv_data(struct device *dev, unsigned int nvec,
 	 * accordingly (which would impact the max number of MSI
 	 * capable devices).
 	 */
-	if (!dev->msi_domain || !write_msi_msg || !nvec || nvec > MAX_DEV_MSIS)
+	if (!dev->msi_domain || !write_msi_msg || nvec > MAX_DEV_MSIS)
 		return ERR_PTR(-EINVAL);
 
 	if (dev->msi_domain->bus_token != DOMAIN_BUS_PLATFORM_MSI) {
-- 
2.14.1
