From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [RFC] [media] imx: assume MEDIA_ENT_F_ATV_DECODER entities output
 video on pad 1
Date: Wed, 5 Apr 2017 09:55:53 -0400
Message-ID: <CABxcv=kaLgk7BoqPoU=yhzMWsuXmRZQVF6oa2EdandX6UmZ0hw@mail.gmail.com>
References: <1490661656-10318-1-git-send-email-steve_longerbeam@mentor.com>
 <1490661656-10318-20-git-send-email-steve_longerbeam@mentor.com>
 <1490894749.2404.33.camel@pengutronix.de>
 <20170404231053.GE7909@n2100.armlinux.org.uk>
 <19f0ce92-cad6-8950-8018-e3224e2bf266@gmail.com>
 <7235285c-f39a-64bc-195a-11cfde9e67c5@gmail.com>
 <20170405082134.GF7909@n2100.armlinux.org.uk>
 <1491384859.2381.51.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1491384859.2381.51.camel@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, Nick Dyer <nick@shmanahar.org>, songjun.wu@microchip.com, Hans Verkuil <hverkuil@xs4all.nl>, Steve Longerbeam <steve_longerbeam@mentor.com>, Pavel Machek <pavel@ucw.cz>, robert.jarzmik@free.fr, devel@driverdev.osuosl.org, Markus Heiser <markus.heiser@darmarit.de>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, shuah@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Steve Longerbeam <slongerbeam@gmail.com>, Linux Media Mailing List <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Benoit Parrot <bparrot@ti.com>, Rob Herring <robh+dt@kernel.org>, horms+r
List-Id: devicetree@vger.kernel.org

Hello Philipp,

On Wed, Apr 5, 2017 at 5:34 AM, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> On Wed, 2017-04-05 at 09:21 +0100, Russell King - ARM Linux wrote:

[snip]

> I think the output part is accurate, as the audio pad is an artifact of
> an unrelated change. I'm not so sure about the VBI pad, but I think that
> shouldn't exist either. The input pad, on the other hand, not having any
> of graph representation in the device tree seems a bit strange. There

Agreed, there should be a OF graph representation (and also a MC
representation) of the input PADs.

The tvp5150 driver currently has hardcoded as input TVP5150_COMPOSITE1
(AIP1B), so it won't work for a board that has the composite connector
wired to TVP5150_COMPOSITE0 (AIP1A) neither will work for S-Video
(AIP1A + AIP1B).

> was a custom binding for the inputs, that got quickly reverted:
> https://patchwork.kernel.org/patch/8395521/
>

Yes, that was my first attempt to have input connector support for
tvp5150. The patches were merged without a detailed review of the DT
bindings and latter were found to be wrong. Instead of having a driver
specific DT binding, a generic binding that could be used by any
device should be defined.

The latest proposal was [0] but that was also found to be inadequate.
After a lot of discussion on #v4l, the best approach we could come
with was something like like [1]. But I was busy with other stuff and
never found time to do the driver changes.

By the way, only the DT bindings portion from the first approach got
reverted but the patch reverting the driver changes never made to
mainline. Could you please test if [2] doesn't cause any issues to you
so the left over can be finally removed?

> regards
> Philipp
>

[0]: https://lkml.org/lkml/2016/4/12/983
[1]: https://hastebin.com/kadagidino.diff
[2]: https://patchwork.kernel.org/patch/9472623/

Best regards,
Javier
