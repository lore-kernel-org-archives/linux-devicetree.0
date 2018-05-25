From: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 03/15] arm: dts: mediatek: Add missing cooling device
 properties for CPUs
Date: Fri, 25 May 2018 16:01:49 +0530
Message-ID: <b687bb6035fbb010383f4511a206abb4006679fa.1527244201.git.viresh.kumar@linaro.org>
References: <cover.1527244200.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <cover.1527244200.git.viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
In-Reply-To: <cover.1527244200.git.viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
References: <cover.1527244200.git.viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vincent Guittot <vincent.guittot-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, chris.redpath-5wv7dgnIgG8@public.gmane.org, ionela.voinescu-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

The cooling device properties, like "#cooling-cells" and
"dynamic-power-coefficient", should either be present for all the CPUs
of a cluster or none. If these are present only for a subset of CPUs of
a cluster then things will start falling apart as soon as the CPUs are
brought online in a different order. For example, this will happen
because the operating system looks for such properties in the CPU node
it is trying to bring up, so that it can register a cooling device.

Add such missing properties.

Signed-off-by: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/mt7623.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/mt7623.dtsi b/arch/arm/boot/dts/mt7623.dtsi
index d1eb123bc73b..1cdc346a05e8 100644
--- a/arch/arm/boot/dts/mt7623.dtsi
+++ b/arch/arm/boot/dts/mt7623.dtsi
@@ -92,6 +92,7 @@
 				 <&apmixedsys CLK_APMIXED_MAINPLL>;
 			clock-names = "cpu", "intermediate";
 			operating-points-v2 = <&cpu_opp_table>;
+			#cooling-cells = <2>;
 			clock-frequency = <1300000000>;
 		};
 
@@ -103,6 +104,7 @@
 				 <&apmixedsys CLK_APMIXED_MAINPLL>;
 			clock-names = "cpu", "intermediate";
 			operating-points-v2 = <&cpu_opp_table>;
+			#cooling-cells = <2>;
 			clock-frequency = <1300000000>;
 		};
 
@@ -114,6 +116,7 @@
 				 <&apmixedsys CLK_APMIXED_MAINPLL>;
 			clock-names = "cpu", "intermediate";
 			operating-points-v2 = <&cpu_opp_table>;
+			#cooling-cells = <2>;
 			clock-frequency = <1300000000>;
 		};
 	};
-- 
2.15.0.194.g9af6a3dea062
