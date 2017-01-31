From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCH v3 17/24] media: imx: Add CSI subdev driver
Date: Tue, 31 Jan 2017 10:30:19 +0000
Message-ID: <20170131103019.GT27312@n2100.armlinux.org.uk>
References: <1483755102-24785-1-git-send-email-steve_longerbeam@mentor.com>
 <1483755102-24785-18-git-send-email-steve_longerbeam@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <1483755102-24785-18-git-send-email-steve_longerbeam@mentor.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Steve Longerbeam <slongerbeam@gmail.com>
Cc: mark.rutland@arm.com, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, nick@shmanahar.org, songjun.wu@microchip.com, hverkuil@xs4all.nl, Steve Longerbeam <steve_longerbeam@mentor.com>, robert.jarzmik@free.fr, devel@driverdev.osuosl.org, markus.heiser@darmarIT.de, laurent.pinchart+renesas@ideasonboard.com, geert@linux-m68k.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, arnd@arndb.de, mchehab@kernel.org, bparrot@ti.com, robh+dt@kernel.org, horms+renesas@verge.net.au, tiffany.lin@mediatek.com, linux-arm-kernel@lists.infradead.org, niklas.soderlund+renesas@ragnatech.se, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, jean-christophe.trotin@st.com, p.zabel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kernel.org, sudipm.mukherjee@gmail.com
List-Id: devicetree@vger.kernel.org

On Fri, Jan 06, 2017 at 06:11:35PM -0800, Steve Longerbeam wrote:
> This is a media entity subdevice for the i.MX Camera
> Serial Interface module.
> 
> Signed-off-by: Steve Longerbeam <steve_longerbeam@mentor.com>
> ---

The lack of s_frame_interval/g_frame_interval in this driver means:

media-ctl -v -d /dev/media1 --set-v4l2 '"imx6-mipi-csi2":1[fmt:SGBRG8/512x512@1/30]'

Opening media device /dev/media1
Enumerating entities
Found 29 entities
Enumerating pads and links
Setting up format SGBRG8 512x512 on pad imx6-mipi-csi2/1
Format set: SGBRG8 512x512
Setting up frame interval 1/30 on entity imx6-mipi-csi2
Unable to set frame interval: Inappropriate ioctl for device (-25)Unable to setup formats: Inappropriate ioctl for device (25)

which causes the setup of the next element in the chain to also fail
(because the above media-ctl command doesn't set the sink on the
ipu1 csi0 mux.)

It seems to me that without the frame interval supported throughout the
chain, there's no way for an application to properly negotiate the
capture parameters via the "try" mechanism, since it has no idea whether
the frame rate it wants is supported throughout the subdev chain.  Eg,
the sensor may be able to do 100fps but there could be something in the
pipeline that restricts it due to bandwidth.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
