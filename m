From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v4 00/36] i.MX Media Driver
Date: Sat, 18 Feb 2017 13:58:28 +0200
Message-ID: <20170218115827.GR16975@valkosipuli.retiisi.org.uk>
References: <1487211578-11360-1-git-send-email-steve_longerbeam@mentor.com>
 <20170216222006.GA21222@n2100.armlinux.org.uk>
 <923326d6-43fe-7328-d959-14fd341e47ae@gmail.com>
 <1487331818.3107.46.camel@pengutronix.de>
 <20170217122213.GQ16975@valkosipuli.retiisi.org.uk>
 <1487343870.3107.95.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <1487343870.3107.95.camel@pengutronix.de>
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
Cc: mark.rutland@arm.com, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, nick@shmanahar.org, songjun.wu@microchip.com, hverkuil@xs4all.nl, Steve Longerbeam <steve_longerbeam@mentor.com>, pavel@ucw.cz, robert.jarzmik@free.fr, devel@driverdev.osuosl.org, markus.heiser@darmarIT.de, laurent.pinchart+renesas@ideasonboard.com, shuah@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>, geert@linux-m68k.org, Steve Longerbeam <slongerbeam@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, sakari.ailus@linux.intel.com, arnd@arndb.de, mchehab@kernel.org, bparrot@ti.com, robh+dt@kernel.org, horms+renesas@verge.net.au, tiffany.lin@mediatek.com, linux-arm-kernel@lists.infradead.org, niklas.soderlund+renesas@ragnatech.se, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, jean-christophe.trotin@st.com, kernel@pengutronix.de, fabio.estevam@nxp.com
List-Id: devicetree@vger.kernel.org

Hi Philipp and Russell,

On Fri, Feb 17, 2017 at 04:04:30PM +0100, Philipp Zabel wrote:
> On Fri, 2017-02-17 at 14:22 +0200, Sakari Ailus wrote:
> > Hi Philipp, Steve and Russell,
> > 
> > On Fri, Feb 17, 2017 at 12:43:38PM +0100, Philipp Zabel wrote:
> > > On Thu, 2017-02-16 at 14:27 -0800, Steve Longerbeam wrote:
> > > > 
> > > > On 02/16/2017 02:20 PM, Russell King - ARM Linux wrote:
> > > > > On Wed, Feb 15, 2017 at 06:19:02PM -0800, Steve Longerbeam wrote:
> > > > >> In version 4:
> > > > >
> > > > > With this version, I get:
> > > > >
> > > > > [28762.892053] imx6-mipi-csi2: LP-11 timeout, phy_state = 0x00000000
> > > > > [28762.899409] ipu1_csi0: pipeline_set_stream failed with -110
> > > > >
> > > > 
> > > > Right, in the imx219, on exit from s_power(), the clock and data lanes
> > > > must be placed in the LP-11 state. This has been done in the ov5640 and
> > > > tc358743 subdevs.
> > > > 
> > > > If we want to bring in the patch that adds a .prepare_stream() op,
> > > > the csi-2 bus would need to be placed in LP-11 in that op instead.
> > > > 
> > > > Philipp, should I go ahead and add your .prepare_stream() patch?
> > > 
> > > I think with Russell's explanation of how the imx219 sensor operates,
> > > we'll have to do something before calling the sensor s_stream, but right
> > > now I'm still unsure what exactly.
> > 
> > Indeed there appears to be no other way to achieve the LP-11 state than
> > going through the streaming state for this particular sensor, apart from
> > starting streaming.
> > 
> > Is there a particular reason why you're waiting for the transmitter to
> > transfer to LP-11 state? That appears to be the last step which is done in
> > the csi2_s_stream() callback.
> > 
> > What the sensor does next is to start streaming, and the first thing it does
> > in that process is to switch to LP-11 state.
> > 
> > Have you tried what happens if you simply drop the LP-11 check? To me that
> > would seem the right thing to do.
> 
> Removing the wait for LP-11 alone might not be an issue in my case, as
> the TC358743 is known to be in stop state all along. So I just have to
> make sure that the time between s_stream(csi2) starting the receiver and
> s_stream(tc358743) causing LP-11 to be changed to the next state is long
> enough for the receiver to detect LP-11 (which I really can't, I just
> have to pray I2C transmissions are slow enough).

Fair enough; it appears that the timing of the bus setup is indeed ill
defined between the transmitter and the receiver. So there can be hardware
specific matters in stream starting that have to be taken into account. :-(

This is quite annoying, as there does not appear to be a good way to tell
the sensor to set the receiver to LP-11 state without going through the
streaming state. If there was, just doing that in s_power(, 1) callback
would be quite practical.

I guess then there's no really a way to avoid having an extra callback that
would explicitly tell the sensor to go to LP-11 state. It should be no issue
if the transmitter is already in that state from power-on, but the new
callback should guarantee that.

Another question is that how far do you need to proceed with streaming in a
case where you want to go to LP-11 through streaming? Is simply starting
streaming and stopping it right after enough? On some devices it might be
but not on others. As the receiver is not started yet, you can't wait for
the first frame to start either. And how long it would take for the first
frame to start is not defined either in general case: or a driver such as
SMIA that's not exactly aware of the underlying hardware but is relying on a
standard device interface and behaviour, such approach could be best effort
only. Of course it's possible to make changes to the driver if you encounter
a combination of a sensor and a receiver that doesn't seem to work, but
still it's hardly an ideal solution.

How about calling the new callback phy_prepare(), for instance? We could
document that it must explicitly set up the transmitter PHY in LP-11 state
for CSI-2. The current documentation states that the device should be
already in LP-11 after power-on but that apparently is not the case in
general.

-- 
Kind regards,

Sakari Ailus
e-mail: sakari.ailus@iki.fi	XMPP: sailus@retiisi.org.uk
