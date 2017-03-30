From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCH v6 00/39] i.MX Media Driver
Date: Thu, 30 Mar 2017 17:27:30 +0100
Message-ID: <20170330162730.GH7909@n2100.armlinux.org.uk>
References: <1490661656-10318-1-git-send-email-steve_longerbeam@mentor.com>
 <20170330110249.GF7909@n2100.armlinux.org.uk>
 <d715bcdf-b2df-8080-6ab4-854aeace31a8@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <d715bcdf-b2df-8080-6ab4-854aeace31a8@gmail.com>
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
Cc: mark.rutland@arm.com, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, nick@shmanahar.org, songjun.wu@microchip.com, hverkuil@xs4all.nl, pavel@ucw.cz, shuah@kernel.org, devel@driverdev.osuosl.org, markus.heiser@darmarIT.de, Steve Longerbeam <steve_longerbeam@mentor.com>, robert.jarzmik@free.fr, geert@linux-m68k.org, p.zabel@pengutronix.de, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, arnd@arndb.de, tiffany.lin@mediatek.com, bparrot@ti.com, robh+dt@kernel.org, horms+renesas@verge.net.au, mchehab@kernel.org, laurent.pinchart+renesas@ideasonboard.com, linux-arm-kernel@lists.infradead.org, niklas.soderlund+renesas@ragnatech.se, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, jean-christophe.trotin@st.com, sakari.ailus@linux.intel.com, fabio.estevam@nxp.com, shawnguo@kernel.org, sudipm.mukherjee@gmail.com
List-Id: devicetree@vger.kernel.org

On Thu, Mar 30, 2017 at 09:12:29AM -0700, Steve Longerbeam wrote:
> 
> 
> On 03/30/2017 04:02 AM, Russell King - ARM Linux wrote:
> >This fails at step 1.  The removal of the frame interval support now
> >means my setup script fails when trying to set the frame interval on
> >the camera:
> >
> >Enumerating pads and links
> >Setting up format SRGGB8_1X8 816x616 on pad imx219 0-0010/0
> >Format set: SRGGB8_1X8 816x616
> >Setting up frame interval 1/25 on pad imx219 0-0010/0
> >Frame interval set: 1/25
> >Setting up format SRGGB8_1X8 816x616 on pad imx6-mipi-csi2/0
> >Format set: SRGGB8_1X8 816x616
> >Setting up frame interval 1/25 on pad imx6-mipi-csi2/0
> >Unable to set frame interval: Inappropriate ioctl for device (-25)Unable to setup formats: Inappropriate ioctl for device (25)
> >
> >This is because media-ctl tries to propagate it from the imx219 source
> >pad to the csi2 sink pad, and the csi2 now fails that ioctl.
> 
> I assume you're using Philipp's frame interval patches to media-ctl.
> Can you make the frame interval propagation optional in those patches?
> I.e. don't error-out with a failure code if the ioctl returns ENOTTY.

Damn, you're right.  There's way too much stuff to try and keep track
of with this stuff.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
