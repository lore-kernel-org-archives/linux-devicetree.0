From: =?ISO-8859-1?Q?St=E9phane_Marchesin?= <stephane.marchesin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Best practice device tree design for display subsystems/DRM
Date: Tue, 2 Jul 2013 18:46:26 -0700
Message-ID: <CACP_E++-L_Ntv=ZpkrSjB4y4GRc=WNDdXLeQAxb5NWniD3Frfg@mail.gmail.com>
References: <CAMLZHHREVEdRuHaD0imRu4pUv15ZyWYF2J9WCBEw-frxBry-Lw@mail.gmail.com>
 <20130702204255.2044c01b@armhf>
 <20130702191923.GD13924@flint.arm.linux.org.uk>
 <51D330AC.5060903@gmail.com> <20130702202548.GE13924@flint.arm.linux.org.uk>
 <20130702215048.GI516@pengutronix.de>
 <CAPM=9ty8W7wEewLpcKjNV-RXzVnReKVrPu_MGN80=Y-xPr-f+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAPM=9ty8W7wEewLpcKjNV-RXzVnReKVrPu_MGN80=Y-xPr-f+w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, Daniel Drake <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Russell King <rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 2, 2013 at 3:02 PM, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Wed, Jul 3, 2013 at 7:50 AM, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wro=
te:
>> On Tue, Jul 02, 2013 at 09:25:48PM +0100, Russell King wrote:
>>> On Tue, Jul 02, 2013 at 09:57:32PM +0200, Sebastian Hesselbarth wrote:
>>> > I am against a super node which contains lcd and dcon/ire nodes. You =
can
>>> > enable those devices on a per board basis. We add them to dove.dtsi b=
ut
>>> > disable them by default (status =3D "disabled").
>>> >
>>> > The DRM driver itself should get a video-card node outside of
>>> > soc/internal-regs where you can put e.g. video memory hole (or video
>>> > mem size if it will be taken from RAM later)
>>> >
>>> > About the unusual case, I guess we should try to get both lcd
>>> > controllers into one DRM driver. Then support mirror or screen
>>> > extension X already provides. For those applications where you want
>>> > X on one lcd and some other totally different video stream - wait
>>> > for someone to come up with a request or proposal.
>>>
>>> Well, all I can say then is that the onus is on those who want to treat
>>> the components as separate devices to come up with some foolproof way
>>> to solve this problem which doesn't involve making assumptions about
>>> the way that devices are probed and doesn't end up creating artificial
>>> restrictions on how the devices can be used - and doesn't end up burden=
ing
>>> the common case with lots of useless complexity that they don't need.
>>>
>>> It's _that_ case which needs to come up with a proposal about how to
>>> handle it because you _can't_ handle it at the moment in any sane
>>> manner which meets the criteria I've set out above, and at the moment
>>> the best proposal by far to resolve that is the "super node" approach.
>>>
>>> There is _no_ way in the device model to combine several individual
>>> devices together into one logical device safely when the subsystem
>>> requires that there be a definite point where everything is known.
>>> That applies even more so with -EPROBE_DEFER.  With the presence of
>>> such a thing, there is now no logical point where any code can say
>>> definitively that the system has technically finished booting and all
>>> resources are known.
>>>
>>> That's the problem - if you don't od the super-node approach, you end
>>> up with lots of individual devices which you have to figure out some
>>> way of combining, and coping with missing ones which might not be
>>> available in the order you want them to be, etc.
>>>
>>> That's the advantage of the "super node" approach - it's a container
>>> to tell you what's required in order to complete the creation of the
>>> logical device, and you can parse the sub-nodes to locate the
>>> information you need.
>>
>> I think such an approach would lead to drm drivers which all parse their
>> "super nodes" themselves and driver authors would become very creative
>> how such a node should look like.
>>
>> Also this gets messy with i2c devices which are normally registered
>> under their i2c bus masters. With the super node approach these would
>> have to live under the super node, maybe with a phandle to the i2c bus
>> master. This again probably leads to very SoC specific solutions. It
>> also doesn't solve the problem that the i2c bus master needs to be
>> registered by the time the DRM driver probes.
>>
>> On i.MX the IPU unit not only handles the display path but also the
>> capture path. v4l2 begins to evolve an OF model in which each (sub)device
>> has its natural position in the devicetree; the devices are then
>> connected with phandles. I'm not sure how good this will work together
>> with a super node approach.
>>
>>>
>>> An alternative as I see it is that DRM - and not only DRM but also
>>> the DRM API and Xorg - would need to evolve hotplug support for the
>>> various parts of the display subsystem.  Do we have enough people
>>> with sufficient knowledge and willingness to be able to make all
>>> that happen?  I don't think we do, and I don't see that there's any
>>> funding out there to make such a project happen, which would make it
>>> a volunteer/spare time effort.
>>
>> +1 for this solution, even if this means more work to get from the
>> ground.
>>
>> Do we really need full hotplug support in the DRM API and Xorg? I mean
>> it would really be nice if Xorg detected a newly registered device, but
>> as a start it should be sufficient when Xorg detects what's there when
>> it starts, no?
>
> Since fbdev and fbcon sit on top of drm to provide the console
> currently I'd also expect some fun with them. How do I get a console
> if I have no outputs at boot, but I have crtcs? do I just wait around
> until an output appears.
>
> There are a number of issues with hotplugging encoders and connectors
> at runtime, when really the SoC/board designer knows what it provides
> and should be able to tell the driver in some fashion.
>
> The main problems when I played with hot adding eDP on Intel last
> time, are we have grouping of crtc/encoder/connectors for multi-seat
> future use, these groups need to be updated, and I think the other
> issue was updating the possible_crtcs/possible_clones stuff. In theory
> sending X a uevent will make it reload the list, and it mostly deals
> with device hotplug since 1.14 when I added the USB hotplug support.
>
> I'm not saying this is a bad idea, but really it seems pointless where
> the hardware is pretty much hardcoded, that DT can't represent that
> and let the driver control the bring up ordering.
>
> Have you also considered how suspend/resume works in such a place,
> where every driver is independent? The ChromeOS guys have bitched
> before about the exynos driver which is has lots of sub-drivers, how
> do you control the s/r ordering in a crazy system like that? I'd
> prefer a central driver, otherwise there is too many moving parts.

