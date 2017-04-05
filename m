From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [RFC] [media] imx: assume MEDIA_ENT_F_ATV_DECODER entities
 output video on pad 1
Date: Wed, 05 Apr 2017 11:43:47 +0200
Message-ID: <1491385427.2381.58.camel@pengutronix.de>
References: <1490661656-10318-1-git-send-email-steve_longerbeam@mentor.com>
 <1490661656-10318-20-git-send-email-steve_longerbeam@mentor.com>
 <1490894749.2404.33.camel@pengutronix.de>
 <9bfabc5c-d90f-6487-537d-20515ec61f9c@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <9bfabc5c-d90f-6487-537d-20515ec61f9c@gmail.com>
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
Cc: mark.rutland@arm.com, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, nick@shmanahar.org, songjun.wu@microchip.com, hverkuil@xs4all.nl, pavel@ucw.cz, shuah@kernel.org, devel@driverdev.osuosl.org, markus.heiser@darmarIT.de, Steve Longerbeam <steve_longerbeam@mentor.com>, robert.jarzmik@free.fr, linux@armlinux.org.uk, geert@linux-m68k.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, arnd@arndb.de, tiffany.lin@mediatek.com, bparrot@ti.com, robh+dt@kernel.org, horms+renesas@verge.net.au, mchehab@kernel.org, laurent.pinchart+renesas@ideasonboard.com, linux-arm-kernel@lists.infradead.org, niklas.soderlund+renesas@ragnatech.se, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, jean-christophe.trotin@st.com, sakari.ailus@linux.intel.com, fabio.estevam@nxp.com, shawnguo@kernel.org, sudipm.mukherjee@gmail.com
List-Id: devicetree@vger.kernel.org

On Tue, 2017-04-04 at 15:11 -0700, Steve Longerbeam wrote:
> 
> On 03/30/2017 10:25 AM, Philipp Zabel wrote:
> > The TVP5150 DT bindings specify a single output port (port 0) that
> > corresponds to the video output pad (pad 1, DEMOD_PAD_VID_OUT).
> >
> > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > ---
> > I'm trying to get this to work with a TVP5150 analog TV decoder, and the
> > first problem is that this device doesn't have pad 0 as its single
> > output pad. Instead, as a MEDIA_ENT_F_ATV_DECODER entity, it has for
> > pads (input, video out, vbi out, audio out), and video out is pad 1,
> > whereas the device tree only defines a single port (0).
> 
> Shouldn't the DT bindings define ports for these other pads?

In this case, probably yes for the input pad, certainly no for the
VBI/audio pads. See the other mail.

> I haven't seen this documented anywhere, but shouldn't there
> be a 1:1 correspondence between DT ports and media pads?

Not in general. But imagine a dual HDMI->CSI2 converter, for example. We
don't support this yet, but that might reasonably be described in the
device tree as a single device with two output ports. But the internal
representation would be two completely separate v4l2 subdevices.

regards
Philipp
