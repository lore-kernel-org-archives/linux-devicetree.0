From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v2 09/20] irqchip/mmp: coexist with GIC root IRQ controller
Date: Thu, 22 Aug 2019 11:26:32 +0200
Message-ID: <20190822092643.593488-10-lkundrak@v3.sk>
References: <20190822092643.593488-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190822092643.593488-1-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
List-Id: devicetree@vger.kernel.org

On MMP3, the GIC can be set as a root IRQ interrupt controller. If the
device tree indicated that GIC is enabled, avoid hooking up
mmp2_handle_irq().

The interrupt muxes are still being used.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 drivers/irqchip/irq-mmp.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-mmp.c b/drivers/irqchip/irq-mmp.c
index 25848d73f6792..c8e7b098ccf71 100644
--- a/drivers/irqchip/irq-mmp.c
+++ b/drivers/irqchip/irq-mmp.c
@@ -470,7 +470,12 @@ static int __init mmp3_of_init(struct device_node *n=
ode,
 	icu_data[0].conf_disable =3D mmp3_conf.conf_disable;
 	icu_data[0].conf_mask =3D mmp3_conf.conf_mask;
 	icu_data[0].conf2_mask =3D mmp3_conf.conf2_mask;
-	set_handle_irq(mmp2_handle_irq);
+
+	if (!parent) {
+		/* This is the main interrupt controller. */
+		set_handle_irq(mmp2_handle_irq);
+	}
+
 	max_icu_nr =3D 1;
 	return 0;
 }
--=20
2.21.0
