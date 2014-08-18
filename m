From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 5/9] arm: dts: mt6589-aquaris5: Add boot argument
 earlyprintk
Date: Mon, 18 Aug 2014 16:58:33 +0200
Message-ID: <1408373917-10002-6-git-send-email-matthias.bgg@gmail.com>
References: <1408373917-10002-1-git-send-email-matthias.bgg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1408373917-10002-1-git-send-email-matthias.bgg@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org
Cc: mark.rutland@arm.com, heiko@sntech.de, anders.berg@lsi.com, linus.walleij@linaro.org, stefan@agner.ch, lee.jones@linaro.org, linux@arm.linux.org.uk, pawel.moll@arm.com, srv_yingjoe.chen@mediatek.com, sebastian.hesselbarth@gmail.com, devicetree@vger.kernel.org, jason@lakedaemon.net, arnd@arndb.de, ijc+devicetree@hellion.org.uk, robh+dt@kernel.org, matthias.bgg@gmail.com, swarren@nvidia.com, linux-arm-kernel@lists.infradead.org, thomas.petazzoni@free-electrons.com, galak@codeaurora.org, olof@lixom.net, maxime.ripard@free-electrons.com
List-Id: devicetree@vger.kernel.org

Add boot argument for earlyprintk to the aquaris5 device tree file.

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 arch/arm/boot/dts/mt6589-aquaris5.dts |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/mt6589-aquaris5.dts b/arch/arm/boot/dts/mt6589-aquaris5.dts
index 443b446..74cb1ba 100644
--- a/arch/arm/boot/dts/mt6589-aquaris5.dts
+++ b/arch/arm/boot/dts/mt6589-aquaris5.dts
@@ -19,6 +19,10 @@
 / {
 	model = "bq Aquaris5";
 
+	chosen {
+		bootargs = "earlyprintk";
+	};
+
 	memory {
 		reg = <0x80000000 0x40000000>;
 	};
-- 
1.7.9.5
