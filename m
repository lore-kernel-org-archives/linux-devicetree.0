From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Subject: [PATCHv2 2/2] net: fec: Reset ethernet PHY whenever the enet_out clock is being enabled
Date: Tue, 12 Jan 2016 16:17:56 +0100
Message-ID: <1452611876-451-3-git-send-email-LW__12030.5307595574$1452613225$gmane$org@KARO-electronics.de>
References: <1452611876-451-1-git-send-email-LW@KARO-electronics.de>
 <1452611876-451-2-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1452611876-451-2-git-send-email-LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Greg Ungerer <gerg-JBU5SbJe1FlAfugRpC6u6w@public.gmane.org>, Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Nimrod Andy <B38611-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Philippe Reynes <tremyfr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Cochran <richardcochran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jeff Kirsher <jeffrey.t.kirsher-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>Russell
List-Id: devicetree@vger.kernel.org

If a PHY uses ENET_OUT as reference clock, it may need a RESET to get
functional after the clock had been disabled.

=46ailure to do this results in the link state constantly toggling
between up and down:
fec 02188000.ethernet eth0: Link is Up - 100Mbps/Full - flow control rx=
/tx
fec 02188000.ethernet eth0: Link is Down
fec 02188000.ethernet eth0: Link is Up - 100Mbps/Full - flow control rx=
/tx
fec 02188000.ethernet eth0: Link is Down
[...]

Signed-off-by: Lothar Wa=C3=9Fmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
---
 drivers/net/ethernet/freescale/fec.h      |  1 +
 drivers/net/ethernet/freescale/fec_main.c | 38 +++++++++++++++++++++++=
++------
 2 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fec.h b/drivers/net/etherne=
t/freescale/fec.h
index 99d33e2..33228df 100644
--- a/drivers/net/ethernet/freescale/fec.h
+++ b/drivers/net/ethernet/freescale/fec.h
@@ -519,6 +519,7 @@ struct fec_enet_private {
 	int	pause_flag;
 	int	wol_flag;
 	u32	quirks;
+	int	phy_reset_gpio;
=20
 	struct	napi_struct napi;
 	int	csum_flags;
diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/et=
hernet/freescale/fec_main.c
index 592a7a4..fb0b0eb 100644
--- a/drivers/net/ethernet/freescale/fec_main.c
+++ b/drivers/net/ethernet/freescale/fec_main.c
@@ -67,6 +67,7 @@
=20
 static void set_multicast_list(struct net_device *ndev);
 static void fec_enet_itr_coal_init(struct net_device *ndev);
+static void fec_reset_phy(struct platform_device *pdev);
=20
 #define DRIVER_NAME	"fec"
=20
@@ -1862,6 +1863,8 @@ static int fec_enet_clk_enable(struct net_device =
*ndev, bool enable)
 			ret =3D clk_prepare_enable(fep->clk_enet_out);
 			if (ret)
 				goto failed_clk_enet_out;
+
+			fec_reset_phy(fep->pdev);
 		}
 		if (fep->clk_ptp) {
 			mutex_lock(&fep->ptp_clk_mutex);
@@ -3216,11 +3219,12 @@ static int fec_enet_init(struct net_device *nde=
v)
 #ifdef CONFIG_OF
 static void fec_reset_phy(struct platform_device *pdev)
 {
-	int err, phy_reset;
-	int msec =3D 1;
+	struct net_device *ndev =3D platform_get_drvdata(pdev);
+	struct fec_enet_private *fep =3D netdev_priv(ndev);
 	struct device_node *np =3D pdev->dev.of_node;
+	int msec =3D 1;
=20
-	if (!np)
+	if (!gpio_is_valid(fep->phy_reset_gpio))
 		return;
=20
 	of_property_read_u32(np, "phy-reset-duration", &msec);
@@ -3228,18 +3232,27 @@ static void fec_reset_phy(struct platform_devic=
e *pdev)
 	if (msec > 1000)
 		msec =3D 1;
=20
+	gpio_set_value_cansleep(fep->phy_reset_gpio, 0);
+	msleep(msec);
+	gpio_set_value_cansleep(fep->phy_reset_gpio, 1);
+}
+
+static int fec_get_reset_gpio(struct platform_device *pdev)
+{
+	int err, phy_reset;
+	struct device_node *np =3D pdev->dev.of_node;
+
 	phy_reset =3D of_get_named_gpio(np, "phy-reset-gpios", 0);
 	if (!gpio_is_valid(phy_reset))
-		return;
+		return phy_reset;
=20
 	err =3D devm_gpio_request_one(&pdev->dev, phy_reset,
 				    GPIOF_OUT_INIT_LOW, "phy-reset");
 	if (err) {
 		dev_err(&pdev->dev, "failed to get phy-reset-gpios: %d\n", err);
-		return;
+		return err;
 	}
-	msleep(msec);
-	gpio_set_value_cansleep(phy_reset, 1);
+	return phy_reset;
 }
 #else /* CONFIG_OF */
 static void fec_reset_phy(struct platform_device *pdev)
@@ -3249,6 +3262,11 @@ static void fec_reset_phy(struct platform_device=
 *pdev)
 	 * by machine code.
 	 */
 }
+
+static inline int fec_get_reset_gpio(struct platform_device *pdev)
+{
+	return -EINVAL;
+}
 #endif /* CONFIG_OF */
=20
 static void
@@ -3339,6 +3357,11 @@ fec_probe(struct platform_device *pdev)
=20
 	platform_set_drvdata(pdev, ndev);
=20
+	ret =3D fec_get_reset_gpio(pdev);
+	if (ret =3D=3D -EPROBE_DEFER)
+		goto gpio_defer;
+	fep->phy_reset_gpio =3D ret;
+
 	if (of_get_property(np, "fsl,magic-packet", NULL))
 		fep->wol_flag |=3D FEC_WOL_HAS_MAGIC_PACKET;
=20
@@ -3493,6 +3516,7 @@ failed_clk_ipg:
 failed_clk:
 failed_phy:
 	of_node_put(phy_node);
+gpio_defer:
 failed_ioremap:
 	free_netdev(ndev);
=20
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
