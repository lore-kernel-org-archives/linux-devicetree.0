From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCH v4 29/36] media: imx: mipi-csi2: enable setting and
 getting of frame rates
Date: Sat, 18 Feb 2017 18:08:44 +0000
Message-ID: <20170218180844.GK21222@n2100.armlinux.org.uk>
References: <1487211578-11360-1-git-send-email-steve_longerbeam@mentor.com>
 <1487211578-11360-30-git-send-email-steve_longerbeam@mentor.com>
 <24d42948-a77d-445f-e3e9-ab595b0cfc3e@gmail.com>
 <20170218092335.GI21222@n2100.armlinux.org.uk>
 <e3260548-7fbc-31bc-0b2c-4c11c1e9a7c7@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <e3260548-7fbc-31bc-0b2c-4c11c1e9a7c7@gmail.com>
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
Cc: mark.rutland@arm.com, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, sakari.ailus@linux.intel.com, nick@shmanahar.org, songjun.wu@microchip.com, hverkuil@xs4all.nl, pavel@ucw.cz, robert.jarzmik@free.fr, devel@driverdev.osuosl.org, markus.heiser@darmarIT.de, laurent.pinchart+renesas@ideasonboard.com, shuah@kernel.org, geert@linux-m68k.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, arnd@arndb.de, mchehab@kernel.org, bparrot@ti.com, robh+dt@kernel.org, horms+renesas@verge.net.au, tiffany.lin@mediatek.com, linux-arm-kernel@lists.infradead.org, niklas.soderlund+renesas@ragnatech.se, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, jean-christophe.trotin@st.com, p.zabel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kernel.org, sudipm.mukherjee@gmail.com
List-Id: devicetree@vger.kernel.org

On Sat, Feb 18, 2017 at 09:29:17AM -0800, Steve Longerbeam wrote:
> On 02/18/2017 01:23 AM, Russell King - ARM Linux wrote:
> >On Fri, Feb 17, 2017 at 05:12:44PM -0800, Steve Longerbeam wrote:
> >>Hi Russell,
> >>
> >>I signed-off on this but after more review I'm not sure this is right.
> >>
> >>The CSI-2 receiver really has no control over frame rate. It's output
> >>frame rate is the same as the rate that is delivered to it.
> >>
> >>So this subdev should either not implement these ops, or it should
> >>refer them to the attached source subdev.
> >
> >Where in the V4L2 documentation does it say that is permissible?
> >
> 
> https://www.linuxtv.org/downloads/v4l-dvb-apis-old/vidioc-subdev-g-frame-interval.html
> 
> "The frame interval only makes sense for sub-devices that can control the
> frame period on their own. This includes, for instance, image sensors and TV
> tuners. Sub-devices that don't support frame intervals must not implement
> these ioctls."

That sounds clear - but the TV tuner example seems odd - the frame rate
is determined at transmission time, not reception time.  Yes, it's
possible to skip frames (which would be scaling) but you can't
_control_ the frame rate per se.

> >If you don't implement these, media-ctl fails to propagate _anything_
> >to the next sink pad if you specify a frame rate, because media-ctl
> >throws an error and exits immediately.
> >
> 
> But I agree with you here. I think our only option is to ignore that
> quoted requirement above and propagate [gs]_frame_interval all the way
> to the CSI (which can control the frame rate via frame skipping).

Sounds like something to tackle the media maintainers over - the
documentation vs media-ctl seem to have different ideas on this
point.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
