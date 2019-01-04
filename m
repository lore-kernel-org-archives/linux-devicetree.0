From: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
Subject: [PATCH 3/4] dts: dps650ab: add dps650ab device tree
Date: Fri, 4 Jan 2019 17:03:49 +0800
Message-ID: <9d928198965a0de4207582d7008c8a9916543445.1546591275.git.xiaoting.liu@hxt-semitech.com>
References: <cover.1546591275.git.xiaoting.liu@hxt-semitech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1546591275.git.xiaoting.liu@hxt-semitech.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, mark.rutland@arm.com
Cc: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>, devicetree@vger.kernel.org, shunyong.yang@hxt-semitech.com, linux-aspeed@lists.ozlabs.org, dongsheng.wang@hxt-semitech.com, andrew@aj.id.au, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, joel@jms.id.au, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add dps650ab device tree to support power supply dps650ab driver.

Signed-off-by: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
---
 arch/arm/boot/dts/aspeed-bmc-arm-stardragon4800-rep2.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-arm-stardragon4800-rep2.dts b/arch/arm/boot/dts/aspeed-bmc-arm-stardragon4800-rep2.dts
index bdfd8c9f3a7c..e7e59da6c9ae 100644
--- a/arch/arm/boot/dts/aspeed-bmc-arm-stardragon4800-rep2.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-arm-stardragon4800-rep2.dts
@@ -173,6 +173,16 @@
                        };
                };
        };
+
+       dps650ab@58 {
+               compatible = "dps650ab";
+               reg = <0x58>;
+       };
+
+       dps650ab@59 {
+               compatible = "dps650ab";
+               reg = <0x59>;
+       };
 };

 &i2c9 {
--
1.8.3.1




This email is intended only for the named addressee. It may contain information that is confidential/private, legally privileged, or copyright-protected, and you should handle it accordingly. If you are not the intended recipient, you do not have legal rights to retain, copy, or distribute this email or its contents, and should promptly delete the email and all electronic copies in your system; do not retain copies in any media. If you have received this email in error, please notify the sender promptly. Thank you.
