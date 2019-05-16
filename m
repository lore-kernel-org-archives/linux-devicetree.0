From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
Subject: [PATCH 4/4] iio: auxadc: mediatek: change to subsys_initcall
Date: Thu, 16 May 2019 16:10:47 +0800
Message-ID: <1557994247-16739-5-git-send-email-chun-hung.wu@mediatek.com>
References: <1557994247-16739-1-git-send-email-chun-hung.wu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1557994247-16739-1-git-send-email-chun-hung.wu@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com, linux-iio@vger.kernel.org, Chun-Hung Wu <chun-hung.wu@mediatek.com>, kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, peter.wang@mediatek.com, jg_poxu@mediatek.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

  Move auxadc platform_driver_register() from module_init
to subsys_initcall because auxadc user drivers
are all moudle drivers, need to gurantee
auxadc driver ready before module_init.

Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
---
 drivers/iio/adc/mt6577_auxadc.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/mt6577_auxadc.c b/drivers/iio/adc/mt6577_auxadc.c
index 58d7cb2..cb8e3dd 100644
--- a/drivers/iio/adc/mt6577_auxadc.c
+++ b/drivers/iio/adc/mt6577_auxadc.c
@@ -350,7 +350,19 @@ static int mt6577_auxadc_remove(struct platform_device *pdev)
 	.probe	= mt6577_auxadc_probe,
 	.remove	= mt6577_auxadc_remove,
 };
-module_platform_driver(mt6577_auxadc_driver);
+
+static int __init mt6577_auxadc_init(void)
+{
+	return platform_driver_register(&mt6577_auxadc_driver);
+}
+
+static void __exit mt6577_auxadc_exit(void)
+{
+	platform_driver_unregister(&mt6577_auxadc_driver);
+}
+
+subsys_initcall(mt6577_auxadc_init);
+module_exit(mt6577_auxadc_exit);
 
 MODULE_AUTHOR("Zhiyong Tao <zhiyong.tao@mediatek.com>");
 MODULE_DESCRIPTION("MTK AUXADC Device Driver");
-- 
1.9.1
