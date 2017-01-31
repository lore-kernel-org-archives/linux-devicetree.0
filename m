From: Steve Longerbeam <slongerbeam@gmail.com>
Subject: Re: [PATCH v3 21/24] media: imx: Add MIPI CSI-2 Receiver subdev
 driver
Date: Mon, 30 Jan 2017 18:11:40 -0800
Message-ID: <8e5a9936-1713-62ff-ffaa-734bcbc2c507@gmail.com>
References: <1483755102-24785-1-git-send-email-steve_longerbeam@mentor.com>
 <1483755102-24785-22-git-send-email-steve_longerbeam@mentor.com>
 <20170131003129.GP27312@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <20170131003129.GP27312@n2100.armlinux.org.uk>
Sender: linux-media-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, kernel@pengutronix.de, fabio.estevam@nxp.com, mchehab@kernel.org, hverkuil@xs4all.nl, nick@shmanahar.org, markus.heiser@darmarIT.de, p.zabel@pengutronix.de, laurent.pinchart+renesas@ideasonboard.com, bparrot@ti.com, geert@linux-m68k.org, arnd@arndb.de, sudipm.mukherjee@gmail.com, minghsiu.tsai@mediatek.com, tiffany.lin@mediatek.com, jean-christophe.trotin@st.com, horms+renesas@verge.net.au, niklas.soderlund+renesas@ragnatech.se, robert.jarzmik@free.fr, songjun.wu@microchip.com, andrew-ct.chen@mediatek.com, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, devel@driverdev.osuosl.org, Steve Longerbeam <steve_longerbeam@m>
List-Id: devicetree@vger.kernel.org



On 01/30/2017 04:31 PM, Russell King - ARM Linux wrote:
> On Fri, Jan 06, 2017 at 06:11:39PM -0800, Steve Longerbeam wrote:
>> +++ b/drivers/staging/media/imx/imx-mipi-csi2.c
> ...
>> +#define DEVICE_NAME "imx6-mipi-csi2"
> Why is the device/driver named imx6-mipi-csi2, but the module named
> imx-mipi-csi2 - could there be some consistency here please?

right, that was missed after renaming the device node. Fixed.

Steve
