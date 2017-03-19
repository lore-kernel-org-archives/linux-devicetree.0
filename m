From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCH v5 00/39] i.MX Media Driver
Date: Sun, 19 Mar 2017 14:51:33 +0000
Message-ID: <20170319145133.GU21222@n2100.armlinux.org.uk>
References: <1489121599-23206-1-git-send-email-steve_longerbeam@mentor.com>
 <20170318192258.GL21222@n2100.armlinux.org.uk>
 <aef6c412-5464-726b-42f6-a24b7323aa9c@mentor.com>
 <20170318204324.GM21222@n2100.armlinux.org.uk>
 <1489884074.21659.7.camel@ndufresne.ca>
 <20170319005453.GN21222@n2100.armlinux.org.uk>
 <1489934005.3388.1.camel@ndufresne.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <1489934005.3388.1.camel@ndufresne.ca>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: mark.rutland@arm.com, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, nick@shmanahar.org, songjun.wu@microchip.com, hverkuil@xs4all.nl, pavel@ucw.cz, shuah@kernel.org, devel@driverdev.osuosl.org, markus.heiser@darmarIT.de, Steve Longerbeam <steve_longerbeam@mentor.com>, robert.jarzmik@free.fr, geert@linux-m68k.org, Steve Longerbeam <slongerbeam@gmail.com>, p.zabel@pengutronix.de, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, arnd@arndb.de, tiffany.lin@mediatek.com, bparrot@ti.com, robh+dt@kernel.org, horms+renesas@verge.net.au, mchehab@kernel.org, laurent.pinchart+renesas@ideasonboard.com, linux-arm-kernel@lists.infradead.org, niklas.soderlund+renesas@ragnatech.se, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, jean-christophe.trotin@st.com, sakari.ailus@linux.intel.com, fabio.estevam@nxp.com, shawnguo@kernel.org, sud
List-Id: devicetree@vger.kernel.org

On Sun, Mar 19, 2017 at 10:33:25AM -0400, Nicolas Dufresne wrote:
> Le dimanche 19 mars 2017 =E0 00:54 +0000, Russell King - ARM Linux a
> =E9crit=A0:
> > > =

> > > In practice, I have the impression there is a fair reason why
> > > framerate
> > > enumeration isn't implemented (considering there is only 1 valid
> > > rate).
> > =

> > That's actually completely incorrect.
> > =

> > With the capture device interfacing directly with CSI, it's possible
> > _today_ to select:
> > =

> > * the CSI sink pad's resolution
> > * the CSI sink pad's resolution with the width and/or height halved
> > * the CSI sink pad's frame rate
> > * the CSI sink pad's frame rate divided by the frame drop factor
> > =

> > To put it another way, these are possible:
> > =

> > # v4l2-ctl -d /dev/video10 --list-formats-ext
> > ioctl: VIDIOC_ENUM_FMT
> > =A0=A0=A0=A0=A0=A0=A0 Index=A0=A0=A0=A0=A0=A0 : 0
> > =A0=A0=A0=A0=A0=A0=A0 Type=A0=A0=A0=A0=A0=A0=A0 : Video Capture
> > =A0=A0=A0=A0=A0=A0=A0 Pixel Format: 'RGGB'
> > =A0=A0=A0=A0=A0=A0=A0 Name=A0=A0=A0=A0=A0=A0=A0 : 8-bit Bayer RGRG/GBGB
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Size: Discrete 816x616
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 I=
nterval: Discrete 0.040s (25.000 fps)
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 I=
nterval: Discrete 0.048s (20.833 fps)
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 I=
nterval: Discrete 0.050s (20.000 fps)
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 I=
nterval: Discrete 0.053s (18.750 fps)
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 I=
nterval: Discrete 0.060s (16.667 fps)
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 I=
nterval: Discrete 0.067s (15.000 fps)
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 I=
nterval: Discrete 0.080s (12.500 fps)
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 I=
nterval: Discrete 0.100s (10.000 fps)
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 I=
nterval: Discrete 0.120s (8.333 fps)
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 I=
nterval: Discrete 0.160s (6.250 fps)
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 I=
nterval: Discrete 0.200s (5.000 fps)
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 I=
nterval: Discrete 0.240s (4.167 fps)
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Size: Discrete 408x616
> > <same intervals>
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Size: Discrete 816x308
> > <same intervals>
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Size: Discrete 408x308
> > <same intervals>
> > =

> > These don't become possible as a result of implementing the enums,
> > they're all already requestable through /dev/video10.
> =

> Ok that wasn't clear. So basically video9 is a front-end to video10,
> and it does not proxy the enumerations.

No.  We've sent .dot graphs which show the structure of the imx capture
driver.

What we have wrt video nodes is (eg):

sensor --->  csi2 ----> mux ---> csi ----+------> csi capture
subdev      subdev    subdev    subdev   |       /dev/video10
                                         |
                                         +---------\
                                         |          \
                                         +--> vdic ---> ic_prpenc ---> ic_p=
rpenc
                                             subdev     subdev         capt=
ure

... etc ... for full details, see the .dot diagrams that have been
sent (sorry I can't recall where they are in the threads.)

> I understand this is what you
> are now fixing. And this has to be fixed, because I can image cases
> where the front-end could support only a subset of the sub-dev. So
> having userspace enumerate on another device (and having to find this
> device by walking the tree) is unlikely to work in all scenarios.

The capture blocks (imx-media-capture) all talk to their immediate
upstream subdev and configure its source pad according to the formats,
frame size and frame interval requested by the capture application.
The subdev source pad decides whether the request is valid, and allows
it, modifies it or rejects it as appropriate.

Without working enumeration support, there's no way for an application
to find out what possible settings there are, and, as I've already
explained, the CSI subdev is capable itself of two things:

* Scaling down the image by a factor of two independently in the
  horizontal and vertical directions
* Deterministically dropping frames received from its upstream
  element, thereby reducing the frame rate.

> p.s. This is why caps negotiation is annoyingly complex in GStreamer,
> specially that there is no shortcut, you connect pads, and they figure-
> out what format they will use between each other.

Right, so when you specify video/x-raw,...,framerate=3D60/1 it introduces
a new element which has one source and sink pad, which only supports
the specification given.  If the neighbour's pad doesn't support it,
gstreamer fails because the caps negotiation fails.

So, if v4l2src believes (via the tvnorms, because it's lacking any
other information) that the capture device can only do 25fps and
30fps, then trying to set 60fps _even if S_PARM may accept it_ will
cause gstreamer to fail - because v4l2src can only advertise that
it supports a source of 25fps and 30fps.

-- =

RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
