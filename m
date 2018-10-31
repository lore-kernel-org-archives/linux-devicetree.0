From: Yuantian Tang <andy.tang@nxp.com>
Subject: [PATCH 2/2 v3] clk: qoriq: add more compatibles strings
Date: Wed, 31 Oct 2018 14:57:36 +0800
Message-ID: <20181031065736.32719-2-andy.tang@nxp.com>
References: <20181031065736.32719-1-andy.tang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181031065736.32719-1-andy.tang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: oss@buserror.net
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Yuantian Tang <andy.tang@nxp.com>
List-Id: devicetree@vger.kernel.org

Add more SoC compatible strings to support more chips.

Signed-off-by: Yuantian Tang <andy.tang@nxp.com>
---
v3:
  - undo deleting old bindings
  - split the dts and driver to different patchset

 .../devicetree/bindings/clock/qoriq-clock.txt      |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qoriq-clock.txt b/Documentation/devicetree/bindings/clock/qoriq-clock.txt
index 97f46ad..c655f28 100644
--- a/Documentation/devicetree/bindings/clock/qoriq-clock.txt
+++ b/Documentation/devicetree/bindings/clock/qoriq-clock.txt
@@ -28,6 +28,12 @@ Required properties:
 	* "fsl,p4080-clockgen"
 	* "fsl,p5020-clockgen"
 	* "fsl,p5040-clockgen"
+	* "fsl,t1023-clockgen"
+	* "fsl,t1024-clockgen"
+	* "fsl,t1040-clockgen"
+	* "fsl,t1042-clockgen"
+	* "fsl,t2080-clockgen"
+	* "fsl,t2081-clockgen"
 	* "fsl,t4240-clockgen"
 	* "fsl,b4420-clockgen"
 	* "fsl,b4860-clockgen"
-- 
1.7.1
