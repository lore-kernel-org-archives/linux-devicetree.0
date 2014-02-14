From: Marek Belisko <marek@goldelico.com>
Subject: [PATCH 2/2] Documentation: iio: Extend documentation for hmc5843
 bindings.
Date: Fri, 14 Feb 2014 15:25:29 +0100
Message-ID: <1392387929-31491-2-git-send-email-marek@goldelico.com>
References: <1392387929-31491-1-git-send-email-marek@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1392387929-31491-1-git-send-email-marek@goldelico.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: driverdev-devel-bounces@linuxdriverproject.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net, jic23@kernel.org
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-iio@vger.kernel.org, hns@goldelico.com, linux-kernel@vger.kernel.org, pmeerw@pmeerw.net, Marek Belisko <marek@goldelico.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Marek Belisko <marek@goldelico.com>
---
 Documentation/devicetree/bindings/iio/magnetometer/hmc5843.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/magnetometer/hmc5843.txt b/Documentation/devicetree/bindings/iio/magnetometer/hmc5843.txt
index 90d5f34..b8cbdd5 100644
--- a/Documentation/devicetree/bindings/iio/magnetometer/hmc5843.txt
+++ b/Documentation/devicetree/bindings/iio/magnetometer/hmc5843.txt
@@ -3,6 +3,9 @@
 Required properties:
 
   - compatible : should be "honeywell,hmc5843"
+  Other models which are supported with driver are:
+	"honeywell,hmc5883"
+	"honeywell,hmc5883l"
   - reg : the I2C address of the magnetometer - typically 0x1e
 
 Optional properties:
-- 
1.8.3.2
