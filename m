From: Steve Longerbeam <slongerbeam@gmail.com>
Subject: Re: [PATCH v4 29/36] media: imx: mipi-csi2: enable setting and
 getting of frame rates
Date: Mon, 20 Feb 2017 14:56:15 -0800
Message-ID: <6892fb15-2d18-4898-c328-3acff9d6cc39@gmail.com>
References: <1487211578-11360-1-git-send-email-steve_longerbeam@mentor.com>
 <1487211578-11360-30-git-send-email-steve_longerbeam@mentor.com>
 <20170220220409.GX16975@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20170220220409.GX16975@valkosipuli.retiisi.org.uk>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: mark.rutland@arm.com, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, sakari.ailus@linux.intel.com, nick@shmanahar.org, songjun.wu@microchip.com, hverkuil@xs4all.nl, Steve Longerbeam <steve_longerbeam@mentor.com>, pavel@ucw.cz, robert.jarzmik@free.fr, devel@driverdev.osuosl.org, markus.heiser@darmarIT.de, laurent.pinchart+renesas@ideasonboard.com, shuah@kernel.org, linux@armlinux.org.uk, geert@linux-m68k.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, arnd@arndb.de, mchehab@kernel.org, bparrot@ti.com, Russell King <rmk+kernel@armlinux.org.uk>, robh+dt@kernel.org, horms+renesas@verge.net.au, tiffany.lin@mediatek.com, linux-arm-kernel@lists.infradead.org, niklas.soderlund+renesas@ragnatech.se, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, jean-christophe.trotin@st.com, p.zabel@pengutronix.de, fabio.estevam@nxp.com
List-Id: devicetree@vger.kernel.org



On 02/20/2017 02:04 PM, Sakari Ailus wrote:
> Hi Steve,
>
> On Wed, Feb 15, 2017 at 06:19:31PM -0800, Steve Longerbeam wrote:
>> From: Russell King <rmk+kernel@armlinux.org.uk>
>>
>> Setting and getting frame rates is part of the negotiation mechanism
>> between subdevs.  The lack of support means that a frame rate at the
>> sensor can't be negotiated through the subdev path.
>
> Just wondering --- what do you need this for?


Hi Sakari,

i.MX does need the ability to negotiate the frame rates in the
pipelines. The CSI has the ability to skip frames at the output,
which is something Philipp added to the CSI subdev. That affects
frame interval at the CSI output.

But as Russell pointed out, the lack of [gs]_frame_interval op
causes media-ctl to fail:

media-ctl -v -d /dev/media1 --set-v4l2 
'"imx6-mipi-csi2":1[fmt:SGBRG8/512x512@1/30]'

Opening media device /dev/media1
Enumerating entities
Found 29 entities
Enumerating pads and links
Setting up format SGBRG8 512x512 on pad imx6-mipi-csi2/1
Format set: SGBRG8 512x512
Setting up frame interval 1/30 on entity imx6-mipi-csi2
Unable to set frame interval: Inappropriate ioctl for device (-25)Unable 
to setup formats: Inappropriate ioctl for device (25)


So i.MX needs to implement this op in every subdev in the
pipeline, otherwise it's not possible to configure the
pipeline with media-ctl.


Steve
