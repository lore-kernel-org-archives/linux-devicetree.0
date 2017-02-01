From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCH v3 21/24] media: imx: Add MIPI CSI-2 Receiver subdev driver
Date: Wed, 1 Feb 2017 01:13:49 +0000
Message-ID: <20170201011349.GJ27312@n2100.armlinux.org.uk>
References: <1483755102-24785-1-git-send-email-steve_longerbeam@mentor.com>
 <1483755102-24785-22-git-send-email-steve_longerbeam@mentor.com>
 <20170131000125.GO27312@n2100.armlinux.org.uk>
 <1485856160.2932.10.camel@pengutronix.de>
 <6e77aefa-4f22-60e9-7cc0-55c3a2de3124@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <6e77aefa-4f22-60e9-7cc0-55c3a2de3124@gmail.com>
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
Cc: mark.rutland@arm.com, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, nick@shmanahar.org, songjun.wu@microchip.com, hverkuil@xs4all.nl, Steve Longerbeam <steve_longerbeam@mentor.com>, robert.jarzmik@free.fr, devel@driverdev.osuosl.org, markus.heiser@darmarIT.de, laurent.pinchart+renesas@ideasonboard.com, geert@linux-m68k.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, arnd@arndb.de, mchehab@kernel.org, bparrot@ti.com, robh+dt@kernel.org, horms+renesas@verge.net.au, tiffany.lin@mediatek.com, linux-arm-kernel@lists.infradead.org, niklas.soderlund+renesas@ragnatech.se, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, jean-christophe.trotin@st.com, Philipp Zabel <p.zabel@pengutronix.de>, fabio.estevam@nxp.com, shawnguo@kernel.org, sudipm.mukherjee@gmail.com
List-Id: devicetree@vger.kernel.org

Hi Steve,

On Tue, Jan 31, 2017 at 05:02:40PM -0800, Steve Longerbeam wrote:
> But this also puts a requirement on MIPI sensors that s_power(ON)
> should only place the D_PHY in LP-11, and _not_ start the clock lane.
> But perhaps that is correct behavior anyway.

If the CSI2 DPHY is held in reset state, it shouldn't matter what the
sensor does.  In the case of IMX219, it needs a full setup of the
device, including enabling it to stream (so it starts the clock lane
etc) in order to get it into LP-11 state.  Merely disabling the XCLR
signal leaves the lanes grounded.

I do seem to remember reading in one of the MIPI specs that this is
rather expected behaviour, though I can't point at a paragraph this
late in the night.

So, the only way to satisfy these requirements is this order:

- assert PHY reset signals (so blocking any activity on the CSI lanes)
- initialise the sensor (including allowing it to start streaming and
  then stopping the stream - at that point, the lanes will be in LP-11.)
- deassert the resets as per the iMX6 documentation and follow the
  remaining procedure.

I'll look at your other points tomorrow.

Thanks.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
