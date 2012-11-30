From: Marek Belisko <marek.belisko-e6Ot0yJZRx5zTq7rFmK8cA@public.gmane.org>
Subject: [PATCH v4 2/2] Add documentation for tca6507 devicetree bindings.
Date: Fri, 30 Nov 2012 23:00:50 +0100
Message-ID: <1354312850-29264-2-git-send-email-marek.belisko@open-nandra.com>
References: <1354312850-29264-1-git-send-email-marek.belisko@open-nandra.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1354312850-29264-1-git-send-email-marek.belisko-e6Ot0yJZRx5zTq7rFmK8cA@public.gmane.org>
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
To: cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org
Cc: Marek Belisko <marek.belisko-e6Ot0yJZRx5zTq7rFmK8cA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Marek Belisko <marek.belisko-e6Ot0yJZRx5zTq7rFmK8cA@public.gmane.org>
---
 Documentation/devicetree/bindings/leds/tca6507.txt |   33 ++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/tca6507.txt

diff --git a/Documentation/devicetree/bindings/leds/tca6507.txt b/Documentation/devicetree/bindings/leds/tca6507.txt
new file mode 100644
index 0000000..2b6693b
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/tca6507.txt
@@ -0,0 +1,33 @@
+LEDs conected to tca6507
+
+Required properties:
+- compatible : should be : "ti,tca6507".
+
+Each led is represented as a sub-node of the ti,tca6507 device.
+
+LED sub-node properties:
+- label : (optional) see Documentation/devicetree/bindings/leds/common.txt
+- reg : number of LED line (could be from 0 to 6)
+- linux,default-trigger : (optional)
+   see Documentation/devicetree/bindings/leds/common.txt
+
+Examples:
+
+tca6507@45 {
+	compatible = "ti,tca6507";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	reg = <0x45>;
+
+	led0: red-aux@0 {
+		label = "red:aux";
+		reg = <0x0>;
+	};
+
+	led1: green-aux@1 {
+		label = "green:aux";
+		reg = <0x5>;
+		linux,default-trigger = "default-on";
+	};
+};
+
-- 
1.7.10.4
