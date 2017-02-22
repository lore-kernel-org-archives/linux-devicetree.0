From: Steve Longerbeam <slongerbeam@gmail.com>
Subject: Re: [PATCH v4 23/36] media: imx: Add MIPI CSI-2 Receiver subdev driver
Date: Wed, 22 Feb 2017 15:38:57 -0800
Message-ID: <4f75e016-839a-3c19-0b28-d229faf25357@gmail.com>
References: <1487211578-11360-1-git-send-email-steve_longerbeam@mentor.com>
 <1487211578-11360-24-git-send-email-steve_longerbeam@mentor.com>
 <1487328479.3107.21.camel@pengutronix.de>
 <20170217110616.GD21222@n2100.armlinux.org.uk>
 <1487331500.3107.43.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1487331500.3107.43.camel@pengutronix.de>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: mark.rutland@arm.com, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, nick@shmanahar.org, songjun.wu@microchip.com, hverkuil@xs4all.nl, Steve Longerbeam <steve_longerbeam@mentor.com>, pavel@ucw.cz, robert.jarzmik@free.fr, devel@driverdev.osuosl.org, markus.heiser@darmarIT.de, laurent.pinchart+renesas@ideasonboard.com, shuah@kernel.org, geert@linux-m68k.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, sakari.ailus@linux.intel.com, arnd@arndb.de, mchehab@kernel.org, bparrot@ti.com, robh+dt@kernel.org, horms+renesas@verge.net.au, tiffany.lin@mediatek.com, linux-arm-kernel@lists.infradead.org, niklas.soderlund+renesas@ragnatech.se, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, jean-christophe.trotin@st.com, kernel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kernel.org, sudipm.mukherjee@gmail.com
List-Id: devicetree@vger.kernel.org



On 02/17/2017 03:38 AM, Philipp Zabel wrote:
> On Fri, 2017-02-17 at 11:06 +0000, Russell King - ARM Linux wrote:
>> On Fri, Feb 17, 2017 at 11:47:59AM +0100, Philipp Zabel wrote:
>>> On Wed, 2017-02-15 at 18:19 -0800, Steve Longerbeam wrote:
>>>> +static void csi2_dphy_init(struct csi2_dev *csi2)
>>>> +{
>>>> +	/*
>>>> +	 * FIXME: 0x14 is derived from a fixed D-PHY reference
>>>> +	 * clock from the HSI_TX PLL, and a fixed target lane max
>>>> +	 * bandwidth of 300 Mbps. This value should be derived
>>>
>>> If the table in https://community.nxp.com/docs/DOC-94312 is correct,
>>> this should be 850 Mbps. Where does this 300 Mbps value come from?
>>
>> I thought you had some code to compute the correct value, although
>> I guess we've lost the ability to know how fast the sensor is going
>> to drive the link.
>
> I had code to calculate the number of needed lanes from the bit rate and
> link frequency. I did not actually change the D-PHY register value.
> And as you pointed out, calculating the number of lanes is not useful
> without input from the sensor driver, as some lane configurations might
> not be supported.
>
>> Note that the IMX219 currently drives the data lanes at 912Mbps almost
>> exclusively, as I've yet to finish working out how to derive the PLL
>> parameters.  (I have something that works, but it currently takes on
>> the order of 100k iterations to derive the parameters.  gcd() doesn't
>> help you in this instance.)
>
> The tc358743 also currently only implements a fixed rate (of 594 Mbps).

I've analyzed the OV5640 video modes, and they generate the following
"sysclk"'s in Mhz:

210
280
420
560
840

But I don't know whether this is equivalent to bit rate. Is it the same
as Mbps-per-lane? If so, this could be indicated to the sink by
implementing V4L2_CID_LINK_FREQ in the ov5640.c sensor driver.

The Mbps-per-lane value would then be link_freq * 2, and then
Mbps-per-lane could be used to lookup the correct "hsfreqsel"
value to program the D-PHY.

I've added this to imx6-mipi-csi2.c. If the source didn't implement
V4L2_CID_LINK_FREQ then it uses a default 849 Mbps-per-lane.


Steve
