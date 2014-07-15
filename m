From: Gabriel FERNANDEZ <gabriel.fernandez@st.com>
Subject: [PATCH v3 04/15] drivers: clk: st: Remove uncessary (void *) cast
Date: Tue, 15 Jul 2014 17:20:20 +0200
Message-ID: <1405437631-23623-5-git-send-email-gabriel.fernandez@linaro.org>
References: <1405437631-23623-1-git-send-email-gabriel.fernandez@linaro.org>
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1405437631-23623-1-git-send-email-gabriel.fernandez@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
To: mturquette@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@stlinux.com, Lee Jones <lee.jones@linaro.org>, Gabriel Fernandez <gabriel.fernandez@linaro.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@linaro.org>
---
 drivers/clk/st/clkgen-fsyn.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/st/clkgen-fsyn.c b/drivers/clk/st/clkgen-fsyn.c
index a7e5db4..e8d599d 100644
--- a/drivers/clk/st/clkgen-fsyn.c
+++ b/drivers/clk/st/clkgen-fsyn.c
@@ -917,19 +917,19 @@ static struct clk * __init st_clk_register_quadfs_fsynth(
 static struct of_device_id quadfs_of_match[] = {
 	{
 		.compatible = "st,stih416-quadfs216",
-		.data = (void *)&st_fs216c65_416
+		.data = &st_fs216c65_416
 	},
 	{
 		.compatible = "st,stih416-quadfs432",
-		.data = (void *)&st_fs432c65_416
+		.data = &st_fs432c65_416
 	},
 	{
 		.compatible = "st,stih416-quadfs660-E",
-		.data = (void *)&st_fs660c32_E_416
+		.data = &st_fs660c32_E_416
 	},
 	{
 		.compatible = "st,stih416-quadfs660-F",
-		.data = (void *)&st_fs660c32_F_416
+		.data = &st_fs660c32_F_416
 	},
 	{}
 };
-- 
1.9.1

