From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v5 38/39] media: imx: csi: fix crop rectangle reset in
 sink set_fmt
Date: Mon, 20 Mar 2017 15:00:51 +0100
Message-ID: <1490018451.2917.86.camel@pengutronix.de>
References: <1489121599-23206-1-git-send-email-steve_longerbeam@mentor.com>
 <1489121599-23206-39-git-send-email-steve_longerbeam@mentor.com>
 <20170319152233.GW21222@n2100.armlinux.org.uk>
 <327d67d9-68c1-7f74-0c0f-f6aee1c4b546@gmail.com>
 <1490010926.2917.59.camel@pengutronix.de>
 <20170320120855.GH21222@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170320120855.GH21222@n2100.armlinux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: mark.rutland@arm.com, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, nick@shmanahar.org, songjun.wu@microchip.com, hverkuil@xs4all.nl, Steve Longerbeam <steve_longerbeam@mentor.com>, pavel@ucw.cz, robert.jarzmik@free.fr, devel@driverdev.osuosl.org, markus.heiser@darmarIT.de, laurent.pinchart+renesas@ideasonboard.com, shuah@kernel.org, geert@linux-m68k.org, Steve Longerbeam <slongerbeam@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, sakari.ailus@linux.intel.com, arnd@arndb.de, mchehab@kernel.org, bparrot@ti.com, robh+dt@kernel.org, horms+renesas@verge.net.au, tiffany.lin@mediatek.com, linux-arm-kernel@lists.infradead.org, niklas.soderlund+renesas@ragnatech.se, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, jean-christophe.trotin@st.com, kernel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kernel.org, sudipm.mukherjee@gmail.com
List-Id: devicetree@vger.kernel.org

On Mon, 2017-03-20 at 12:08 +0000, Russell King - ARM Linux wrote:
> On Mon, Mar 20, 2017 at 12:55:26PM +0100, Philipp Zabel wrote:
> > The above paragraph suggests we skip any rectangles that are not
> > supported. In our case that would be 3. and 4., since the CSI can't
> > compose into a larger frame. I hadn't realised that the crop selection
> > currently happens on the source pad.
> 
> I'd recommend viewing the documentation in its post-processed version,
> because then you get the examples as pictures, and they say that a
> picture is worth 1000 words.  See
> 
>   https://linuxtv.org/downloads/v4l-dvb-apis/uapi/v4l/dev-subdev.html
> 
> There is almost an exact example of what we're trying to do - it's
> figure 4.6.  Here, we have a sink pad with a cropping rectangle on
> the input, which is then scaled to a composition rectangle (there's
> no bounds rectangle, and it's specified that in such a case the
> top,left of the composition rectangle will always be 0,0 - see quote
> below).
> 
> Where it differs is that the example also supports source cropping
> for two source pads.  We don't support that.
>
> The same document says:
> 
>   Scaling support is optional. When supported by a subdev, the crop
>   rectangle on the subdev's sink pad is scaled to the size configured
>   using the
>   :ref:`VIDIOC_SUBDEV_S_SELECTION <VIDIOC_SUBDEV_G_SELECTION>` IOCTL
>   using ``V4L2_SEL_TGT_COMPOSE`` selection target on the same pad. If the
>   subdev supports scaling but not composing, the top and left values are
>   not used and must always be set to zero.

Right, this sentence does imply that when scaling is supported, there
must be a sink compose rectangle, even when composing is not.

I have previously set up scaling like this:

media-ctl --set-v4l2 "'ipu1_csi0_mux':2[fmt:UYVY2X8/1920x1080@1/60]"
media-ctl --set-v4l2 "'ipu1_csi0':2[fmt:AYUV32/960x540@1/30]"

Does this mean, it should work like this instead?

media-ctl --set-v4l2 "'ipu1_csi0_mux':2[fmt:UYVY2X8/1920x1080@1/60]"
media-ctl --set-v4l2 "'ipu1_csi0':0[fmt:UYVY2X8/1920x1080@1/60,compose:(0,0)/960x540]"
media-ctl --set-v4l2 "'ipu1_csi0':2[fmt:AYUV32/960x540@1/30]"

I suppose setting the source pad format should not be allowed to modify
the sink compose rectangle.

regards
Philipp
