From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v5 07/10] [media] marvell-ccic: rename the clocks
Date: Sun,  5 May 2019 16:00:28 +0200
Message-ID: <20190505140031.9636-8-lkundrak@v3.sk>
References: <20190505140031.9636-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190505140031.9636-1-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet <corbet@lwn.net>, linux-media@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, James Cameron <quozl@laptop.org>, Pavel Machek <pavel@ucw.cz>, Libin Yang <lbyang@marvell.com>, Albert Wang <twang13@marvell.com>, jacopo mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@iki.fi>, Lubomir Rintel <lkundrak@v3.sk>
List-Id: devicetree@vger.kernel.org

Use the names more suitable for devicetree bindings.

There are no board files utilizing this, thus we seem to be at liberty
at renaming this without consequences.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

---
Changes since v2:
- This patch was added to the series

 drivers/media/platform/marvell-ccic/mmp-driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/marvell-ccic/mmp-driver.c b/drivers/m=
edia/platform/marvell-ccic/mmp-driver.c
index 352e67fc10621..8f1d2a972bc9f 100644
--- a/drivers/media/platform/marvell-ccic/mmp-driver.c
+++ b/drivers/media/platform/marvell-ccic/mmp-driver.c
@@ -33,7 +33,7 @@ MODULE_ALIAS("platform:mmp-camera");
 MODULE_AUTHOR("Jonathan Corbet <corbet@lwn.net>");
 MODULE_LICENSE("GPL");
=20
-static char *mcam_clks[] =3D {"CCICAXICLK", "CCICFUNCLK", "CCICPHYCLK"};
+static char *mcam_clks[] =3D {"axi", "func", "phy"};
=20
 struct mmp_camera {
 	void __iomem *power_regs;
--=20
2.21.0
