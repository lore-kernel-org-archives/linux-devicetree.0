From: "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>
Subject: [PATCH 2/2] dt-bindings: peci: aspeed: Add AST2600 compatible
Date: Wed, 2 Oct 2019 14:12:00 +0800
Message-ID: <20191002061200.29888-3-chiawei_wang@aspeedtech.com>
References: <20191002061200.29888-1-chiawei_wang@aspeedtech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191002061200.29888-1-chiawei_wang@aspeedtech.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: jae.hyun.yoo@linux.intel.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, ryan_chen@aspeedtech.com, linux-aspeed@lists.ozlabs.org, andrew@aj.id.au, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, joel@jms.id.au, jason.m.bills@linux.intel.com, chiawei_wang@aspeedtech.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Document the AST2600 PECI controller compatible string.

Signed-off-by: Chia-Wei, Wang <chiawei_wang@aspeedtech.com>
---
 Documentation/devicetree/bindings/peci/peci-aspeed.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/peci/peci-aspeed.txt b/Documentation/devicetree/bindings/peci/peci-aspeed.txt
index cdca73a3b7d8..cddd2d2aa58f 100644
--- a/Documentation/devicetree/bindings/peci/peci-aspeed.txt
+++ b/Documentation/devicetree/bindings/peci/peci-aspeed.txt
@@ -4,6 +4,7 @@ Required properties:
 - compatible        : Should be one of:
 			"aspeed,ast2400-peci"
 			"aspeed,ast2500-peci"
+			"aspeed,ast2600-peci"
 - reg               : Should contain PECI controller registers location and
 		      length.
 - #address-cells    : Should be <1> required to define a client address.
-- 
2.17.1
