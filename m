From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Best practice device tree design for display subsystems/DRM
Date: Fri, 05 Jul 2013 13:16:16 +0200
Message-ID: <51D6AB00.4010306@gmail.com>
References: <CAMLZHHREVEdRuHaD0imRu4pUv15ZyWYF2J9WCBEw-frxBry-Lw@mail.gmail.com>
 <20130702204255.2044c01b@armhf>
 <20130702191923.GD13924@flint.arm.linux.org.uk> <51D330AC.5060903@gmail.com>
 <CAMLZHHTbkfxmzrSrAU586Ywxptk=4Njzb0_puWxhfBcmBB0BWQ@mail.gmail.com>
 <51D348F5.2080205@gmail.com>
 <00ae01ce77cb$524d57f0$f6e807d0$%dae@samsung.com>
 <20130703090242.GM516@pengutronix.de>
 <CACxGe6uRJ9B9qnPT_KLNphg-n2WeA9UFO-rvCdKJHijGqJ8SOg@mail.gmail.com>
 <51D69324.90301@gmail.com>
 <CACxGe6v_oQptLZzgsT_nf-K4680mP1f8sHJHN8AekeEy0_T18w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CACxGe6v_oQptLZzgsT_nf-K4680mP1f8sHJHN8AekeEy0_T18w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

On 07/05/13 11:51, Grant Likely wrote:
> On Fri, Jul 5, 2013 at 10:34 AM, Sebastian Hesselbarth
> <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> So for the discussion, I can see that there have been some voting for
>> super-node, some for node-to-node linking. Although I initially proposed
>> super-nodes, I can also happily live with node-to-node linking alone.
>>
>> Either someone can give an example where one of the approaches will not
>> work (i.MX, exynos?), Grant or one of the DRM maintainers has a
>> preference, or we are stuck at the decision.
>
> I tend to prefer a top-level super nodes with phandles to all of the
> components that compose the device when there is no clear one device
> that controls all the others. There is some precedence for that in
> other subsystems (leds, asoc, etc). Sound in particular has a lot of
> different bits and pieces that are interconnected with audio channels,
> gpios, and other things that get quite complicated, so it is
> convenient to have a single node that describes how they all fit
> together *and* allows for a platform to use a completely different
> device driver if required.

Actually, I consider the super-node not as the single point for _all_
components involved but more as the top node that allows you to have
a single starting point from where can explore the links on a
node-to-node basis. This by coincidence perfectly fits what will
be required for a DRM driver to match against.

Sascha Hauer just also replied to a mail earlier mentioning references 
to external i2c encoders put _into_ the phandles of the super-node.
This is not what I consider this super-node for. Maybe the following
drawings also help a little bit.

(X) Hardware layout inside the SoC:
{BUS}<->{RAM}
   |
   +<->{LCD0}-+         +->{LCD0-PINS}
   |          +->{DCON}-+
   +<->{LCD1}-+         +->{LCD1-PINS}

 From a logical point-of-view and just because we have no single
starting point on Marvell SoCs the use cases can be described as
follows. (x) denotes a device tree node, --> a link installed by
some phandle property, [x] device tree nodes not linked but handled
by driver looking it up in DT, ==> first user visible video stream.

(1) single card, single lcd-controller:
[DCON]
(SUPERNODE)--->(LCD0)-->(HDMI)==>

(2) multiple cards, single lcd-controller:
[DCON]
(SUPERNODE0)-->(LCD0)-->(HDMI)==>
(SUPERNODE1)-->(LCD1)==>

(3) single card, multiple lcd-controller:
[DCON]
             +->(LCD0)-->(HDMI)==>
(SUPERNODE)-+
             +->(LCD1)==>

So the super-node is just used as a single starting point for the
node-to-node walk. IMHO this is very compatible with what v4l2 guys
came up with - except that you _can_ install a virtual starting
point where it is missing from a SoC device point-of-view. SoCs with
two unrelated lcd-controllers will pick up the lcd-controller node
for their DRM drivers.

As mentioned before, to achieve the same you can leave the super-node
and use lcd-controller nodes with "slave-mode" type-of property.

Maybe calling it "super-node" after some point of the discussion was
misleading. It is *not* an umbrella node with phandles to every device
involved, but *the* root node for your logical graph/tree/chain of
device nodes required for video.

> node-to-node linking works well if there an absolute 'master' can be
> identified for the virtual device. ie. Ethernet MAC devices use a
> "phy-device" property to link to the phy it requires. In that case it
> is pretty clear that the Ethernet MAC is in charge and it uses the
> PHY.
>
> In either case it is absolutely required that the 'master' driver
> knows how to find and wait for all the subservient devices before
> probing can complete.
>
> I know that isn't a solid answer, but you know the problem space
> better than I. Take the above into account, make a decision and post a
> binding proposal for review.

Well, I have given a proposal of what I already implemented during
Russell's Armada DRM driver RFCs. I am fine with *anyone* picking up
*any* solution discussed here as long as it involves phandles linking
SoC nodes (lcd-controller) with external I2C nodes (hdmi-transceiver).

If it is super-node or master/slave properties, I don't care as long
as it is somehow related to HW and not some SW subsystem requirements.
I can think of both solutions solving Marvell SoC DRM driver "issues"
and I guess even for the most of other SoCs as well.

The only scenario out of the three above that can possibly start
displaying video while waiting for sub-drivers is (3). You can
output video through LCD1 while waiting for HDMI.

But, that is in no way related to "best practice device tree design
for display subsystems" which this discussion is about but
implementation details of DRM or any other subsystem.

The pure existence of the link in a specific device tree description
has to be sufficient for the driver or its subsystem to find out that
(a) the node linked *is* mandatory, (b) how to wait for the (possible)
driver for the linked node, and (c) fatally fail if it is not
responding.

Finally, if there is no proposal done in the meantime, I will pick it
up in a month or two.

Sebastian
