From: Inha Song <ideal.song@samsung.com>
Subject: [PATCH 1/2] mfd: arizona: Add support for INn_MODE
 register control
Date: Sat, 09 Aug 2014 17:31:38 +0900
Message-ID: <20140809173138.767b97fd@songinha-Samsung-DeskTop-System>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: broonie@kernel.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, sameo@linux.intel.com, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, patches@opensource.wolfsonmicro.com, linux-kernel@vger.kernel.org, lgirdwood@gmail.com, cw00.choi@samsung.com, robh+dt@kernel.org, galak@codeaurora.org, ckeepax@opensource.wolfsonmicro.com, lee.jones@linaro.org
List-Id: devicetree@vger.kernel.org

Some boards need to set the INn_MODE[1:0] register to change
the input signal patch. This wlf,inmode property is optional.
If present values must be specified by the number of
ARIZONA_MAX_INPUT.

Example:
   - wlf,inmode = <2 0 2 0>;	/* IN1, IN3 use DMIC */

Signed-off-by: Inha Song <ideal.song@samsung.com>
---
 drivers/mfd/arizona-core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mfd/arizona-core.c b/drivers/mfd/arizona-core.c
index 10a0cb9..4b2eb73 100644
--- a/drivers/mfd/arizona-core.c
+++ b/drivers/mfd/arizona-core.c
@@ -560,6 +560,10 @@ static int arizona_of_get_core_pdata(struct arizona *arizona)
 			ret);
 	}
 
+	of_property_read_u32_array(arizona->dev->of_node,
+					 "wlf,inmode",
+					 arizona->pdata.inmode,
+					 ARRAY_SIZE(arizona->pdata.inmode));
 	return 0;
 }
 
-- 
2.0.0.390.gcb682f8
