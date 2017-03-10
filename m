From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Subject: Re: [PATCH v4 14/36] [media] v4l2-mc: add a function to inherit
 controls from a pipeline
Date: Fri, 10 Mar 2017 12:26:34 -0300
Message-ID: <20170310122634.0ffda7c6@vento.lan>
References: <1487211578-11360-1-git-send-email-steve_longerbeam@mentor.com>
 <1487211578-11360-15-git-send-email-steve_longerbeam@mentor.com>
 <20170302160257.GK3220@valkosipuli.retiisi.org.uk>
 <20170303230645.GR21222@n2100.armlinux.org.uk>
 <20170304131329.GV3220@valkosipuli.retiisi.org.uk>
 <a7b8e095-a95c-24bd-b1e9-e983f18061c4@xs4all.nl>
 <20170310130733.GU21222@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20170310130733.GU21222@n2100.armlinux.org.uk>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: mark.rutland@arm.com, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, sakari.ailus@linux.intel.com, nick@shmanahar.org, songjun.wu@microchip.com, Hans Verkuil <hverkuil@xs4all.nl>, Steve Longerbeam <steve_longerbeam@mentor.com>, pavel@ucw.cz, robert.jarzmik@free.fr, devel@driverdev.osuosl.org, markus.heiser@darmarIT.de, laurent.pinchart+renesas@ideasonboard.com, shuah@kernel.org, geert@linux-m68k.org, Steve Longerbeam <slongerbeam@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, arnd@arndb.de, mchehab@kernel.org, bparrot@ti.com, robh+dt@kernel.org, horms+renesas@verge.net.au, tiffany.lin@mediatek.com, linux-arm-kernel@lists.infradead.org, niklas.soderlund+renesas@ragnatech.se, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>, jean-christophe.trotin@st.com, p.zabel@pengutronix.
List-Id: devicetree@vger.kernel.org

Hi Russell,

Em Fri, 10 Mar 2017 13:07:33 +0000
Russell King - ARM Linux <linux@armlinux.org.uk> escreveu:

> The idea that the v4l libraries should intercept the format negotiation
> between the application and kernel is a particularly painful one - the
> default gstreamer build detects the v4l libraries, and links against it.
> That much is fine.
> 
> However, the problem comes when you're trying to use bayer formats. The
> v4l libraries "helpfully" (or rather unhelpfully) intercept the format
> negotiation, and decide that they'll invoke v4lconvert to convert the
> bayer to RGB for you, whether you want them to do that or not.
> 
> v4lconvert may not be the most efficient way to convert, or even what
> is desired (eg, you may want to receive the raw bayer image.)  However,
> since the v4l libraries/v4lconvert gives you no option but to have its
> conversion forced into the pipeline, other options (such as using the
> gstreamer neon accelerated de-bayer plugin) isn't an option 

That's not true. There is an special flag, used only by libv4l2
emulated formats, that indicates when a video format is handled
via v4lconvert:

    * - ``V4L2_FMT_FLAG_EMULATED``
      - 0x0002
      - This format is not native to the device but emulated through
	software (usually libv4l2), where possible try to use a native
	format instead for better performance.

Using this flag, if the application supports a video format directly
supported by the hardware, it can use their own video format decoder.
If not, it is still possible to use the V4L2 hardware, by using
v4lconvert.

Unfortunately, very few applications currently check it.

I wrote a patch for zbar (a multi-format barcode reader) in the past,
adding a logic there that gives a high priority to hardware formats,
and a low priority to emulated ones:
	https://lists.fedoraproject.org/pipermail/scm-commits/2010-December/537428.html

> without
> rebuilding gstreamer _without_ linking against the v4l libraries.

I guess it wouldn't be complex to add a logic similar to that at
gstreamer.

AFAIKT, there's another problem that would prevent to make
libv4l the default on gstreamer: right now, libv4l doesn't support
DMABUF. As gstreamer is being used on embedded hardware, I'd say
that DMABUF support should be default there.

Thanks,
Mauro
