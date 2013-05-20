From: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/1] of/documentation: Update document related to exynos_hdmi
Date: Mon, 20 May 2013 10:21:04 +0530
Message-ID: <1369025464-8810-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
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
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Exynos SoCs use pinctrl to configure GPIOs. Update the document
to reflect this change.

Signed-off-by: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 .../devicetree/bindings/video/exynos_hdmi.txt      |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/video/exynos_hdmi.txt b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
index 589edee..584385a 100644
--- a/Documentation/devicetree/bindings/video/exynos_hdmi.txt
+++ b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
@@ -8,9 +8,7 @@ Required properties:
 - hpd-gpio: following information about the hotplug gpio pin.
 	a) phandle of the gpio controller node.
 	b) pin number within the gpio controller.
-	c) pin function mode.
-	d) optional flags and pull up/down.
-	e) drive strength.
+	c) optional flags and pull up/down.
 
 Example:
 
@@ -18,5 +16,5 @@ Example:
 		compatible = "samsung,exynos5-hdmi";
 		reg = <0x14530000 0x100000>;
 		interrupts = <0 95 0>;
-		hpd-gpio = <&gpx3 7 0xf 1 3>;
+		hpd-gpio = <&gpx3 7 1>;
 	};
-- 
1.7.9.5
