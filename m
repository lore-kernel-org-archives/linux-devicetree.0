From: Jeremy McNicoll <jmcnicol@redhat.com>
Subject: [RFC V2 PATCH 12/12] arm64: dts: msm8994 default serial config
Date: Sat,  1 Oct 2016 19:38:39 -0700
Message-ID: <1475375919-618-13-git-send-email-jmcnicol@redhat.com>
References: <1475375919-618-1-git-send-email-jmcnicol@redhat.com>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1475375919-618-1-git-send-email-jmcnicol@redhat.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: robh+dt@kernel.org, andy.gross@linaro.org, sboyd@codeaurora.org, arnd@arndb.de, bjorn.andersson@linaro.org, git@kchr.de
Cc: jeremymc@redhat.com, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

As per Documentation/devicetree/bindings/chosen.txt so that we
are not relying on implicit defaults.

Signed-off-by: Jeremy McNicoll <jeremymc@redhat.com>
---
 arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
index a0fb9c3..dc16d88 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
+++ b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
@@ -26,7 +26,7 @@
 	};
 
 	chosen {
-		stdout-path = "serial0";
+		stdout-path = "serial0:115200n8";
 	};
 
 	soc {
-- 
2.6.1
