From: Dave Airlie <airlied@gmail.com>
Subject: Re: Best practice device tree design for display subsystems/DRM
Date: Wed, 3 Jul 2013 08:02:05 +1000
Message-ID: <CAPM=9ty8W7wEewLpcKjNV-RXzVnReKVrPu_MGN80=Y-xPr-f+w@mail.gmail.com>
References: <CAMLZHHREVEdRuHaD0imRu4pUv15ZyWYF2J9WCBEw-frxBry-Lw@mail.gmail.com>
	<20130702204255.2044c01b@armhf>
	<20130702191923.GD13924@flint.arm.linux.org.uk>
	<51D330AC.5060903@gmail.com>
	<20130702202548.GE13924@flint.arm.linux.org.uk>
	<20130702215048.GI516@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <20130702215048.GI516@pengutronix.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Jean-Francois Moine <moinejf@free.fr>, Daniel Drake <dsd@laptop.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, dri-devel@lists.freedesktop.org, Russell King <rmk@arm.linux.org.uk>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 3, 2013 at 7:50 AM, Sascha Hauer <s.hauer@pengutronix.de> wrote:
> On Tue, Jul 02, 2013 at 09:25:48PM +0100, Russell King wrote:
>> On Tue, Jul 02, 2013 at 09:57:32PM +0200, Sebastian Hesselbarth wrote:
>> > I am against a super node which contains lcd and dcon/ire nodes. You can
>> > enable those devices on a per board basis. We add them to dove.dtsi but
>> > disable them by default (status = "disabled").
>> >
>> > The DRM driver itself should get a video-card node outside of
>> > soc/internal-regs where you can put e.g. video memory hole (or video
>> > mem size if it will be taken from RAM later)
>> >
>> > About the unusual case, I guess we should try to get both lcd
>> > controllers into one DRM driver. Then support mirror or screen
>> > extension X already provides. For those applications where you want
>> > X on one lcd and some other totally different video stream - wait
>> > for someone to come up with a request or proposal.
>>
>> Well, all I can say then is that the onus is on those who want to treat
>> the components as separate devices to come up with some foolproof way
>> to solve this problem which doesn't involve making assumptions about
>> the way that devices are probed and doesn't end up creating artificial
>> restrictions on how the devices can be used - and doesn't end up burdening
>> the common case with lots of useless complexity that they don't need.
>>
>> It's _that_ case which needs to come up with a proposal about how to
>> handle it because you _can't_ handle it at the moment in any sane
>> manner which meets the criteria I've set out above, and at the moment
>> the best proposal by far to resolve that is the "super node" approach.
>>
>> There is _no_ way in the device model to combine several individual
>> devices together into one logical device safely when the subsystem
>> requires that there be a definite point where everything is known.
>> That applies even more so with -EPROBE_DEFER.  With the presence of
>> such a thing, there is now no logical point where any code can say
>> definitively that the system has technically finished booting and all
>> resources are known.
>>
>> That's the problem - if you don't od the super-node approach, you end
>> up with lots of individual devices which you have to figure out some
>> way of combining, and coping with missing ones which might not be
>> available in the order you want them to be, etc.
>>
>> That's the advantage of the "super node" approach - it's a container
>> to tell you what's required in order to complete the creation of the
>> logical device, and you can parse the sub-nodes to locate the
>> information you need.
>
> I think such an approach would lead to drm drivers which all parse their
> "super nodes" themselves and driver authors would become very creative
> how such a node should look like.
>
> Also this gets messy with i2c devices which are normally registered
> under their i2c bus masters. With the super node approach these would
> have to live under the super node, maybe with a phandle to the i2c bus
> master. This again probably leads to very SoC specific solutions. It
> also doesn't solve the problem that the i2c bus master needs to be
> registered by the time the DRM driver probes.
>
> On i.MX the IPU unit not only handles the display path but also the
> capture path. v4l2 begins to evolve an OF model in which each (sub)device
> has its natural position in the devicetree; the devices are then
> connected with phandles. I'm not sure how good this will work together
> with a super node approach.
>
>>
>> An alternative as I see it is that DRM - and not only DRM but also
>> the DRM API and Xorg - would need to evolve hotplug support for the
>> various parts of the display subsystem.  Do we have enough people
>> with sufficient knowledge and willingness to be able to make all
>> that happen?  I don't think we do, and I don't see that there's any
>> funding out there to make such a project happen, which would make it
>> a volunteer/spare time effort.
>
> +1 for this solution, even if this means more work to get from the
> ground.
>
> Do we really need full hotplug support in the DRM API and Xorg? I mean
> it would really be nice if Xorg detected a newly registered device, but
> as a start it should be sufficient when Xorg detects what's there when
> it starts, no?

Since fbdev and fbcon sit on top of drm to provide the console
currently I'd also expect some fun with them. How do I get a console
if I have no outputs at boot, but I have crtcs? do I just wait around
until an output appears.

There are a number of issues with hotplugging encoders and connectors
at runtime, when really the SoC/board designer knows what it provides
and should be able to tell the driver in some fashion.

The main problems when I played with hot adding eDP on Intel last
time, are we have grouping of crtc/encoder/connectors for multi-seat
future use, these groups need to be updated, and I think the other
issue was updating the possible_crtcs/possible_clones stuff. In theory
sending X a uevent will make it reload the list, and it mostly deals
with device hotplug since 1.14 when I added the USB hotplug support.

I'm not saying this is a bad idea, but really it seems pointless where
the hardware is pretty much hardcoded, that DT can't represent that
and let the driver control the bring up ordering.

Have you also considered how suspend/resume works in such a place,
where every driver is independent? The ChromeOS guys have bitched
before about the exynos driver which is has lots of sub-drivers, how
do you control the s/r ordering in a crazy system like that? I'd
prefer a central driver, otherwise there is too many moving parts.

Dave.