In my experience with exynos, having separate drivers creates a lot of
pain at the interfaces and transitions:

- on boot you need to make sure that those multiple drivers initialize
in the right order. If one comes up too late, the next one doesn't get
the EDID through some passthrough or loses a hotplug interrupt.

- on dpms or on modeset, the order in which things change is also
important. For example if you have a DisplayPort bridge you sometimes
need to train the link with a signal from the previous component, if
the signal isn't there yet training fails.

- on suspend/resume, turning things on/off in the right order is also
important. Again that can bite you when one component implicitly
relies on the next guy in the chain to hold its signal or its clock
until it's off. As you add/remove drivers in other places, the driver
suspend/resume queues will order operations differently and will
expose or hide race conditions. The bug reports look like "Graphics
crashes when I enable the wifi". Another example is that the screen
was showing noise for a second when resuming; this happens because the
bridge is up first and doesn't have data to show. Or you turn on the
first chip, but it needs a passthrough for the HPD line from the next
guy which isn't up yet. So you decide that actually nothing is plugged
in and you give up.

- the pm_runtime stuff is entangled with the code. grep tells me there
are 67 lines containing "pm_runtime" in exynos drm. A lot of it is
non-obvious.

- each driver needs to be self-standing and needs to keep some of its
own state. Things like "am I suspended or not" don't need to be
re-implemented in each driver. However if you can suspend/resume in
arbitrary order and want to synchronize with your buddies, then you
need to know your state. exynos drivers do their own state tracking
(grep -- "->suspended")

So overall, yes you can make it "work" with multiple small,
independent drivers where each driver has its own device tree node.
However you will need global variables to synchronize these drivers.
You will need cross-driver function calls (exynos_drm_device_register)
to make it work. You will need to add loops to wait for the previous
component to successfully initialize (or shutdown), and only then kick
DisplayPort link training (or turn the transmitter off). That makes
the code convoluted, and it's really hard to make it work well and to
maintain it. In my opinion this is much more work to debug this than
to just order things right from the start. It also doesn't scale as
you add more drivers.

So we went in the super-node direction. What we do in Chrome OS (and
we're still working on this; we still have separate DT nodes which we
plan to merge which is the last step) is look at the device tree
during DRM initialization to know which chips are present. With that
we know which subdrivers to instantiate into DRM abstractions. We then
use the normal DRM code for everything*. Since most issues I outlined
above revolve around ordering, they disappear once you turn your
separate drivers into proper DRM components. You also don't need
pm_runtime in there at all if you use DRM properly, because instead
suspend/resume will call DRM which will call into the dpms callbacks
as needed. For exynos we could also remove most of the per-driver
state tracking (DRM does it for you) and also remove code used to wrap
a non-DRM driver into a DRM driver (see exynos_drm_hdmi.c for an
example of such a wrapper).

St=E9phane

* For our specific case, we needed an additional abstraction, the
drm_bridge, to handle a chip after the drm_connector (it's not
specific to ARM, other platforms have also needed this in the past,
see for example the drivers in drivers/gpu/drm/i2c/*). We intend to
upstream this bit once we're happy with the interface.
