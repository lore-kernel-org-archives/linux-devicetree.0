From: kbuild test robot <lkp@intel.com>
Subject: [PATCH linux-review] drm: bridge: anx78xx: pxtal_data[] can be static
Date: Sat, 26 Sep 2015 09:35:38 +0800
Message-ID: <20150926013538.GA81225@roam>
References: <201509260912.Q0WHr90i%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <1443209368-7135-4-git-send-email-enric.balletbo@collabora.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Enric Balletbo i Serra <eballetbo@gmail.com>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, djkurtz@chromium.org, drinkcat@chromium.org, laurent.pinchart@ideasonboard.com, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, airlied@linux.ie, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, sjoerd.simons@collabora.co.uk, robh+dt@kernel.org, kbuild-all@01.org, galak@codeaurora.org, nathan.chung@mediatek.com, mark.rutland@arm.com, javier@dowhile0.org, dan.carpenter@oracle.com, span@analogixsemi.com
List-Id: devicetree@vger.kernel.org


Signed-off-by: Fengguang Wu <fengguang.wu@intel.com>
---
 slimport_tx_drv.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/anx78xx/slimport_tx_drv.c b/drivers/gpu/drm/bridge/anx78xx/slimport_tx_drv.c
index 7721326..9afebab 100644
--- a/drivers/gpu/drm/bridge/anx78xx/slimport_tx_drv.c
+++ b/drivers/gpu/drm/bridge/anx78xx/slimport_tx_drv.c
@@ -607,7 +607,7 @@ static void hdmi_rx_initialization(struct anx78xx *anx78xx)
 	hdmi_rx_set_termination(anx78xx, 0);
 }
 
-struct anx78xx_clock_data const pxtal_data[XTAL_CLK_NUM] = {
+static struct anx78xx_clock_data const pxtal_data[XTAL_CLK_NUM] = {
 	{19, 192},
 	{24, 240},
 	{25, 250},
@@ -640,7 +640,7 @@ static void xtal_clk_sel(struct anx78xx *anx78xx)
 			    ((pxtal_data[XTAL_27M].xtal_clk >> 1) - 2) << 3);
 }
 
-void sp_tx_initialization(struct anx78xx *anx78xx)
+static void sp_tx_initialization(struct anx78xx *anx78xx)
 {
 	sp_write_reg(anx78xx, TX_P0, AUX_CTRL2, 0x30);
 	sp_write_reg_or(anx78xx, TX_P0, AUX_CTRL2, 0x08);
@@ -2185,7 +2185,7 @@ static void sp_config_audio_output(struct anx78xx *anx78xx)
 
 /******************End Audio process********************/
 
-void sp_initialization(struct anx78xx *anx78xx)
+static void sp_initialization(struct anx78xx *anx78xx)
 {
 	/* Waitting Hot plug event! */
 	if (!(sp.common_int_status.common_int[3] & PLUG))
