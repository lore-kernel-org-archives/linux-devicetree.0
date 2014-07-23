From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH] of: Add vendor prefix for Energy Micro
Date: Wed, 23 Jul 2014 22:22:49 +0200
Message-ID: <1406146969-26279-1-git-send-email-u.kleine-koenig@pengutronix.de>
References: <1395756677-6166-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1395756677-6166-1-git-send-email-u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The kernel supports devices with the following compatible strings
already:

	energymicro,efm32-i2c
	energymicro,efm32-uart
	energymicro,efm32-spi
	energymicro,efm32-timer

So add "energymicro" to the list of vendors.

Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
Hello,

An earlier version (with a different changelog) was sent with
Message-Id: 1395756677-6166-1-git-send-email-u.kleine-koenig@pengutroni=
x.de
in March and got an Ack by Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> and
Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>.
I adapted the change log because the drivers are in mainline in the mea=
ntime.

Best regards
Uwe

 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Do=
cumentation/devicetree/bindings/vendor-prefixes.txt
index 46a311e728a8..b9c84039d0c3 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -42,6 +42,7 @@ dmo	Data Modul AG
 ebv	EBV Elektronik
 edt	Emerging Display Technologies
 emmicro	EM Microelectronic
+energymicro	Silicon Laboratories (formerly Energy Micro AS)
 epfl	Ecole Polytechnique F=C3=A9d=C3=A9rale de Lausanne
 epson	Seiko Epson Corp.
 est	ESTeem Wireless Modems
--=20
2.0.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
