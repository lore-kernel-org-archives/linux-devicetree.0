From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Best practice device tree design for display subsystems/DRM
Date: Fri, 5 Jul 2013 10:51:04 +0100
Message-ID: <CACxGe6v_oQptLZzgsT_nf-K4680mP1f8sHJHN8AekeEy0_T18w@mail.gmail.com>
References: <CAMLZHHREVEdRuHaD0imRu4pUv15ZyWYF2J9WCBEw-frxBry-Lw@mail.gmail.com>
 <20130702204255.2044c01b@armhf>
 <20130702191923.GD13924@flint.arm.linux.org.uk>
 <51D330AC.5060903@gmail.com>
 <CAMLZHHTbkfxmzrSrAU586Ywxptk=4Njzb0_puWxhfBcmBB0BWQ@mail.gmail.com>
 <51D348F5.2080205@gmail.com> <00ae01ce77cb$524d57f0$f6e807d0$%dae@samsung.com>
 <20130703090242.GM516@pengutronix.de>
 <CACxGe6uRJ9B9qnPT_KLNphg-n2WeA9UFO-rvCdKJHijGqJ8SOg@mail.gmail.com>
 <51D69324.90301@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <51D69324.90301-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
Cc: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, Daniel Drake <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Russell King <rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 5, 2013 at 10:34 AM, Sebastian Hesselbarth
<sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> So for the discussion, I can see that there have been some voting for
> super-node, some for node-to-node linking. Although I initially proposed
> super-nodes, I can also happily live with node-to-node linking alone.
>
> Either someone can give an example where one of the approaches will not
> work (i.MX, exynos?), Grant or one of the DRM maintainers has a
> preference, or we are stuck at the decision.

I tend to prefer a top-level super nodes with phandles to all of the
components that compose the device when there is no clear one device
that controls all the others. There is some precedence for that in
other subsystems (leds, asoc, etc). Sound in particular has a lot of
different bits and pieces that are interconnected with audio channels,
gpios, and other things that get quite complicated, so it is
convenient to have a single node that describes how they all fit
together *and* allows for a platform to use a completely different
device driver if required.

node-to-node linking works well if there an absolute 'master' can be
identified for the virtual device. ie. Ethernet MAC devices use a
"phy-device" property to link to the phy it requires. In that case it
is pretty clear that the Ethernet MAC is in charge and it uses the
PHY.

In either case it is absolutely required that the 'master' driver
knows how to find and wait for all the subservient devices before
probing can complete.

I know that isn't a solid answer, but you know the problem space
better than I. Take the above into account, make a decision and post a
binding proposal for review.

g.
