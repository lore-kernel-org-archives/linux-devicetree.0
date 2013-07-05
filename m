From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Best practice device tree design for display subsystems/DRM
Date: Fri, 05 Jul 2013 11:34:28 +0200
Message-ID: <51D69324.90301@gmail.com>
References: <CAMLZHHREVEdRuHaD0imRu4pUv15ZyWYF2J9WCBEw-frxBry-Lw@mail.gmail.com>
 <20130702204255.2044c01b@armhf>
 <20130702191923.GD13924@flint.arm.linux.org.uk> <51D330AC.5060903@gmail.com>
 <CAMLZHHTbkfxmzrSrAU586Ywxptk=4Njzb0_puWxhfBcmBB0BWQ@mail.gmail.com>
 <51D348F5.2080205@gmail.com>
 <00ae01ce77cb$524d57f0$f6e807d0$%dae@samsung.com>
 <20130703090242.GM516@pengutronix.de>
 <CACxGe6uRJ9B9qnPT_KLNphg-n2WeA9UFO-rvCdKJHijGqJ8SOg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CACxGe6uRJ9B9qnPT_KLNphg-n2WeA9UFO-rvCdKJHijGqJ8SOg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, Daniel Drake <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Russell King <rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 07/05/13 10:43, Grant Likely wrote:
> On Wed, Jul 3, 2013 at 10:02 AM, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
>> On Wed, Jul 03, 2013 at 05:57:18PM +0900, Inki Dae wrote:
>>>> video {
>>>>      /* Single video card w/ multiple lcd controllers */
>>>>      card0 {
>>>>              compatible = "marvell,armada-510-display";
>>>>              reg = <0 0x3f000000 0x1000000>; /* video-mem hole */
>>>>              /* later: linux,video-memory-size = <0x1000000>; */
>>>>              marvell,video-devices = <&lcd0 &lcd1 &dcon>;
>>>>      };
>>>>
>>>>      /* OR: Multiple video card w/ single lcd controllers */
>>>>      card0 {
>>>>              compatible = "marvell,armada-510-display";
>>>>              ...
>>>>              marvell,video-devices = <&lcd0>;
>>>>      };
>>>>
>>>>      card1 {
>>>>              compatible = "marvell,armada-510-display";
>>>>              ...
>>>>              marvell,video-devices = <&lcd1>;
>>>>      };
>>>> };
>>>
>>> Sorry but I'd like to say that this cannot be used commonly. Shouldn't you
>>> really consider Linux framebuffer or other subsystems? The above dtsi file
>>> is specific to DRM subsystem. And I think the dtsi file has no any
>>> dependency on certain subsystem so board dtsi file should be considered for
>>> all device drivers based on other subsystems: i.e., Linux framebuffer, DRM,
>>> and so no. So I *strongly* object to it. All we have to do is to keep the
>>> dtsi file as is, and to find other better way that can be used commonly in
>>> DRM.
>>
>> +1 for not encoding the projected usecase of the graphics subsystem into
>> the devicetree. Whether the two LCD controllers shall be used together
>> or separately should not affect the devicetree. devicetree is about
>> hardware description, not configuration.
>
> It is however relevant to encode information about how devices are
> related to each other. That could be an orthogonal binding though to
> describe how displays are oriented relative to each other.

Grant,

from what I can see from either super-node approach or v4l2 links with
respect to what we discuss about Marvell SoCs, both are more or less
equivalent.

The only issue left for how to describe that in DT in a sane way is:

Are we using a super-node or node properties for the virtual graphics
card to tell if there is one card with two lcd-controllers (lcd0/lcd1
above) or two cards with one lcd-controller.

You see the super-node solution above, but even with orthogonal
properties we can achieve the same. If we hook up the DRM (or fbdev or
whatever) driver to the lcd-controller nodes, we will have two driver
instances trying to register a DRM card.

For the two card scenario, everything is fine. The driver knows about
a possible DCON (output mux/mirror) and looks for a compatible
available node. Both driver instances may need to access DCON registers
but that is a driver issue and not DT related.

For the one card with two lcd-controllers scenario the only difference
between super-node and node-to-node linking alone is that you get two
driver instances in the first place. With a property equivalent to v4l2
"slave-mode" that you put on e.g. lcd1, the driver loaded for lcd1 node
bails out silently. The driver loaded for lcd0 also looks for
lcd-controller nodes with "slave-mode" property and picks up lcd1.

This possibly leads to races, but IMHO as long as the driver looks for
its "slave-mode" property early, everything should be fine.

All other links required, e.g. lcd0 -> hdmi-transmitter, belong to the
respective nodes in both approaches. DCON existence and requirement is
implicitly put in the driver and not required in DT.

Of course, this is independent of how to handle and register sub-drivers
for DRM. But this is subsystem dependent and also not related to DT.

So for the discussion, I can see that there have been some voting for
super-node, some for node-to-node linking. Although I initially proposed
super-nodes, I can also happily live with node-to-node linking alone.

Either someone can give an example where one of the approaches will not
work (i.MX, exynos?), Grant or one of the DRM maintainers has a
preference, or we are stuck at the decision.

Sebastian
