From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCH v3 00/24] i.MX Media Driver
Date: Tue, 31 Jan 2017 00:45:11 +0000
Message-ID: <20170131004510.GQ27312@n2100.armlinux.org.uk>
References: <1483755102-24785-1-git-send-email-steve_longerbeam@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <1483755102-24785-1-git-send-email-steve_longerbeam@mentor.com>
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

On Fri, Jan 06, 2017 at 06:11:18PM -0800, Steve Longerbeam wrote:
> Philipp Zabel (3):
>   ARM: dts: imx6qdl: Add mipi_ipu1/2 multiplexers, mipi_csi, and their
>     connections
>   add mux and video interface bridge entity functions
>   platform: add video-multiplexer subdevice driver
> 
> Steve Longerbeam (21):
>   [media] dt-bindings: Add bindings for i.MX media driver
>   ARM: dts: imx6qdl: Add compatible, clocks, irqs to MIPI CSI-2 node
>   ARM: dts: imx6qdl: add media device
>   ARM: dts: imx6qdl-sabrelite: remove erratum ERR006687 workaround
>   ARM: dts: imx6-sabrelite: add OV5642 and OV5640 camera sensors
>   ARM: dts: imx6-sabresd: add OV5642 and OV5640 camera sensors
>   ARM: dts: imx6-sabreauto: create i2cmux for i2c3
>   ARM: dts: imx6-sabreauto: add reset-gpios property for max7310_b
>   ARM: dts: imx6-sabreauto: add pinctrl for gpt input capture
>   ARM: dts: imx6-sabreauto: add the ADV7180 video decoder
>   UAPI: Add media UAPI Kbuild file
>   media: Add userspace header file for i.MX
>   media: Add i.MX media core driver
>   media: imx: Add CSI subdev driver
>   media: imx: Add SMFC subdev driver
>   media: imx: Add IC subdev drivers
>   media: imx: Add Camera Interface subdev driver
>   media: imx: Add MIPI CSI-2 Receiver subdev driver
>   media: imx: Add MIPI CSI-2 OV5640 sensor subdev driver
>   media: imx: Add Parallel OV5642 sensor subdev driver
>   ARM: imx_v6_v7_defconfig: Enable staging video4linux drivers

Hi,

Trying this driver with an imx219 camera (which works with Philipp's
driver) results in not much happening... no /dev/media* node for it,
no subdevs, no nothing.  No clues as to what's missing either.  Only
messages from imx-media are from registering the various subdevs.

[   37.444877] imx-media: Registered subdev imx6-mipi-csi2
[   37.444973] imx-media: Registered subdev imx219 0-0010
[   38.868740] imx-media: Registered subdev ipu1_ic_prpenc
[   38.869265] imx-media: Registered subdev ipu1_ic_prpvf
[   38.869425] imx-media: Registered subdev ipu1_ic_pp0
[   38.870086] imx-media: Registered subdev ipu1_ic_pp1
[   38.871510] imx-media: Registered subdev ipu2_ic_prpenc
[   38.871743] imx-media: Registered subdev ipu1_smfc0
[   38.873043] imx-media: Registered subdev ipu1_smfc1
[   38.873225] imx-media: Registered subdev ipu2_ic_prpvf
[   38.875027] imx-media: Registered subdev ipu2_smfc0
[   38.875320] imx-media: Registered subdev ipu2_ic_pp0
[   38.877148] imx-media: Registered subdev ipu2_smfc1
[   38.877436] imx-media: Registered subdev ipu2_ic_pp1
[   38.932089] imx-media: Registered subdev camif0
[   38.956538] imx-media: Registered subdev camif1
[   38.959148] imx-media: Registered subdev camif2
[   38.964353] imx-media: Registered subdev camif3
[  206.502077] imx-media: Registered subdev ipu1_csi0
[  206.503304] imx-media: Registered subdev ipu1_csi1
[  206.503814] imx-media: Registered subdev ipu2_csi0
[  206.504281] imx-media: Registered subdev ipu2_csi1

I also get:

[   37.200072] imx6-mipi-csi2: data lanes: 2
[   37.200077] imx6-mipi-csi2: flags: 0x00000200

and from what I can see, all modules from drivers/staging/media/imx/ are
loaded (had to load imx-csi by hand because of the brokenness in the
drivers/gpu/ipu code attaching an device_node pointer after registering
the platform device, which changes what userspace sees in the modalias
file.)

Any clues at what to look at?

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
