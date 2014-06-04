From: Gabriel FERNANDEZ <gabriel.fernandez@st.com>
Subject: [PATCH RESEND 07/12] drivers: clk: st: Add quadfs reset handling
Date: Wed,  4 Jun 2014 16:31:55 +0200
Message-ID: <1401892320-18211-8-git-send-email-gabriel.fernandez@linaro.org>
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

This patch adds the support of quadfs reset handling.

Signed-off-by: Olivier Bideau <olivier.bideau@st.com>
---
 drivers/clk/st/clkgen-fsyn.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/st/clkgen-fsyn.c b/drivers/clk/st/clkgen-fsyn.c
index 5aae17c..46b29c4 100644
--- a/drivers/clk/st/clkgen-fsyn.c
+++ b/drivers/clk/st/clkgen-fsyn.c
@@ -70,12 +70,14 @@ struct clkgen_quadfs_data {
 	bool powerup_polarity;
 	bool standby_polarity;
 	bool nsdiv_present;
+	bool nrst_present;
 	struct clkgen_field ndiv;
 	struct clkgen_field ref_bw;
 	struct clkgen_field nreset;
 	struct clkgen_field npda;
 	struct clkgen_field lock_status;
 
+	struct clkgen_field nrst[QUADFS_MAX_CHAN];
 	struct clkgen_field nsb[QUADFS_MAX_CHAN];
 	struct clkgen_field en[QUADFS_MAX_CHAN];
 	struct clkgen_field mdiv[QUADFS_MAX_CHAN];
@@ -615,6 +617,9 @@ static int quadfs_fsynth_enable(struct clk_hw *hw)
 
 	CLKGEN_WRITE(fs, nsb[fs->chan], !fs->data->standby_polarity);
 
+	if (fs->data->nrst_present)
+		CLKGEN_WRITE(fs, nrst[fs->chan], 0);
+
 	if (fs->lock)
 		spin_unlock_irqrestore(fs->lock, flags);
 
-- 
1.9.1
