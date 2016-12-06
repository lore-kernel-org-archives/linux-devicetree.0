From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v3 1/6] mfd: dt: Fix "indicates" typo in mfd bindings document
Date: Tue,  6 Dec 2016 13:53:16 +1100
Message-ID: <20161206025321.1792-2-andrew@aj.id.au>
References: <20161206025321.1792-1-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161206025321.1792-1-andrew@aj.id.au>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Corey Minyard <minyard@acm.org>, Andrew Jeffery <andrew@aj.id.au>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, linux-arm-kernel@lists.infradead.org, Joel Stanley <joel@jms.id.au>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 Documentation/devicetree/bindings/mfd/mfd.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/mfd.txt b/Documentation/devicetree/bindings/mfd/mfd.txt
index af9d6931a1a2..f1fceeda12f1 100644
--- a/Documentation/devicetree/bindings/mfd/mfd.txt
+++ b/Documentation/devicetree/bindings/mfd/mfd.txt
@@ -19,7 +19,7 @@ Optional properties:
 
 - compatible : "simple-mfd" - this signifies that the operating system should
   consider all subnodes of the MFD device as separate devices akin to how
-  "simple-bus" inidicates when to see subnodes as children for a simple
+  "simple-bus" indicates when to see subnodes as children for a simple
   memory-mapped bus. For more complex devices, when the nexus driver has to
   probe registers to figure out what child devices exist etc, this should not
   be used. In the latter case the child devices will be determined by the
-- 
2.9.3
