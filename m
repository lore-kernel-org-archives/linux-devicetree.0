From: Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 08/20] Documentation: dt: iio: Add binding for LSM303DLH -
 Accel
Date: Mon, 16 Sep 2013 17:02:14 +0100
Message-ID: <1379347346-823-9-git-send-email-lee.jones@linaro.org>
References: <1379347346-823-1-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1379347346-823-1-git-send-email-lee.jones@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, jic23@cam.ac.uk
Cc: devicetree@vger.kernel.org, arnd@arndb.de, linux-iio@vger.kernel.org, linus.walleij@linaro.org, denis.ciocca@st.com, Lee Jones <lee.jones@linaro.org>
List-Id: devicetree@vger.kernel.org

LSM303DLH is a Accelerometer Sensor

Cc: devicetree@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 .../devicetree/bindings/iio/accel/lsm303dlhc.txt    | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/accel/lsm303dlhc.txt

diff --git a/Documentation/devicetree/bindings/iio/accel/lsm303dlhc.txt b/Documentation/devicetree/bindings/iio/accel/lsm303dlhc.txt
new file mode 100644
index 0000000..5a5101a
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/accel/lsm303dlhc.txt
@@ -0,0 +1,21 @@
+* STMicroelectronics Accelerometer Sensor
+
+Required properties:
+  - compatible: Should be "st,lsm303dlhc_accel"
+  - reg: The I2C address of the sensor
+
+Optional properties:
+  - vdd-supply: Phandle to the Vdd supply regulator
+  - vddio-supply: Phandle to the Vdd-IO supply regulator
+
+Example:
+
+i2c@80128000 {
+	lsm303dlhc_accel@19 {
+		compatible = "st,lsm303dlhc_accel";
+		reg = <0x19>;
+
+		vdd-supply = <&ab8500_ldo_aux1_reg>;
+		vddio-supply = <&db8500_vsmps2_reg>;
+	};
+};
-- 
1.8.1.2
