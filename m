From: Anton Vorontsov <avorontsov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/3] powerpc/83xx/mcu: Add OF match table
Date: Sun, 2 May 2010 21:00:39 +0400
Message-ID: <20100502170039.GA14036@oksana.dev.rtsoft.ru>
References: <20100502165912.GA11300@oksana.dev.rtsoft.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20100502165912.GA11300-wnGakbxT3iijyJ0x5qLZdcN33GVbZNy3@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

of_modalias_node() matches on the first (most specific) entries,
which isn't quite practical but it was discussed that this won't
change.

The bindings specifies verbose information for the devices, but
it doesn't fit in the I2C ID's 20 characters limit. The limit won't
change, and the bindings won't change either as they're correct.

So we have to put an explicit OF matching table for the
MPC8349E-mITX-compatible MCUs.

(Previously this was in the OF exception table, see commit
4c3ed7d61bd474380e0d3e1eb0da164942f7c84e.)

Signed-off-by: Anton Vorontsov <avorontsov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>
---
 arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c b/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
index 59b0ed1..70798ac 100644
--- a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
+++ b/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
@@ -160,10 +160,16 @@ static const struct i2c_device_id mcu_ids[] = {
 };
 MODULE_DEVICE_TABLE(i2c, mcu_ids);
 
+static struct of_device_id mcu_of_match_table[] __devinitdata = {
+	{ .compatible = "fsl,mcu-mpc8349emitx", },
+	{ },
+};
+
 static struct i2c_driver mcu_driver = {
 	.driver = {
 		.name = "mcu-mpc8349emitx",
 		.owner = THIS_MODULE,
+		.of_match_table = mcu_of_match_table,
 	},
 	.probe = mcu_probe,
 	.remove	= __devexit_p(mcu_remove),
-- 
1.7.0.5
