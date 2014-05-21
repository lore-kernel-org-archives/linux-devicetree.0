From: Nikolay Borisov <Nikolay.Borisov-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH RESEND 1/2] irqchip: Add generic gic-v1/gic-v2 compat strings.
Date: Wed, 21 May 2014 14:48:04 +0100
Message-ID: <1400680085-10430-2-git-send-email-Nikolay.Borisov@arm.com>
References: <1400680085-10430-1-git-send-email-Nikolay.Borisov@arm.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400680085-10430-1-git-send-email-Nikolay.Borisov-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The current set of GIC compatible strings only contains specific
implementations (e.g. arm,cortex-a9-gic) rather than revisions of the
standard (e.g. arm,gic-v2), so each new implementation must either claim
to be an extension of an existing implementation or have a new string
added to the driver. This may be problematic when workarounds are
required for bugs in particular implementations, as said workaround may
end up targeting a wider set of implementations than intended.

To prevent these issues, this patch adds compatible strings for the
revisions of the GIC spec which all GIC implementations should be able
to claim conformance to in addition to any particular implementation
specific string, e.g.

compatible =3D "$VENDOR,specific-gic-variant", "arm,gic-v2";

Signed-off-by: Nikolay Borisov <Nikolay.Borisov-5wv7dgnIgG8@public.gmane.org>
Acked-by: Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>
---
 drivers/irqchip/irq-gic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
index 57d165e..89e9b05 100644
--- a/drivers/irqchip/irq-gic.c
+++ b/drivers/irqchip/irq-gic.c
@@ -1073,6 +1073,8 @@ gic_of_init(struct device_node *node, struct device_n=
ode *parent)
 }
 IRQCHIP_DECLARE(cortex_a15_gic, "arm,cortex-a15-gic", gic_of_init);
 IRQCHIP_DECLARE(cortex_a9_gic, "arm,cortex-a9-gic", gic_of_init);
+IRQCHIP_DECLARE(gic_v1, "arm,gic-v1", gic_of_init);
+IRQCHIP_DECLARE(gic_v2, "arm,gic-v2", gic_of_init);
 IRQCHIP_DECLARE(msm_8660_qgic, "qcom,msm-8660-qgic", gic_of_init);
 IRQCHIP_DECLARE(msm_qgic2, "qcom,msm-qgic2", gic_of_init);
=20
--=20
1.8.1.5


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
