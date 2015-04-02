From: Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: [git:media_tree/master] [media] media: ov2640: dt: add the device
	tree binding document
Date: Thu, 02 Apr 2015 23:35:26 +0200
Message-ID: <E1YdmoT-0002KJ-Kj@www.linuxtv.org>
Reply-To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxtv-commits-bounces+gcvl-linuxtv-commits=m.gmane.org-dJidKbW2IEtAfugRpC6u6w@public.gmane.org>
List-Unsubscribe: <http://www.linuxtv.org/cgi-bin/mailman/options/linuxtv-commits>,
	<mailto:linuxtv-commits-request-dJidKbW2IEtAfugRpC6u6w@public.gmane.org?subject=unsubscribe>
List-Post: <mailto:linuxtv-commits-dJidKbW2IEtAfugRpC6u6w@public.gmane.org>
List-Help: <mailto:linuxtv-commits-request-dJidKbW2IEtAfugRpC6u6w@public.gmane.org?subject=help>
List-Subscribe: <http://www.linuxtv.org/cgi-bin/mailman/listinfo/linuxtv-commits>,
	<mailto:linuxtv-commits-request-dJidKbW2IEtAfugRpC6u6w@public.gmane.org?subject=subscribe>
Sender: linuxtv-commits-bounces-dJidKbW2IEtAfugRpC6u6w@public.gmane.org
Errors-To: linuxtv-commits-bounces+gcvl-linuxtv-commits=m.gmane.org-dJidKbW2IEtAfugRpC6u6w@public.gmane.org
To: linuxtv-commits-dJidKbW2IEtAfugRpC6u6w@public.gmane.org
Cc: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is an automatic generated email to let you know that the following patch were queued at the 
http://git.linuxtv.org/cgit.cgi/media_tree.git tree:

Subject: [media] media: ov2640: dt: add the device tree binding document
Author:  Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Date:    Tue Feb 10 06:31:36 2015 -0300

Add the document for ov2640 dt.

Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Acked-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Acked-by: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>

 .../devicetree/bindings/media/i2c/ov2640.txt       |   46 ++++++++++++++++++++
 1 files changed, 46 insertions(+), 0 deletions(-)

---

http://git.linuxtv.org/cgit.cgi/media_tree.git/commit/?id=87838addf6143430061823c334792185b56ede47

diff --git a/Documentation/devicetree/bindings/media/i2c/ov2640.txt b/Documentation/devicetree/bindings/media/i2c/ov2640.txt
new file mode 100644
index 0000000..c429b5b
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ov2640.txt
@@ -0,0 +1,46 @@
+* Omnivision OV2640 CMOS sensor
+
+The Omnivision OV2640 sensor support multiple resolutions output, such as
+CIF, SVGA, UXGA. It also can support YUV422/420, RGB565/555 or raw RGB
+output format.
+
+Required Properties:
+- compatible: should be "ovti,ov2640"
+- clocks: reference to the xvclk input clock.
+- clock-names: should be "xvclk".
+
+Optional Properties:
+- resetb-gpios: reference to the GPIO connected to the resetb pin, if any.
+- pwdn-gpios: reference to the GPIO connected to the pwdn pin, if any.
+
+The device node must contain one 'port' child node for its digital output
+video port, in accordance with the video interface bindings defined in
+Documentation/devicetree/bindings/media/video-interfaces.txt.
+
+Example:
+
+	i2c1: i2c@f0018000 {
+		ov2640: camera@0x30 {
+			compatible = "ovti,ov2640";
+			reg = <0x30>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_pck1 &pinctrl_ov2640_pwdn &pinctrl_ov2640_resetb>;
+
+			resetb-gpios = <&pioE 24 GPIO_ACTIVE_LOW>;
+			pwdn-gpios = <&pioE 29 GPIO_ACTIVE_HIGH>;
+
+			clocks = <&pck1>;
+			clock-names = "xvclk";
+
+			assigned-clocks = <&pck1>;
+			assigned-clock-rates = <25000000>;
+
+			port {
+				ov2640_0: endpoint {
+					remote-endpoint = <&isi_0>;
+					bus-width = <8>;
+				};
+			};
+		};
+	};
