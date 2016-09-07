From: Stephen Boyd <stephen.boyd@linaro.org>
Subject: [PATCH v4 02/22] of: device: Export of_device_{get_modalias,
 uvent_modalias} to modules
Date: Wed,  7 Sep 2016 14:34:59 -0700
Message-ID: <20160907213519.27340-3-stephen.boyd@linaro.org>
References: <20160907213519.27340-1-stephen.boyd@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160907213519.27340-1-stephen.boyd@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-usb@vger.kernel.org
Cc: Felipe Balbi <balbi@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Neil Armstrong <narmstrong@baylibre.com>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Peter Chen <peter.chen@nxp.com>, Andy Gross <andy.gross@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The ULPI bus can be built as a module, and it will soon be
calling these functions when it supports probing devices from DT.
Export them so they can be used by the ULPI module.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: <devicetree@vger.kernel.org>
Signed-off-by: Stephen Boyd <stephen.boyd@linaro.org>
---
 drivers/of/device.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/of/device.c b/drivers/of/device.c
index 8a22a253a830..6719ab35b62e 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -225,6 +225,7 @@ ssize_t of_device_get_modalias(struct device *dev, char *str, ssize_t len)
 
 	return tsize;
 }
+EXPORT_SYMBOL_GPL(of_device_get_modalias);
 
 int of_device_request_module(struct device *dev)
 {
@@ -290,6 +291,7 @@ void of_device_uevent(struct device *dev, struct kobj_uevent_env *env)
 	}
 	mutex_unlock(&of_mutex);
 }
+EXPORT_SYMBOL_GPL(of_device_uevent_modalias);
 
 int of_device_uevent_modalias(struct device *dev, struct kobj_uevent_env *env)
 {
-- 
2.9.0.rc2.8.ga28705d
