From: Jeremy McNicoll <jmcnicol@redhat.com>
Subject: [RFC V2 PATCH 03/12] msm8994 clocks: fix mapping
Date: Sat,  1 Oct 2016 19:38:30 -0700
Message-ID: <1475375919-618-4-git-send-email-jmcnicol@redhat.com>
References: <1475375919-618-1-git-send-email-jmcnicol@redhat.com>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1475375919-618-1-git-send-email-jmcnicol@redhat.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: robh+dt@kernel.org, andy.gross@linaro.org, sboyd@codeaurora.org, arnd@arndb.de, bjorn.andersson@linaro.org, git@kchr.de
Cc: jeremymc@redhat.com, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The paren_map is used for looking up which value to write into
and the cmd_rcgr is for configuring the parent muxing so a change
 2 to 5 means that the 3rd parent should be mux #5 rather than #2.

Signed-off-by: Jeremy McNicoll <jeremymc@redhat.com>
---
 drivers/clk/qcom/gcc-msm8994.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-msm8994.c b/drivers/clk/qcom/gcc-msm8994.c
index 3897cfd..39b40d4 100644
--- a/drivers/clk/qcom/gcc-msm8994.c
+++ b/drivers/clk/qcom/gcc-msm8994.c
@@ -50,7 +50,7 @@ static const char * const gcc_xo_gpll0[] = {
 static const struct parent_map gcc_xo_gpll0_gpll4_map[] = {
 	{ P_XO, 0 },
 	{ P_GPLL0, 1 },
-	{ P_GPLL4, 2 },
+	{ P_GPLL4, 5 },
 };
 
 static const char * const gcc_xo_gpll0_gpll4[] = {
-- 
2.6.1
