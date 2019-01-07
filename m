From: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
Subject: [PATCH v2 3/4] dts: dps650ab: add dps650ab device tree
Date: Mon, 7 Jan 2019 19:05:02 +0800
Message-ID: <081a2f0f05bc92e67771f8103032c42d5fb5ffbb.1546851856.git.xiaoting.liu@hxt-semitech.com>
References: <cover.1546851856.git.xiaoting.liu@hxt-semitech.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1546851856.git.xiaoting.liu@hxt-semitech.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com
Cc: openbmc@lists.ozlabs.org, joel@jms.id.au, andrew@aj.id.au, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, shunyong.yang@hxt-semitech.com, dongsheng.wang@hxt-semitech.com, Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
List-Id: devicetree@vger.kernel.org

Add dps650ab device tree to support power supply dps650ab driver

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
