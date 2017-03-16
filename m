From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v5 15/39] [media] v4l2: add a frame interval error event
Date: Fri, 17 Mar 2017 00:15:35 +0200
Message-ID: <20170316221535.GI10701@valkosipuli.retiisi.org.uk>
References: <1489121599-23206-1-git-send-email-steve_longerbeam@mentor.com>
 <1489121599-23206-16-git-send-email-steve_longerbeam@mentor.com>
 <5b0a0e76-2524-4140-5ccc-380a8f949cfa@xs4all.nl>
 <ec05e6e0-79f2-2db2-bde9-4aed00d76faa@gmail.com>
 <6b574476-77df-0e25-a4d1-32d4fe0aec12@xs4all.nl>
 <5d5cf4a4-a4d3-586e-cd16-54f543dfcce9@gmail.com>
 <aa6a5a1d-18fd-8bed-a349-2654d2d1abe0@xs4all.nl>
 <20170313104538.GF21222@n2100.armlinux.org.uk>
 <1489508491.28116.8.camel@ndufresne.ca>
 <429b04e6-3922-6568-fc3f-036dc632a55b@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <429b04e6-3922-6568-fc3f-036dc632a55b@gmail.com>
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
Cc: mark.rutland@arm.com, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, sakari.ailus@linux.intel.com, nick@shmanahar.org, songjun.wu@microchip.com, Hans Verkuil <hverkuil@xs4all.nl>, pavel@ucw.cz, robert.jarzmik@free.fr, devel@driverdev.osuosl.org, markus.heiser@darmarIT.de, laurent.pinchart+renesas@ideasonboard.com, shuah@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>, Nicolas Dufresne <nicolas@ndufresne.ca>, geert@linux-m68k.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, arnd@arndb.de, mchehab@kernel.org, bparrot@ti.com, robh+dt@kernel.org, horms+renesas@verge.net.au, tiffany.lin@mediatek.com, linux-arm-kernel@lists.infradead.org, niklas.soderlund+renesas@ragnatech.se, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, jean-christophe.trotin@st.com, p.zabel@pengutronix.de, fabio.estevam@nxp.com, shawnguo
List-Id: devicetree@vger.kernel.org

Hi Steve,

On Tue, Mar 14, 2017 at 09:43:09AM -0700, Steve Longerbeam wrote:
> =

> =

> On 03/14/2017 09:21 AM, Nicolas Dufresne wrote:
> >Le lundi 13 mars 2017 =E0 10:45 +0000, Russell King - ARM Linux a =E9cri=
t :
> >>On Mon, Mar 13, 2017 at 11:02:34AM +0100, Hans Verkuil wrote:
> >>>On 03/11/2017 07:14 PM, Steve Longerbeam wrote:
> >>>>The event must be user visible, otherwise the user has no indication
> >>>>the error, and can't correct it by stream restart.
> >>>In that case the driver can detect this and call vb2_queue_error. It's
> >>>what it is there for.
> >>>
> >>>The event doesn't help you since only this driver has this issue. So n=
obody
> >>>will watch this event, unless it is sw specifically written for this S=
oC.
> >>>
> >>>Much better to call vb2_queue_error to signal a fatal error (which this
> >>>apparently is) since there are more drivers that do this, and vivid su=
pports
> >>>triggering this condition as well.
> >>So today, I can fiddle around with the IMX219 registers to help gain
> >>an understanding of how this sensor works.  Several of the registers
> >>(such as the PLL setup [*]) require me to disable streaming on the
> >>sensor while changing them.
> >>
> >>This is something I've done many times while testing various ideas,
> >>and is my primary way of figuring out and testing such things.
> >>
> >>Whenever I resume streaming (provided I've let the sensor stop
> >>streaming at a frame boundary) it resumes as if nothing happened.  If I
> >>stop the sensor mid-frame, then I get the rolling issue that Steve
> >>reports, but once the top of the frame becomes aligned with the top of
> >>the capture, everything then becomes stable again as if nothing happene=
d.
> >>
> >>The side effect of what you're proposing is that when I disable streami=
ng
> >>at the sensor by poking at its registers, rather than the capture just
> >>stopping, an error is going to be delivered to gstreamer, and gstreamer
> >>is going to exit, taking the entire capture process down.
> >Indeed, there is no recovery attempt in GStreamer code, and it's hard
> >for an higher level programs to handle this. Nothing prevents from
> >adding something of course, but the errors are really un-specific, so
> >it would be something pretty blind. For what it has been tested, this
> >case was never met, usually the error is triggered by a USB camera
> >being un-plugged, a driver failure or even a firmware crash. Most of
> >the time, this is not recoverable.
> >
> >My main concern here based on what I'm reading, is that this driver is
> >not even able to notice immediately that a produced frame was corrupted
> >(because it's out of sync). From usability perspective, this is really
> >bad.
> =

> First, this is an isolated problem, specific to bt.656 and it only
> occurs when disrupting the analog video source signal in some
> way (by unplugging the RCA cable from the ADV718x connector
> for example).
> =

> Second, there is no DMA status support in i.MX6 to catch these
> shifted bt.656 codes, and the ADV718x does not provide any
> status indicators of this event either. So monitoring frame intervals
> is the only solution available, until FSL/NXP issues a new silicon rev.
> =

> =

> >  Can't the driver derive a clock from some irq and calculate for
> >each frame if the timing was correct ?
> =

> That's what is being done, essentially.
> =

> >  And if not mark the buffer with
> >V4L2_BUF_FLAG_ERROR ?
> =

> I prefer to keep the private event, V4L2_BUF_FLAG_ERROR is too
> unspecific.

Is the reason you prefer an event that you have multiple drivers involved,
or that the error flag is, well, only telling there was an error with a
particular frame?

Returning -EIO (by calling vb2_queue_error()) would be a better choice as it
is documented behaviour.

-- =

Regard,s

Sakari Ailus
e-mail: sakari.ailus@iki.fi	XMPP: sailus@retiisi.org.uk
