From: Gabriel FERNANDEZ <gabriel.fernandez@st.com>
Subject: [PATCH RESEND 04/12] drivers: clk: st: STiH407: Support for A9 MUX
 Clocks
Date: Wed,  4 Jun 2014 16:31:52 +0200
Message-ID: <1401892320-18211-5-git-send-email-gabriel.fernandez@linaro.org>
References: <1401892320-18211-1-git-send-email-gabriel.fernandez@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1401892320-18211-1-git-send-email-gabriel.fernandez@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: mturquette@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: devicetree@vger.kernel.org, kernel@stlinux.com, linux-doc@vger.kernel.org, Olivier Bideau <olivier.bideau@st.com>, linux-kernel@vger.kernel.org, Gabriel Fernandez <gabriel.fernandez@linaro.org>, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The patch supports the A9-mux clocks used by ClockGenA9

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@linaro.org>
Signed-off-by: Olivier Bideau <olivier.bideau@st.com>
---
 drivers/clk/st/clkgen-mux.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/st/clkgen-mux.c b/drivers/clk/st/clkgen-mux.c
index a329906..9bdedc8 100644
--- a/drivers/clk/st/clkgen-mux.c
+++ b/drivers/clk/st/clkgen-mux.c
@@ -580,6 +580,11 @@ static struct clkgen_mux_data stih416_a9_mux_data = {
 	.shift = 0,
 	.width = 2,
 };
+static struct clkgen_mux_data stih407_a9_mux_data = {
+	.offset = 0x1a4,
+	.shift = 1,
+	.width = 2,
+};
 
 static struct of_device_id mux_of_match[] = {
 	{
@@ -610,6 +615,10 @@ static struct of_device_id mux_of_match[] = {
 		.compatible = "st,stih416-clkgen-a9-mux",
 		.data = &stih416_a9_mux_data,
 	},
+	{
+		.compatible = "st,stih407-clkgen-a9-mux",
+		.data = &stih407_a9_mux_data,
+	},
 	{}
 };
 
-- 
1.9.1
