From: Steve Longerbeam <slongerbeam@gmail.com>
Subject: Re: [PATCH v4 07/36] ARM: dts: imx6-sabresd: add OV5642 and OV5640
 camera sensors
Date: Thu, 16 Feb 2017 16:56:56 -0800
Message-ID: <3b28b30f-55ab-aa5d-6042-146fe2c9e18d@gmail.com>
References: <1487211578-11360-1-git-send-email-steve_longerbeam@mentor.com>
 <1487211578-11360-8-git-send-email-steve_longerbeam@mentor.com>
 <CAOMZO5AHJ2jSWvF1iZKhYyDAMmpg99R4-gz4ZyDZAcB4b3d0ag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOMZO5AHJ2jSWvF1iZKhYyDAMmpg99R4-gz4ZyDZAcB4b3d0ag@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, mchehab@kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, nick@shmanahar.org, markus.heiser@darmarit.de, Philipp Zabel <p.zabel@pengutronix.de>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, bparrot@ti.com, Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, minghsiu.tsai@mediatek.com, tiffany.lin@mediatek.com, jean-christophe.trotin@st.com, horms+renesas@verge.net.au, niklas.soderlund+renesas@ragnatech.se, Robert Jarzmik <robert.jarzmik@free.>
List-Id: devicetree@vger.kernel.org



On 02/16/2017 04:51 PM, Fabio Estevam wrote:
> Hi Steve,
>
> On Thu, Feb 16, 2017 at 12:19 AM, Steve Longerbeam
> <slongerbeam@gmail.com> wrote:
>> Enables the OV5642 parallel-bus sensor, and the OV5640 MIPI CSI-2 sensor.
>>
>> The OV5642 connects to the parallel-bus mux input port on ipu1_csi0_mux.
>>
>> The OV5640 connects to the input port on the MIPI CSI-2 receiver on
>> mipi_csi.
>>
>> Until the OV5652 sensor module compatible with the SabreSD becomes
>> available for testing, the ov5642 node is currently disabled.
>
> You missed your Signed-off-by.

Thanks, fixed.

Steve
