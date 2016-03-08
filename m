From: Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v5 1/1] Fixes: 3145229f9191 ("iio:pressure:ms5611: power regulator support")
Date: Tue, 8 Mar 2016 19:00:32 +0100
Message-ID: <26a4b9ab8ae9b40f9c96c51f12c977fdad36532f.1457459537.git.gregor.boirie@parrot.com>
References: <cover.1457459537.git.gregor.boirie@parrot.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1457459537.git.gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Tomasz Duszynski <tduszyns-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Baluta <daniel.baluta-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

When not compiled-in, regulator layer will return a NULL=C2=A0pointer w=
hen
trying to get a reference to any regulator using devm_regulator_get(). =
 As
IS_ERR() does not consider this an error, the ms5611 probing operation =
will
try to enable a NULL regulator, which will invariably cause a kernel
crash.
This patch fixes this situation by using devm_regulator_get_optional()
instead of devm_regulator_get().

Signed-off-by: Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
---
 drivers/iio/pressure/ms5611_core.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/pressure/ms5611_core.c b/drivers/iio/pressure/=
ms5611_core.c
index 37dbc04..a2a871b 100644
--- a/drivers/iio/pressure/ms5611_core.c
+++ b/drivers/iio/pressure/ms5611_core.c
@@ -387,8 +387,8 @@ static const struct iio_info ms5611_info =3D {
 static int ms5611_init(struct iio_dev *indio_dev)
 {
 	int ret;
-	struct regulator *vdd =3D devm_regulator_get(indio_dev->dev.parent,
-	                                           "vdd");
+	struct regulator *vdd =3D
+		devm_regulator_get_optional(indio_dev->dev.parent, "vdd");
=20
 	/* Enable attached regulator if any. */
 	if (!IS_ERR(vdd)) {
@@ -398,6 +398,10 @@ static int ms5611_init(struct iio_dev *indio_dev)
 			        "failed to enable Vdd supply: %d\n", ret);
 			return ret;
 		}
+	} else {
+		ret =3D PTR_ERR(vdd);
+		if (ret !=3D -ENODEV)
+			return ret;
 	}
=20
 	ret =3D ms5611_reset(indio_dev);
--=20
2.1.4
