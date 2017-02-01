From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCH v3 00/24] i.MX Media Driver
Date: Wed, 1 Feb 2017 10:53:10 +0000
Message-ID: <20170201105310.GN27312@n2100.armlinux.org.uk>
References: <1483755102-24785-1-git-send-email-steve_longerbeam@mentor.com>
 <1485870854.2932.63.camel@pengutronix.de>
 <5586b893-bf5c-6133-0789-ccce60626b86@gmail.com>
 <1485941457.3353.13.camel@pengutronix.de>
 <20170201101111.GL27312@n2100.armlinux.org.uk>
 <1485945751.3353.28.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <1485945751.3353.28.camel@pengutronix.de>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: mark.rutland@arm.com, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, nick@shmanahar.org, songjun.wu@microchip.com, hverkuil@xs4all.nl, robert.jarzmik@free.fr, devel@driverdev.osuosl.org, markus.heiser@darmarIT.de, Steve Longerbeam <steve_longerbeam@mentor.com>, geert@linux-m68k.org, Steve Longerbeam <slongerbeam@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, arnd@arndb.de, mchehab@kernel.org, bparrot@ti.com, robh+dt@kernel.org, horms+renesas@verge.net.au, tiffany.lin@mediatek.com, laurent.pinchart+renesas@ideasonboard.com, linux-arm-kernel@lists.infradead.org, niklas.soderlund+renesas@ragnatech.se, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, jean-christophe.trotin@st.com, kernel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kernel.org, sudipm.mukherjee@gmail.com
List-Id: devicetree@vger.kernel.org

On Wed, Feb 01, 2017 at 11:42:31AM +0100, Philipp Zabel wrote:
> On Wed, 2017-02-01 at 10:11 +0000, Russell King - ARM Linux wrote:
> Right, it's just that in the latest version there is no v4l2_subdev for
> fifos and idmac. There is the capture interface entity that represents
> one of the IDMAC write channels, but that doesn't have a pad and format
> configuration.
> The SMFC entity was removed because the fifo can be considered part of
> the link between CSI and IDMAC. There is no manual configuration
> necessary as the SMFC itself can't do anything to the data that flows
> through it. There is no reason to present it to userspace as a no-op
> entity.
> So in the direct CSI -> SMFC -> IDMAC case, the CSI source pad now is
> the nearest neighbor pad to the IDMAC capture video device.

Ok, that sounds fine then.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
