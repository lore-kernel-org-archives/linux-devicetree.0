From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v4 13/36] [media] v4l2: add a frame timeout event
Date: Fri, 3 Mar 2017 13:45:06 +0200
Message-ID: <20170303114506.GM3220@valkosipuli.retiisi.org.uk>
References: <1487211578-11360-1-git-send-email-steve_longerbeam@mentor.com>
 <1487211578-11360-14-git-send-email-steve_longerbeam@mentor.com>
 <20170302155342.GJ3220@valkosipuli.retiisi.org.uk>
 <4b2bcee1-8da0-776e-4455-8d8e7a7abf0a@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <4b2bcee1-8da0-776e-4455-8d8e7a7abf0a@gmail.com>
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
Cc: mark.rutland@arm.com, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, sakari.ailus@linux.intel.com, nick@shmanahar.org, songjun.wu@microchip.com, hverkuil@xs4all.nl, Steve Longerbeam <steve_longerbeam@mentor.com>, pavel@ucw.cz, robert.jarzmik@free.fr, devel@driverdev.osuosl.org, markus.heiser@darmarIT.de, laurent.pinchart+renesas@ideasonboard.com, shuah@kernel.org, linux@armlinux.org.uk, geert@linux-m68k.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, arnd@arndb.de, mchehab@kernel.org, bparrot@ti.com, robh+dt@kernel.org, horms+renesas@verge.net.au, tiffany.lin@mediatek.com, linux-arm-kernel@lists.infradead.org, niklas.soderlund+renesas@ragnatech.se, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, jean-christophe.trotin@st.com, p.zabel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kernel.org, sudipm.mukherjee@gmail
List-Id: devicetree@vger.kernel.org

On Thu, Mar 02, 2017 at 03:07:21PM -0800, Steve Longerbeam wrote:
> 
> 
> On 03/02/2017 07:53 AM, Sakari Ailus wrote:
> >Hi Steve,
> >
> >On Wed, Feb 15, 2017 at 06:19:15PM -0800, Steve Longerbeam wrote:
> >>Add a new FRAME_TIMEOUT event to signal that a video capture or
> >>output device has timed out waiting for reception or transmit
> >>completion of a video frame.
> >>
> >>Signed-off-by: Steve Longerbeam <steve_longerbeam@mentor.com>
> >>---
> >> Documentation/media/uapi/v4l/vidioc-dqevent.rst | 5 +++++
> >> Documentation/media/videodev2.h.rst.exceptions  | 1 +
> >> include/uapi/linux/videodev2.h                  | 1 +
> >> 3 files changed, 7 insertions(+)
> >>
> >>diff --git a/Documentation/media/uapi/v4l/vidioc-dqevent.rst b/Documentation/media/uapi/v4l/vidioc-dqevent.rst
> >>index 8d663a7..dd77d9b 100644
> >>--- a/Documentation/media/uapi/v4l/vidioc-dqevent.rst
> >>+++ b/Documentation/media/uapi/v4l/vidioc-dqevent.rst
> >>@@ -197,6 +197,11 @@ call.
> >> 	the regions changes. This event has a struct
> >> 	:c:type:`v4l2_event_motion_det`
> >> 	associated with it.
> >>+    * - ``V4L2_EVENT_FRAME_TIMEOUT``
> >>+      - 7
> >>+      - This event is triggered when the video capture or output device
> >>+	has timed out waiting for the reception or transmit completion of
> >>+	a frame of video.
> >
> >As you're adding a new interface, I suppose you have an implementation
> >around. How do you determine what that timeout should be?
> 
> The imx-media driver sets the timeout to 1 second, or 30 frame
> periods at 30 fps.

The frame rate is not necessarily constant during streaming. It may well
change as a result of lighting conditions. I wouldn't add an event for this:
this is unreliable and 30 times the frame period is an arbitrary value
anyway. No other drivers do this either.

The user space is generally in control of the frame period (or on some
devices it could be the sensor, too, but *not* the CSI-2 receiver driver),
so detecting the condition of not receiving any frames is more reliably done
in the user space --- if needed.

-- 
Regards,

Sakari Ailus
e-mail: sakari.ailus@iki.fi	XMPP: sailus@retiisi.org.uk
