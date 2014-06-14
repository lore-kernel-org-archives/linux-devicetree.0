From: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
Subject: [PATCH] staging: imx-drm: ipu-v3: ipu-common.c: Cleaning up return of
 uninitialized variable
Date: Sun, 15 Jun 2014 01:35:21 +0200
Message-ID: <1402788921-15458-2-git-send-email-rickard_strandqvist@spectrumdigital.se>
References: <1402788921-15458-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1402788921-15458-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: driverdev-devel-bounces@linuxdriverproject.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Grant Likely <grant.likely@linaro.org>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, devel@driverdev.osuosl.org, Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>, Sascha Hauer <s.hauer@pengutronix.de>, Valentina Manea <valentina.manea.m@gmail.com>, linux-kernel@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Russell King <rmk+kernel@arm.linux.org.uk>
List-Id: devicetree@vger.kernel.org

Before when there was an error a uninitialized variable would be returnd.
Now it returns -ENODEV

Signed-off-by: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
---
 drivers/staging/imx-drm/ipu-v3/ipu-common.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/imx-drm/ipu-v3/ipu-common.c b/drivers/staging/imx-drm/ipu-v3/ipu-common.c
index ca85d3d..468e364 100644
--- a/drivers/staging/imx-drm/ipu-v3/ipu-common.c
+++ b/drivers/staging/imx-drm/ipu-v3/ipu-common.c
@@ -1002,7 +1002,7 @@ static int ipu_add_client_devices(struct ipu_soc *ipu)
 {
 	struct device *dev = ipu->dev;
 	unsigned i;
-	int id, ret;
+	int id;
 
 	mutex_lock(&ipu_client_id_mutex);
 	id = ipu_client_id;
@@ -1025,7 +1025,7 @@ static int ipu_add_client_devices(struct ipu_soc *ipu)
 err_register:
 	platform_device_unregister_children(to_platform_device(dev));
 
-	return ret;
+	return -ENODEV;
 }
 
 
-- 
1.7.10.4
