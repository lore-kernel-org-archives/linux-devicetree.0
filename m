From: andrej@inversepath.com
Subject: [PATCH 1/2] devicetree: Add vendor prefix for Inverse Path
Date: Tue, 21 Jun 2016 16:50:52 +0200
Message-ID: <20160621145053.7742-2-andrej@inversepath.com>
References: <20160621145053.7742-1-andrej@inversepath.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160621145053.7742-1-andrej@inversepath.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org
Cc: Vagrant Cascadian <vagrant@debian.org>, linux-kernel@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Andrej Rosano <andrej@inversepath.com>

Inverse Path is an information security consulting company:
https://inversepath.com

Signed-off-by: Andrej Rosano <andrej@inversepath.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 2c2500d..37bfd91 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -134,6 +134,7 @@ innolux	Innolux Corporation
 intel	Intel Corporation
 intercontrol	Inter Control Group
 invensense	InvenSense Inc.
+inversepath	Inverse Path
 isee	ISEE 2007 S.L.
 isil	Intersil
 issi	Integrated Silicon Solutions Inc.
-- 
2.9.0
