From: Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC] bcm63xx-rng: use clk_{prepare_enable,disable_unprepare}
Date: Sun, 11 Nov 2012 13:50:40 +0100
Message-ID: <1352638249-29298-7-git-send-email-jonas.gorski@gmail.com>
References: <1352638249-29298-1-git-send-email-jonas.gorski@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1352638249-29298-1-git-send-email-jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Maxime Bizon <mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org>, Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Use proper clk_prepare/unprepare calls in preparation for switching to
the generic clock framework.

Signed-off-by: Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/char/hw_random/bcm63xx-rng.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/char/hw_random/bcm63xx-rng.c b/drivers/char/hw_random/bcm63xx-rng.c
index aec6a42..3693f56 100644
--- a/drivers/char/hw_random/bcm63xx-rng.c
+++ b/drivers/char/hw_random/bcm63xx-rng.c
@@ -122,7 +122,7 @@ static int __devinit bcm63xx_rng_probe(struct platform_device *pdev)
 		goto out_free_rng;
 	}
 
-	clk_enable(clk);
+	clk_prepare_enable(clk);
 
 	ret = hwrng_register(rng);
 	if (ret) {
@@ -135,7 +135,7 @@ static int __devinit bcm63xx_rng_probe(struct platform_device *pdev)
 	return 0;
 
 out_clk_disable:
-	clk_disable(clk);
+	clk_disable_unprepare(clk);
 out_free_rng:
 	platform_set_drvdata(pdev, NULL);
 	kfree(rng);
@@ -151,7 +151,7 @@ static int __devexit bcm63xx_rng_remove(struct platform_device *pdev)
 	struct bcm63xx_rng_priv *priv = to_rng_priv(rng);
 
 	hwrng_unregister(rng);
-	clk_disable(priv->clk);
+	clk_disable_unprepare(priv->clk);
 	kfree(priv);
 	kfree(rng);
 	platform_set_drvdata(pdev, NULL);
-- 
1.7.2.5
