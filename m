From: Steve Longerbeam <slongerbeam@gmail.com>
Subject: Re: [PATCH v3 21/24] media: imx: Add MIPI CSI-2 Receiver subdev driver
Date: Thu, 9 Feb 2017 15:49:49 -0800
Message-ID: <d6dba77e-902c-7a4c-cc70-fe3a5c9649bb@gmail.com>
References: <1483755102-24785-1-git-send-email-steve_longerbeam@mentor.com>
 <1483755102-24785-22-git-send-email-steve_longerbeam@mentor.com>
 <1486036237.2289.37.camel@pengutronix.de>
 <ca0a2eb3-21b6-d312-c8e0-61da48c4c700@gmail.com>
 <20170208234235.GA27312@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20170208234235.GA27312@n2100.armlinux.org.uk>
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
Cc: mark.rutland@arm.com, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, nick@shmanahar.org, songjun.wu@microchip.com, hverkuil@xs4all.nl, Steve Longerbeam <steve_longerbeam@mentor.com>, robert.jarzmik@free.fr, devel@driverdev.osuosl.org, markus.heiser@darmarIT.de, laurent.pinchart+renesas@ideasonboard.com, geert@linux-m68k.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, arnd@arndb.de, mchehab@kernel.org, bparrot@ti.com, robh+dt@kernel.org, horms+renesas@verge.net.au, tiffany.lin@mediatek.com, linux-arm-kernel@lists.infradead.org, niklas.soderlund+renesas@ragnatech.se, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, jean-christophe.trotin@st.com, Philipp Zabel <p.zabel@pengutronix.de>, fabio.estevam@nxp.com, shawnguo@kernel.org, sudipm.mukherjee@gmail.com
List-Id: devicetree@vger.kernel.org



On 02/08/2017 03:42 PM, Russell King - ARM Linux wrote:
> On Wed, Feb 08, 2017 at 03:23:53PM -0800, Steve Longerbeam wrote:
>>> Actually, this exact function already exists as dw_mipi_dsi_phy_write in
>>> drivers/gpu/drm/rockchip/dw-mipi-dsi.c, and it looks like the D-PHY
>>> register 0x44 might contain a field called HSFREQRANGE_SEL.
>> Thanks for pointing out drivers/gpu/drm/rockchip/dw-mipi-dsi.c.
>> It's clear from that driver that there probably needs to be a fuller
>> treatment of the D-PHY programming here, but I don't know where
>> to find the MIPI CSI-2 D-PHY documentation for the i.MX6. The code
>> in imxcsi2_reset() was also pulled from FSL, and that's all I really have
>> to go on for the D-PHY programming. I assume the D-PHY is also a
>> Synopsys core, like the host controller, but the i.MX6 manual doesn't
>> cover it.
> Why exactly?  What problems are you seeing that would necessitate a
> more detailed programming of the D-PHY?  From my testing, I can wind
> a 2-lane MIPI bus on iMX6D from 912Mbps per lane down to (eg) 308Mbps
> per lane with your existing code without any issues.

That's good to hear.

Just from my experience with struggles to get the CSI2 receiver
up and running with an active clock lane, and my suspicions that
some of that could be due to my lack of understanding of the D-PHY
programming.

Steve
