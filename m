From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v4 14/36] [media] v4l2-mc: add a function to inherit
 controls from a pipeline
Date: Fri, 17 Mar 2017 13:55:33 +0200
Message-ID: <44161453-02f9-0019-3868-7501967a6a82@linux.intel.com>
References: <20170310130733.GU21222@n2100.armlinux.org.uk>
 <c679f755-52a6-3c6f-3d65-277db46676cc@xs4all.nl>
 <20170310140124.GV21222@n2100.armlinux.org.uk>
 <cc8900b0-c091-b14b-96f4-01f8fa72431c@xs4all.nl>
 <20170310125342.7f047acf@vento.lan>
 <20170310223714.GI3220@valkosipuli.retiisi.org.uk>
 <20170311082549.576531d0@vento.lan>
 <20170313124621.GA10701@valkosipuli.retiisi.org.uk>
 <20170314004533.3b3cd44b@vento.lan>
 <e0a6c60b-1735-de0b-21f4-d8c3f4b3f10f@xs4all.nl>
 <20170317114203.GZ21222@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20170317114203.GZ21222@n2100.armlinux.org.uk>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Russell King - ARM Linux <linux@armlinux.org.uk>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: mark.rutland@arm.com, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, nick@shmanahar.org, songjun.wu@microchip.com, Steve Longerbeam <steve_longerbeam@mentor.com>, pavel@ucw.cz, robert.jarzmik@free.fr, devel@driverdev.osuosl.org, markus.heiser@darmarIT.de, laurent.pinchart+renesas@ideasonboard.com, shuah@kernel.org, Mauro Carvalho Chehab <mchehab@s-opensource.com>, geert@linux-m68k.org, Steve Longerbeam <slongerbeam@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, arnd@arndb.de, mchehab@kernel.org, bparrot@ti.com, robh+dt@kernel.org, horms+renesas@verge.net.au, tiffany.lin@mediatek.com, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-arm-kernel@lists.infradead.org, niklas.soderlund+renesas@ragnatech.se, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>, jean-christophe.troti
List-Id: devicetree@vger.kernel.org

Hi Russell,

On 03/17/17 13:42, Russell King - ARM Linux wrote:
> On Tue, Mar 14, 2017 at 08:55:36AM +0100, Hans Verkuil wrote:
>> We're all very driver-development-driven, and userspace gets very little
>> attention in general. So before just throwing in the towel we should take
>> a good look at the reasons why there has been little or no development: is
>> it because of fundamental design defects, or because nobody paid attention
>> to it?
>>
>> I strongly suspect it is the latter.
>>
>> In addition, I suspect end-users of these complex devices don't really care
>> about a plugin: they want full control and won't typically use generic
>> applications. If they would need support for that, we'd have seen much more
>> interest. The main reason for having a plugin is to simplify testing and
>> if this is going to be used on cheap hobbyist devkits.
> 
> I think you're looking at it with a programmers hat on, not a users hat.
> 
> Are you really telling me that requiring users to 'su' to root, and then
> use media-ctl to manually configure the capture device is what most
> users "want" ?

It depends on who the user is. I don't think anyone is suggesting a
regular end user is the user of all these APIs: it is either an
application tailored for that given device, a skilled user with his test
scripts or as suggested previously, a libv4l plugin knowing the device
or a generic library geared towards providing best effort service. The
last one of this list does not exist yet and the second last item
requires help.

Typically this class of devices is simply not up to provide the level of
service you're requesting without additional user space control library
which is responsible for automatic white balance, exposure and focus.

Making use of the full potential of the hardware requires using a more
expressive interface. That's what the kernel interface must provide. If
we decide to limit ourselves to a small sub-set of that potential on the
level of the kernel interface, we have made a wrong decision. It's as
simple as that. This is why the functionality (and which requires taking
a lot of policy decisions) belongs to the user space. We cannot have
multiple drivers providing multiple kernel interfaces for the same hardware.

That said, I'm not trying to provide an excuse for not having libraries
available to help the user to configure and control the device more or
less automatically even in terms of best effort. It's something that
does require attention, a lot more of it than it has received in recent
few years.

-- 
Kind regards,

Sakari Ailus
sakari.ailus@linux.intel.com
