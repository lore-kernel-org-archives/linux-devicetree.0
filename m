From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH RFC V2 3/6] firmware: raspberrypi: Register hwmon driver
Date: Tue, 22 May 2018 13:21:49 +0200
Message-ID: <1526988112-4021-4-git-send-email-stefan.wahren@i2se.com>
References: <1526988112-4021-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1526988112-4021-1-git-send-email-stefan.wahren@i2se.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, Eric Anholt <eric@anholt.net>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, linux-doc@vger.kernel.org, Ray Jui <rjui@broadcom.com>, Stefan Wahren <stefan.wahren@i2se.com>, Phil Elwell <phil@raspberrypi.org>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Since the raspberrypi-hwmon driver is tied to the VC4 firmware instead of
particular hardware its registration should be in the firmware driver.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/firmware/raspberrypi.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 6692888f..0602626 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -21,6 +21,8 @@
 #define MBOX_DATA28(msg)		((msg) & ~0xf)
 #define MBOX_CHAN_PROPERTY		8
 
+static struct platform_device *rpi_hwmon;
+
 struct rpi_firmware {
 	struct mbox_client cl;
 	struct mbox_chan *chan; /* The property channel. */
@@ -183,6 +185,20 @@ rpi_firmware_print_firmware_revision(struct rpi_firmware *fw)
 	}
 }
 
+static void
+rpi_register_hwmon_driver(struct device *dev, struct rpi_firmware *fw)
+{
+	u32 packet;
+	int ret = rpi_firmware_property(fw, RPI_FIRMWARE_GET_THROTTLED,
+					&packet, sizeof(packet));
+
+	if (ret)
+		return;
+
+	rpi_hwmon = platform_device_register_data(dev, "raspberrypi-hwmon",
+						  -1, NULL, 0);
+}
+
 static int rpi_firmware_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -209,6 +225,7 @@ static int rpi_firmware_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, fw);
 
 	rpi_firmware_print_firmware_revision(fw);
+	rpi_register_hwmon_driver(dev, fw);
 
 	return 0;
 }
@@ -217,6 +234,8 @@ static int rpi_firmware_remove(struct platform_device *pdev)
 {
 	struct rpi_firmware *fw = platform_get_drvdata(pdev);
 
+	platform_device_unregister(rpi_hwmon);
+	rpi_hwmon = NULL;
 	mbox_free_channel(fw->chan);
 
 	return 0;
-- 
2.7.4
