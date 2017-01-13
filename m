From: Steve Longerbeam <slongerbeam@gmail.com>
Subject: Re: [PATCH v3 02/24] ARM: dts: imx6qdl: Add compatible, clocks, irqs
 to MIPI CSI-2 node
Date: Fri, 13 Jan 2017 14:40:48 -0800
Message-ID: <45d7d776-6c1d-47aa-a640-e16b549c75d2@gmail.com>
References: <1483755102-24785-1-git-send-email-steve_longerbeam@mentor.com>
 <1483755102-24785-3-git-send-email-steve_longerbeam@mentor.com>
 <1484308678.31475.24.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1484308678.31475.24.camel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, kernel@pengutronix.de, fabio.estevam@nxp.com, linux@armlinux.org.uk, mchehab@kernel.org, hverkuil@xs4all.nl, nick@shmanahar.org, markus.heiser@darmarIT.de, laurent.pinchart+renesas@ideasonboard.com, bparrot@ti.com, geert@linux-m68k.org, arnd@arndb.de, sudipm.mukherjee@gmail.com, minghsiu.tsai@mediatek.com, tiffany.lin@mediatek.com, jean-christophe.trotin@st.com, horms+renesas@verge.net.au, niklas.soderlund+renesas@ragnatech.se, robert.jarzmik@free.fr, songjun.wu@microchip.com, andrew-ct.chen@mediatek.com, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, devel@driverdev.osuosl.org, Steve Longerbeam <steve_longerbeam@me>
List-Id: devicetree@vger.kernel.org



On 01/13/2017 03:57 AM, Philipp Zabel wrote:
> Am Freitag, den 06.01.2017, 18:11 -0800 schrieb Steve Longerbeam:
>> Add to the MIPI CSI2 receiver node: compatible string, interrupt sources,
>> clocks.
>>
>> Signed-off-by: Steve Longerbeam <steve_longerbeam@mentor.com>
>> ---
>>   arch/arm/boot/dts/imx6qdl.dtsi | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
>> index 53e6e63..42926e9 100644
>> --- a/arch/arm/boot/dts/imx6qdl.dtsi
>> +++ b/arch/arm/boot/dts/imx6qdl.dtsi
>> @@ -1125,7 +1125,14 @@
>>   			};
>>   
>>   			mipi_csi: mipi@021dc000 {
>> +				compatible = "fsl,imx6-mipi-csi2";
>>   				reg = <0x021dc000 0x4000>;
>> +				interrupts = <0 100 0x04>, <0 101 0x04>;
>> +				clocks = <&clks IMX6QDL_CLK_HSI_TX>,
>> +					 <&clks IMX6QDL_CLK_VIDEO_27M>,
>> +					 <&clks IMX6QDL_CLK_EIM_SEL>;
> I think the latter should be EIM_PODF

done.

>
>> +				clock-names = "dphy", "cfg", "pix";
> and I'm not sure dphy is the right name for this one. Is that the pll
> ref input?

I believe this naming came from FSL's mipi csi-2 driver. It is the "hsi_tx"
clock (presumably for the MIPI HSI controller) whose parents are selected
by the CDCDR register as PLL3_120M or PLL2_PFD2. I have no clue whether
this is indeed also used as the clock for the MIPI CSI-2 D-PHY, but 
according
to FSL naming convention it might be.


Steve
