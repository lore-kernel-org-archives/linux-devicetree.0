From: Steve Longerbeam <slongerbeam@gmail.com>
Subject: Re: [PATCH v5 00/39] i.MX Media Driver
Date: Sat, 11 Mar 2017 16:30:53 -0800
Message-ID: <47542ef8-3e91-b4cd-cc65-95000105f172@gmail.com>
References: <1489121599-23206-1-git-send-email-steve_longerbeam@mentor.com>
 <20170310201356.GA21222@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------B0044A2B02560C3AD74EC7A5"
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20170310201356.GA21222@n2100.armlinux.org.uk>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: mark.rutland@arm.com, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, sakari.ailus@linux.intel.com, nick@shmanahar.org, songjun.wu@microchip.com, hverkuil@xs4all.nl, Steve Longerbeam <steve_longerbeam@mentor.com>, pavel@ucw.cz, robert.jarzmik@free.fr, devel@driverdev.osuosl.org, markus.heiser@darmarIT.de, laurent.pinchart+renesas@ideasonboard.com, shuah@kernel.org, geert@linux-m68k.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, arnd@arndb.de, mchehab@kernel.org, bparrot@ti.com, robh+dt@kernel.org, horms+renesas@verge.net.au, tiffany.lin@mediatek.com, linux-arm-kernel@lists.infradead.org, niklas.soderlund+renesas@ragnatech.se, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, jean-christophe.trotin@st.com, p.zabel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kernel.org, sudipm.mukherjee@gmail.com
List-Id: devicetree@vger.kernel.org

This is a multi-part message in MIME format.
--------------B0044A2B02560C3AD74EC7A5
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 03/10/2017 12:13 PM, Russell King - ARM Linux wrote:
> Version 5 gives me no v4l2 controls exposed through the video device
> interface.
>
> Just like with version 4, version 5 is completely useless with IMX219:
>
> imx6-mipi-csi2: LP-11 timeout, phy_state = 0x00000200
> ipu1_csi0: pipeline start failed with -110
> imx6-mipi-csi2: LP-11 timeout, phy_state = 0x00000200
> ipu1_csi0: pipeline start failed with -110
> imx6-mipi-csi2: LP-11 timeout, phy_state = 0x00000200
> ipu1_csi0: pipeline start failed with -110
>

If it's too difficult to get the imx219 csi-2 transmitter into the
LP-11 state on power on, perhaps the csi-2 receiver can be a little
more lenient on the transmitter and make the LP-11 timeout a warning
instead of error-out.

Can you try the attached change on top of the version 5 patchset?

If that doesn't work then you're just going to have to fix the bug
in imx219.

Steve

--------------B0044A2B02560C3AD74EC7A5
Content-Type: text/x-patch;
 name="warn-on-lp-11-timeout.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="warn-on-lp-11-timeout.diff"

diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index d8f931e..720bf4d 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -224,11 +224,8 @@ static int csi2_dphy_wait_stopstate(struct csi2_dev *csi2)
 
 	ret = readl_poll_timeout(csi2->base + CSI2_PHY_STATE, reg,
 				 (reg & mask) == mask, 0, 500000);
-	if (ret) {
-		v4l2_err(&csi2->sd, "LP-11 timeout, phy_state = 0x%08x\n", reg);
-		return ret;
-	}
-
+	if (ret)
+		v4l2_warn(&csi2->sd, "LP-11 timeout, phy_state = 0x%08x\n", reg);
 	return 0;
 }
 

--------------B0044A2B02560C3AD74EC7A5
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devel mailing list
devel@linuxdriverproject.org
http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel

--------------B0044A2B02560C3AD74EC7A5--
