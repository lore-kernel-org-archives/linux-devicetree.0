From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Subject: Re: [PATCH v4 14/36] [media] v4l2-mc: add a function to inherit
 controls from a pipeline
Date: Fri, 10 Mar 2017 12:53:42 -0300
Message-ID: <20170310125342.7f047acf@vento.lan>
References: <1487211578-11360-1-git-send-email-steve_longerbeam@mentor.com>
 <1487211578-11360-15-git-send-email-steve_longerbeam@mentor.com>
 <20170302160257.GK3220@valkosipuli.retiisi.org.uk>
 <20170303230645.GR21222@n2100.armlinux.org.uk>
 <20170304131329.GV3220@valkosipuli.retiisi.org.uk>
 <a7b8e095-a95c-24bd-b1e9-e983f18061c4@xs4all.nl>
 <20170310130733.GU21222@n2100.armlinux.org.uk>
 <c679f755-52a6-3c6f-3d65-277db46676cc@xs4all.nl>
 <20170310140124.GV21222@n2100.armlinux.org.uk>
 <cc8900b0-c091-b14b-96f4-01f8fa72431c@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <cc8900b0-c091-b14b-96f4-01f8fa72431c@xs4all.nl>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: mark.rutland@arm.com, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, sakari.ailus@linux.intel.com, nick@shmanahar.org, songjun.wu@microchip.com, Steve Longerbeam <steve_longerbeam@mentor.com>, pavel@ucw.cz, robert.jarzmik@free.fr, devel@driverdev.osuosl.org, markus.heiser@darmarIT.de, laurent.pinchart+renesas@ideasonboard.com, shuah@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>, geert@linux-m68k.org, Steve Longerbeam <slongerbeam@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, arnd@arndb.de, mchehab@kernel.org, bparrot@ti.com, robh+dt@kernel.org, horms+renesas@verge.net.au, tiffany.lin@mediatek.com, linux-arm-kernel@lists.infradead.org, niklas.soderlund+renesas@ragnatech.se, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>, jean-christophe.trotin@st.com, p.zab
List-Id: devicetree@vger.kernel.org

Em Fri, 10 Mar 2017 15:20:48 +0100
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> 
> > As I've already mentioned, from talking about this with Mauro, it seems
> > Mauro is in agreement with permitting the control inheritence... I wish
> > Mauro would comment for himself, as I can't quote our private discussion
> > on the subject.  
> 
> I can't comment either, not having seen his mail and reasoning.

The rationale is that we should support the simplest use cases first.

In the case of the first MC-based driver (and several subsequent
ones), the simplest use case required MC, as it was meant to suport
a custom-made sophisticated application that required fine control
on each component of the pipeline and to allow their advanced
proprietary AAA userspace-based algorithms to work.

That's not true, for example, for the UVC driver. There, MC
is optional, as it should be.

> > Right now, my view is that v4l2 is currently being screwed up by people
> > with different opinions - there is no unified concensus on how any of
> > this stuff is supposed to work, everyone is pulling in different
> > directions.  That needs solving _really_ quickly, so I suggest that
> > v4l2 people urgently talk to each other and thrash out some of the
> > issues that Steve's patch set has brought up, and settle on a way
> > forward, rather than what is seemingly happening today - which is
> > everyone working in isolation of everyone else with their own bias on
> > how things should be done.  
> 
> The simple fact is that to my knowledge no other MC applications inherit
> controls from subdevs. Suddenly doing something different here seems very
> wrong to me and needs very good reasons.

That's because it was not needed before, as other subdev-based drivers
are meant to be used only on complex scenarios with custom-made apps.

Thanks,
Mauro
