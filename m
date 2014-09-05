From: Jean-Michel Hautbois <jean-michel.hautbois@vodalys.com>
Subject: [PATCH 2/2] adv7604: Add DT parsing support
Date: Fri,  5 Sep 2014 16:19:33 +0200
Message-ID: <1409926773-30696-2-git-send-email-jean-michel.hautbois@vodalys.com>
References: <1409926773-30696-1-git-send-email-jean-michel.hautbois@vodalys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1409926773-30696-1-git-send-email-jean-michel.hautbois@vodalys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc: m.chehab@samsung.com, hans.verkuil@cisco.com, laurent.pinchart@ideasonboard.com, mark.rutland@arm.com, lars@metafoo.de, Jean-Michel Hautbois <jean-michel.hautbois@vodalys.com>
List-Id: devicetree@vger.kernel.org

This allows specifying I=C2=B2C secodnary addresses different from defa=
ult ones.

Signed-off-by: Jean-Michel Hautbois <jean-michel.hautbois@vodalys.com>
---
 drivers/media/i2c/adv7604.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
index 8336c02..75613a4 100644
--- a/drivers/media/i2c/adv7604.c
+++ b/drivers/media/i2c/adv7604.c
@@ -2705,6 +2705,7 @@ MODULE_DEVICE_TABLE(i2c, adv7604_i2c_id);
=20
 static struct of_device_id adv7604_of_id[] __maybe_unused =3D {
 	{ .compatible =3D "adi,adv7611", .data =3D &adv7604_chip_info[ADV7611=
] },
+	{ .compatible =3D "adi,adv7604", .data =3D &adv7604_chip_info[ADV7604=
] },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, adv7604_of_id);
--=20
2.0.4
