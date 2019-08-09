From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 08/19] irqchip/mmp: coexist with GIC root IRQ controller
Date: Fri,  9 Aug 2019 11:31:47 +0200
Message-ID: <20190809093158.7969-9-lkundrak@v3.sk>
References: <20190809093158.7969-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190809093158.7969-1-lkundrak@v3.sk>
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
 drivers/irqchip/irq-mmp.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-mmp.c b/drivers/irqchip/irq-mmp.c
index 25497c75cc861..28feb0f393056 100644
--- a/drivers/irqchip/irq-mmp.c
+++ b/drivers/irqchip/irq-mmp.c
@@ -472,8 +472,13 @@ static int __init mmp3_of_init(struct device_node *n=
ode,
 	icu_data[0].conf_disable =3D mmp3_conf.conf_disable;
 	icu_data[0].conf_mask =3D mmp3_conf.conf_mask;
 	icu_data[0].conf2_mask =3D mmp3_conf.conf2_mask;
-	irq_set_default_host(icu_data[0].domain);
-	set_handle_irq(mmp2_handle_irq);
+
+	if (!parent) {
+		/* This is the main interrupt controller. */
+		irq_set_default_host(icu_data[0].domain);
+		set_handle_irq(mmp2_handle_irq);
+	}
+
 	max_icu_nr =3D 1;
 	return 0;
 }
--=20
2.21.0
