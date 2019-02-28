From: Renato Lui Geh <renatogeh@gmail.com>
Subject: [PATCH v4 4/9] staging:iio:ad7780: add chip ID values and mask
Date: Thu, 28 Feb 2019 11:24:55 -0300
Message-ID: <90c573cd53bb54d49de6ac270bcff66880ccfeb5.1551358569.git.renatogeh@gmail.com>
References: <cover.1551358569.git.renatogeh@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <cover.1551358569.git.renatogeh@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org, knaack.h@gmx.de, pmeerw@pmeerw.net, gregkh@linuxfoundation.org, stefan.popa@analog.com, alexandru.Ardelean@analog.com, giuliano.belinassi@usp.br, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-iio@vger.kernel.org, devel@driverdev.osuosl.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-usp@googlegroups.com
List-Id: devicetree@vger.kernel.org

The ad7780 supports both the ad778x and ad717x families. Each chip has
a corresponding ID. This patch provides a mask for extracting ID values
from the status bits and also macros for the correct values for the
ad7170, ad7171, ad7780 and ad7781.

Signed-off-by: Renato Lui Geh <renatogeh@gmail.com>
---
 drivers/staging/iio/adc/ad7780.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/iio/adc/ad7780.c b/drivers/staging/iio/adc/ad7780.c
index 56c49e28f432..ad7617a3a141 100644
--- a/drivers/staging/iio/adc/ad7780.c
+++ b/drivers/staging/iio/adc/ad7780.c
@@ -26,10 +26,14 @@
 #define AD7780_RDY		BIT(7)
 #define AD7780_FILTER		BIT(6)
 #define AD7780_ERR		BIT(5)
-#define AD7780_ID1		BIT(4)
-#define AD7780_ID0		BIT(3)
 #define AD7780_GAIN		BIT(2)
 
+#define AD7170_ID		0
+#define AD7171_ID		1
+#define AD7780_ID		1
+#define AD7781_ID		0
+
+#define AD7780_ID_MASK		(BIT(3) | BIT(4))
 
 #define AD7780_PATTERN_GOOD	1
 #define AD7780_PATTERN_MASK	GENMASK(1, 0)
-- 
2.21.0
