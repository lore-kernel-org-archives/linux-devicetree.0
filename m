From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v3 00/24] i.MX Media Driver
Date: Fri, 20 Jan 2017 17:31:51 +0100
Message-ID: <1484929911.2897.70.camel@pengutronix.de>
References: <1483755102-24785-1-git-send-email-steve_longerbeam@mentor.com>
 <c6e98327-7e2c-f34a-2d23-af7b236de441@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <c6e98327-7e2c-f34a-2d23-af7b236de441@xs4all.nl>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: mark.rutland@arm.com, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, nick@shmanahar.org, songjun.wu@microchip.com, Steve Longerbeam <steve_longerbeam@mentor.com>, robert.jarzmik@free.fr, devel@driverdev.osuosl.org, markus.heiser@darmarIT.de, laurent.pinchart+renesas@ideasonboard.com, linux@armlinux.org.uk, geert@linux-m68k.org, Steve Longerbeam <slongerbeam@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, arnd@arndb.de, mchehab@kernel.org, bparrot@ti.com, robh+dt@kernel.org, horms+renesas@verge.net.au, tiffany.lin@mediatek.com, linux-arm-kernel@lists.infradead.org, niklas.soderlund+renesas@ragnatech.se, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, jean-christophe.trotin@st.com, kernel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kernel.org, sudipm.mukherjee@gmail.com
List-Id: devicetree@vger.kernel.org

Hi Hans,

On Fri, 2017-01-20 at 14:52 +0100, Hans Verkuil wrote:
> Hi Steve, Philipp,
> 
> On 01/07/2017 03:11 AM, Steve Longerbeam wrote:
> > In version 3:
> > 
> > Changes suggested by Rob Herring <robh@kernel.org>:
> > 
> >   - prepended FIM node properties with vendor prefix "fsl,".
> > 
> >   - make mipi csi-2 receiver compatible string SoC specific:
> >     "fsl,imx6-mipi-csi2" instead of "fsl,imx-mipi-csi2".
> > 
> >   - redundant "_clk" removed from mipi csi-2 receiver clock-names property.
> > 
> >   - removed board-specific info from the media driver binding doc. These
> >     were all related to sensor bindings, which already are (adv7180)
> >     or will be (ov564x) covered in separate binding docs. All reference
> >     board info not related to DT bindings has been moved to
> >     Documentation/media/v4l-drivers/imx.rst.
> > 
> >   - removed "_mipi" from the OV5640 compatible string.
> > 
> > Changes suggested by Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>:
> > 
> >   Mostly cosmetic/non-functional changes which I won't list here, except
> >   for the following:
> > 
> >   - spin_lock_irqsave() changed to spin_lock() in a couple interrupt handlers.
> > 
> >   - fixed some unnecessary of_node_put()'s in for_each_child_of_node() loops.
> > 
> >   - check/handle return code from required reg property of CSI port nodes.
> > 
> >   - check/handle return code from clk_prepare_enable().
> > 
> > Changes suggested by Fabio Estevam <festevam@gmail.com>:
> > 
> >   - switch to VGEN3 Analog Vdd supply assuming rev. C SabreSD boards.
> > 
> >   - finally got around to passing valid IOMUX pin config values to the
> >     pin groups.
> > 
> > Other changes:
> > 
> >   - removed the FIM properties that overrided the v4l2 FIM control defaults
> >     values. This was left-over from a requirement of a customer and is not
> >     necessary here.
> > 
> >   - The FIM must be explicitly enabled in the fim child node under the CSI
> >     port nodes, using the status property. If not enabled, FIM v4l2 controls
> >     will not appear in the video capture driver.
> > 
> >   - brought in additional media types patch from Philipp Zabel. Use new
> >     MEDIA_ENT_F_VID_IF_BRIDGE in mipi csi-2 receiver subdev.
> > 
> >   - brought in latest platform generic video multiplexer subdevice driver
> >     from Philipp Zabel (squashed with patch that uses new MEDIA_ENT_F_MUX).
> > 
> >   - removed imx-media-of.h, moved those prototypes into imx-media.h.
> 
> Based on the discussion on the mailinglist it seems everyone agrees that this
> is the preferred driver, correct?

No. I have some major reservations against the custom mem2mem framework
embedded in Steve's driver.
I think it is a misuse of the media entity links (which should describe
hardware connections) for something that should be done at the vb2 level
(letting one device's capture EOF interrupt trigger the next device's
m2m device_run without going through userspace).
Steve and I disagree on that point, so we'd appreciate if we could get
some more eyes on the above issue.

regards
Philipp
