From: Maxime COQUELIN <maxime.coquelin@st.com>
Subject: [PATCH v4 4/6] pinctrl: st: Use ARRAY_SIZE instead of raw value for
 number of delays
Date: Wed, 12 Mar 2014 09:50:08 +0100
Message-ID: <1394614210-15698-5-git-send-email-maxime.coquelin@st.com>
References: <1394614210-15698-1-git-send-email-maxime.coquelin@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1394614210-15698-1-git-send-email-maxime.coquelin@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Landley <rob@landley.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Srinivas Kandagatla <srinivas.kandagatla@st.com>, Stuart Menefy <stuart.menefy@st.com>, Linus Walleij <linus.walleij@linaro.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Maxime Coquelin <maxime.coquelin@st.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@stlinux.com
Cc: lee.jones@linaro.org
List-Id: devicetree@vger.kernel.org

This patch replaces the raw values with ARRAY_SIZE for assigning the
ninput_delays and noutput_delays fields of STiH416's st_pctl_data struct.

CC: Lee Jones <lee.jones@linaro.org>
Acked-by: Giuseppe Cavallaro <peppe.cavallaro@st.com>
Signed-off-by: Maxime Coquelin <maxime.coquelin@st.com>
---
 drivers/pinctrl/pinctrl-st.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
index 39cddaa..e4c4799 100644
--- a/drivers/pinctrl/pinctrl-st.c
+++ b/drivers/pinctrl/pinctrl-st.c
@@ -384,9 +384,9 @@ static unsigned int stih416_delays[] = {0, 300, 500, 750, 1000, 1250, 1500,
 static const struct st_pctl_data  stih416_data = {
 	.rt_style	= st_retime_style_dedicated,
 	.input_delays	= stih416_delays,
-	.ninput_delays	= 14,
+	.ninput_delays	= ARRAY_SIZE(stih416_delays),
 	.output_delays	= stih416_delays,
-	.noutput_delays = 14,
+	.noutput_delays = ARRAY_SIZE(stih416_delays),
 	.alt = 0, .oe = 40, .pu = 50, .od = 60, .rt = 100,
 };
 
-- 
1.9.0
