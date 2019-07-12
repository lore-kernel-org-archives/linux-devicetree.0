From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v9 8/8] EDAC: armada_xp: Add support for more SoCs
Date: Fri, 12 Jul 2019 15:49:04 +1200
Message-ID: <20190712034904.5747-9-chris.packham@alliedtelesis.co.nz>
References: <20190712034904.5747-1-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190712034904.5747-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: bp@alien8.de, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, patches@armlinux.org.uk, mchehab@kernel.org, james.morse@arm.com, jlu@pengutronix.de
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>
List-Id: devicetree@vger.kernel.org

The Armada 38x and other integrated SoCs use a reduced pin count so the
width of the SDRAM interface is smaller than the Armada XP SoCs. This
means that the definition of "full" and "half" width is reduced from
64/32 to 32/16.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/edac/armada_xp_edac.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/edac/armada_xp_edac.c b/drivers/edac/armada_xp_edac.=
c
index 3759a4fbbdee..7f227bdcbc84 100644
--- a/drivers/edac/armada_xp_edac.c
+++ b/drivers/edac/armada_xp_edac.c
@@ -332,6 +332,11 @@ static int axp_mc_probe(struct platform_device *pdev=
)
=20
 	axp_mc_read_config(mci);
=20
+	/* These SoCs have a reduced width bus */
+	if (of_machine_is_compatible("marvell,armada380") ||
+	    of_machine_is_compatible("marvell,armadaxp-98dx3236"))
+		drvdata->width /=3D 2;
+
 	/* configure SBE threshold */
 	/* it seems that SBEs are not captured otherwise */
 	writel(1 << SDRAM_ERR_CTRL_THR_OFFSET, drvdata->base + SDRAM_ERR_CTRL_R=
EG);
--=20
2.22.0
