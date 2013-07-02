From: Russell King <rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: Best practice device tree design for display subsystems/DRM
Date: Tue, 2 Jul 2013 21:25:48 +0100
Message-ID: <20130702202548.GE13924@flint.arm.linux.org.uk>
References: <CAMLZHHREVEdRuHaD0imRu4pUv15ZyWYF2J9WCBEw-frxBry-Lw@mail.gmail.com>
 <20130702204255.2044c01b@armhf>
 <20130702191923.GD13924@flint.arm.linux.org.uk> <51D330AC.5060903@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <51D330AC.5060903-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Daniel Drake <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 02, 2013 at 09:57:32PM +0200, Sebastian Hesselbarth wrote:
> I am against a super node which contains lcd and dcon/ire nodes. You can
> enable those devices on a per board basis. We add them to dove.dtsi but
> disable them by default (status = "disabled").
>
> The DRM driver itself should get a video-card node outside of  
> soc/internal-regs where you can put e.g. video memory hole (or video
> mem size if it will be taken from RAM later)
>
> About the unusual case, I guess we should try to get both lcd
> controllers into one DRM driver. Then support mirror or screen
> extension X already provides. For those applications where you want
> X on one lcd and some other totally different video stream - wait
> for someone to come up with a request or proposal.

Well, all I can say then is that the onus is on those who want to treat
the components as separate devices to come up with some foolproof way
to solve this problem which doesn't involve making assumptions about
the way that devices are probed and doesn't end up creating artificial
restrictions on how the devices can be used - and doesn't end up burdening
the common case with lots of useless complexity that they don't need.

It's _that_ case which needs to come up with a proposal about how to
handle it because you _can't_ handle it at the moment in any sane
manner which meets the criteria I've set out above, and at the moment
the best proposal by far to resolve that is the "super node" approach.

There is _no_ way in the device model to combine several individual
devices together into one logical device safely when the subsystem
requires that there be a definite point where everything is known.
That applies even more so with -EPROBE_DEFER.  With the presence of
such a thing, there is now no logical point where any code can say
definitively that the system has technically finished booting and all
resources are known.

That's the problem - if you don't od the super-node approach, you end
up with lots of individual devices which you have to figure out some
way of combining, and coping with missing ones which might not be
available in the order you want them to be, etc.

That's the advantage of the "super node" approach - it's a container
to tell you what's required in order to complete the creation of the
logical device, and you can parse the sub-nodes to locate the
information you need.

An alternative as I see it is that DRM - and not only DRM but also
the DRM API and Xorg - would need to evolve hotplug support for the
various parts of the display subsystem.  Do we have enough people
with sufficient knowledge and willingness to be able to make all
that happen?  I don't think we do, and I don't see that there's any
funding out there to make such a project happen, which would make it
a volunteer/spare time effort.

-- 
Russell King
