From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 04/17] ARM: dts: vesnin: Add unit address for memory node
Date: Fri, 26 Jul 2019 15:09:46 +0930
Message-ID: <20190726053959.2003-5-andrew@aj.id.au>
References: <20190726053959.2003-1-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190726053959.2003-1-andrew@aj.id.au>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-aspeed@lists.ozlabs.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>, linux-kernel@vger.kernel.org, Alexander Filippov <a.filippov@yadro.com>, robh+dt@kernel.org, joel@jms.id.au, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Fixes the following warnings:

    arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dt.yaml: /: memory: False schema does not allow {'reg': [[1073741824, 536870912]]}
    arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dt.yaml: memory: 'device_type' is a required property

Cc: Alexander Filippov <a.filippov@yadro.com>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts b/arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts
index 0b9e29c3212e..81d9dcb752a0 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts
@@ -14,7 +14,7 @@
 		bootargs = "console=ttyS4,115200 earlyprintk";
 	};
 
-	memory {
+	memory@40000000 {
 		reg = <0x40000000 0x20000000>;
 	};
 
-- 
2.20.1
