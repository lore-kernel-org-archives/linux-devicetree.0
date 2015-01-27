From: Soren Brinkmann <soren.brinkmann@xilinx.com>
Subject: [PATCH] usb: phy-generic: Don't fail on missing gpio reset
Date: Mon, 26 Jan 2015 17:45:29 -0800
Message-ID: <1422323129-20969-1-git-send-email-soren.brinkmann@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Cc: Michal Simek <michal.simek@xilinx.com>, devicetree@vger.kernel.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ola Jeppson <ola@adapteva.com>, linux-gpio@vger.kernel.org, linux-usb@vger.kernel.org, Felipe Balbi <balbi@ti.com>, Soren Brinkmann <soren.brinkmann@xilinx.com>
List-Id: devicetree@vger.kernel.org

A reset through a GPIO is optional. Don't fail probing when it is
missing.

Reported-by: Andreas F=C3=A4rber <afaerber@suse.de>
Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
---
Hi Andreas,

does this do the trick?

	Thanks,
	S=C3=B6ren

 drivers/usb/phy/phy-generic.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/phy/phy-generic.c b/drivers/usb/phy/phy-generi=
c.c
index dd05254241fb..a73d4c738f0b 100644
--- a/drivers/usb/phy/phy-generic.c
+++ b/drivers/usb/phy/phy-generic.c
@@ -241,10 +241,8 @@ int usb_phy_gen_create_phy(struct device *dev, str=
uct usb_phy_generic *nop,
=20
 	if (err =3D=3D -EPROBE_DEFER)
 		return -EPROBE_DEFER;
-	if (err) {
-		dev_err(dev, "Error requesting RESET GPIO\n");
-		return err;
-	}
+	if (err)
+		nop->gpiod_reset =3D NULL;
=20
 	nop->phy.otg =3D devm_kzalloc(dev, sizeof(*nop->phy.otg),
 			GFP_KERNEL);
--=20
2.2.2.1.g63c5777
