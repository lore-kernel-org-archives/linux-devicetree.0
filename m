From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 1/3] pinctrl: mvebu: Add CP110 missing pin functionality
Date: Mon,  5 Aug 2019 12:16:05 +0200
Message-ID: <20190805101607.29811-2-miquel.raynal@bootlin.com>
References: <20190805101607.29811-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190805101607.29811-1-miquel.raynal@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, Yan Markman <ymarkman@marvell.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Grzegorz Jaszczyk <jaz@semihalf.com>, Gregory Clement <gregory.clement@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, linux-gpio@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Konstantin Porotchkin <kostap@marvell.com>, Stefan Chulski <stefanc@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Konstantin Porotchkin <kostap@marvell.com>

Add missing definition for function 0xe on CP-110 MPP-62.
The pin function is Data Strobe for SDIO interface.

Signed-off-by: Konstantin Porotchkin <kostap@marvell.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/pinctrl/mvebu/pinctrl-armada-cp110.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-cp110.c b/drivers/pinctrl/mvebu/pinctrl-armada-cp110.c
index 584952b2ba47..85ade9761885 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-cp110.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-cp110.c
@@ -597,7 +597,8 @@ static struct mvebu_mpp_mode armada_cp110_mpp_modes[] = {
 		 MPP_FUNCTION(7,	"uart0",	"rxd"),
 		 MPP_FUNCTION(8,	"uart2",	"rxd"),
 		 MPP_FUNCTION(9,	"sata0",	"present_act"),
-		 MPP_FUNCTION(10,	"ge",		"mdc")),
+		 MPP_FUNCTION(10,	"ge",		"mdc"),
+		 MPP_FUNCTION(14,	"sdio",		"ds")),
 };
 
 static const struct of_device_id armada_cp110_pinctrl_of_match[] = {
-- 
2.20.1
