From: Renato Lui Geh <renatogeh@gmail.com>
Subject: [PATCH v2 2/2] MAINTAINERS: add entry for ad7780 adc driver
Date: Fri, 24 May 2019 22:26:55 -0300
Message-ID: <7ccb64ba4da8f24981009187e975d71372d62fbf.1558746978.git.renatogeh@gmail.com>
References: <cover.1558746978.git.renatogeh@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <cover.1558746978.git.renatogeh@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org, knaack.h@gmx.de, pmeerw@pmeerw.net, gregkh@linuxfoundation.org, stefan.popa@analog.com, alexandru.Ardelean@analog.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-iio@vger.kernel.org, devel@driverdev.osuosl.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-usp@googlegroups.com
List-Id: devicetree@vger.kernel.org

This patch adds a MAINTAINERS entry for the AD7780 ADC driver.

Signed-off-by: Renato Lui Geh <renatogeh@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 54c8e14fae98..d12685c5b09a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -880,6 +880,15 @@ S:	Supported
 F:	drivers/iio/adc/ad7768-1.c
 F:	Documentation/devicetree/bindings/iio/adc/adi,ad7768-1.txt
 
+ANALOG DEVICES INC AD7780 DRIVER
+M:	Michael Hennerich <Michael.Hennerich@analog.com>
+M:	Renato Lui Geh <renatogeh@gmail.com>
+L:	linux-iio@vger.kernel.org
+W:	http://ez.analog.com/community/linux-device-drivers
+S:	Supported
+F:	drivers/iio/adc/ad7780.c
+F:	Documentation/devicetree/bindings/iio/adc/adi,ad7780.yaml
+
 ANALOG DEVICES INC AD9389B DRIVER
 M:	Hans Verkuil <hans.verkuil@cisco.com>
 L:	linux-media@vger.kernel.org
-- 
2.21.0
