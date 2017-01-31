From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v3 00/24] i.MX Media Driver
Date: Tue, 31 Jan 2017 14:54:14 +0100
Message-ID: <1485870854.2932.63.camel@pengutronix.de>
References: <1483755102-24785-1-git-send-email-steve_longerbeam@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1483755102-24785-1-git-send-email-steve_longerbeam@mentor.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Steve Longerbeam <slongerbeam@gmail.com>
Cc: mark.rutland@arm.com, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, nick@shmanahar.org, songjun.wu@microchip.com, hverkuil@xs4all.nl, Steve Longerbeam <steve_longerbeam@mentor.com>, robert.jarzmik@free.fr, devel@driverdev.osuosl.org, markus.heiser@darmarIT.de, laurent.pinchart+renesas@ideasonboard.com, linux@armlinux.org.uk, geert@linux-m68k.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, arnd@arndb.de, mchehab@kernel.org, bparrot@ti.com, robh+dt@kernel.org, horms+renesas@verge.net.au, tiffany.lin@mediatek.com, linux-arm-kernel@lists.infradead.org, niklas.soderlund+renesas@ragnatech.se, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, jean-christophe.trotin@st.com, kernel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kernel.org, sudipm.mukherjee@gmail.com
List-Id: devicetree@vger.kernel.org

Hi Steve,

I have just tested the imx-media-staging-md-wip branch on a Nitrogen6X
with a tc358743 (BD_HDMI_MIPI HDMI to MIPI CSI-2 receiver board). Some
observations:

# Link pipeline
media-ctl -l "'tc358743 1-000f':0->'imx6-mipi-csi2':0[1]"
media-ctl -l "'imx6-mipi-csi2':1->'ipu1_csi0_mux':0[1]"
media-ctl -l "'ipu1_csi0_mux':2->'ipu1_csi0':0[1]"
media-ctl -l "'ipu1_csi0':2->'ipu1_csi0 capture':0[1]"

# Provide an EDID to the HDMI source
v4l2-ctl -d /dev/v4l-subdev2 --set-edid=file=edid-1080p.hex
# At this point the HDMI source is enabled and sends a 1080p60 signal
# Configure detected DV timings
media-ctl --set-dv "'tc358743 1-000f':0"

# Set pad formats
media-ctl --set-v4l2 "'tc358743 1-000f':0[fmt:UYVY/1920x1080]"
media-ctl --set-v4l2 "'imx6-mipi-csi2':1[fmt:UYVY2X8/1920x1080]"
media-ctl --set-v4l2 "'ipu1_csi0_mux':2[fmt:UYVY2X8/1920x1080]"
media-ctl --set-v4l2 "'ipu1_csi0':2[fmt:AYUV32/1920x1080]"

v4l2-ctl -d /dev/video4 -V
# This still is configured to 640x480, which is inconsistent with
# the 'ipu1_csi0':2 pad format. The pad set_fmt above should
# have set this, too.

v4l2-ctl --list-formats -d /dev/video4
# This lists all the RGB formats, which it shouldn't. There is
# no CSC in this pipeline, so we should be limited to YUV formats
# only.

# Set capture format
v4l2-ctl -d /dev/video4 -v width=1920,height=1080,pixelformat=UYVY

v4l2-ctl -d /dev/video4 -V
# Now the capture format is correctly configured to 1920x1080.

v4l2-ctl -d 4 --list-frameintervals=width=1920,height=1080,pixelformat=UYVY
# This lists nothing. We should at least provide the 'ipu1_csi0':2 pad
# frame interval. In the future this should list fractions achievable
# via frame skipping.

v4l2-compliance -d /dev/video4
# This fails two tests:
# fail: v4l2-test-input-output.cpp(383): std == 0
# fail: v4l2-test-input-output.cpp(449): invalid attributes for input 0
# test VIDIOC_G/S/ENUMINPUT: FAIL
# and
# fail: v4l2-test-controls.cpp(782): subscribe event for control 'User Controls' failed
# test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL

# (Slowly) stream JPEG images to a display host:
gst-launch-1.0 -v v4l2src device=/dev/video4 ! jpegenc ! rtpjpegpay ! udpsink

I've done this a few times, and sometimes I only get a "ipu1_csi0: EOF
timeout" message when starting streaming.

regards
Philipp
