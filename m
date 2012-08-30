From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Challenges of migrating to DT
Date: Thu, 30 Aug 2012 10:59:04 +1000
Message-ID: <20120830005904.GL5723@truffula.fritz.box>
References: <CAMLZHHTPoL5Bfnbg731H7pnF3hORKR1W1St+WnnWsCz3+nvggw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAMLZHHTPoL5Bfnbg731H7pnF3hORKR1W1St+WnnWsCz3+nvggw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Daniel Drake <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 29, 2012 at 08:48:15AM -0600, Daniel Drake wrote:
> Hi,
> 
> At OLPC we are working hard to migrate from board files to the device
> tree for our existing ARM laptop XO-1.75, and we are also working
> directly with the DT (no board file) from day 1 with development of
> our upcoming XO-4 ARM laptop.
> 
> While the coding aspect is going fine, we have some open questions
> around the migration aspects and sustainability of our DT efforts. I'm
> wondering if these issues extend to other DT users and if there are
> any experiences that we can learn from.
> 
> The root of the issue is that using DT creates a strong bond between
> the firmware (DT provider) and the kernel (DT consumer). However, we
> cannot guarantee that our users stick to specific firmware/DT pair.

Hrm.  Arguably, if you are making a strong bond between firmware and
kernel, you're not doing the DT right.  The DT is supposed to be an OS
neutral description of the hardware.  Now in practice there are quite
a few edge cases where that can get murky, but if you're finding you
routinely need to update DT and kernel in lockstep, then you probably
are doing something wrong.

> 1. For our existing XO-1.75 users in the field, our existing DT is not
> good enough to allow a DT-based kernel to boot. When we upgrade these
> systems from board-file-based kernels to DT ones, we can also push a
> firmware update, but we cannot guarantee that the firmware update gets
> installed at the same time as the new kernel. (The firmware will only
> be updated when AC power is available, and it typically isn't
> available at the time when the software update is received from the
> school server).
> 
> So this covers the first tricky situation: upgrades. We have an issue
> where we ideally need to support an old, DT-less firmware running
> against a kernel with no board file that looks to do everything from
> the DT.

So, this situation is pretty routine on powerpc embedded.  Powerpc
_always_ uses a DT, but it doesn't have to come from firmware.  We
have "bootwrappers" for a whole batch of legacy platforms which
contain a canned DT.  Typically these form the zImage executable which
decompresses the kernel proper (vmlinux), patches up the canned DT
with any bits of information it can extract from the firware and
branches to the kernel with the right DT entry state.

> 2. For our new XO-4 efforts, we are having to define DT layouts for
> the hardware shipped in the laptop. And while we're working hard to do
> this cleanly, I fear that the upstreaming process will result in some
> (incompatible?) changes to these nodes and layouts.

Hrm.  Why so?  You're welcome and encouraged to post device tree
bindings here for comment before you upstream any actual code.

> However, we're
> under time pressures and we're a small team; it seems unlikely that
> we'll be able to upstream much of this before our initial shipment to
> real users. So we will again potentially find ourselves in a similar
> situation to above, where "old" software releases (i.e. the one
> shipped to first customers) include a DT that it somehow
> incompatible/insufficient for a new kernel (some time later when we
> upstream things and move to the upstream-refined DT layout).

So, I think incompatible and insufficient are quite different things
here.  New kernels should not break compatibility with old device tree
bindings, even if new device bindings are introduced.  It's perfectly
acceptable for the kernel to have fallbacks for old ways of
representing things.  Obviously you should make a best effort to get
the DT bindings right in the first place so that that doesn't happen
*too* much.

Insufficient - where the old DT simply does not have enough
information for the kernel to work out what to do - is harder.  This
does represent a much more serious failure to think through your DT
bindings.  It is moderately acceptable to have hacks in the kernel to
"patch up" the device tree with information from other sources, where
available, although you really want to think about your bindings to
try to avoid that.

> I know that there is a great deal of help available on this list for
> the upstreaming process, and in an ideal world we'd upstream
> everything before shipping, but in this case reality takes a nasty
> bite (resources-wise this would be difficult to achieve for us) and
> I'm wondering if others have faced similar situations in the past.
> 
> 
> One solution that initially stands out is appending the DT to the
> kernel image, to break the tricky bond between firmware and kernel.
> But this is probably harder than it sounds; we ship slightly different
> versions of these laptops (with/without touchscreen, different camera
> sensors, ...) and shipping different kernels to cover all the
> different combinations would be painful.

Are there ID registers or firmware information of some sort that can
be used to identify which machine?  I don't know that we have any
examples right now in practice, but an approach I've long seen as
reasonable would be to have a wrapper (bundled with the kernel) which
reads whatever ID information it needs and uses that to pick between
several pre-canned device trees.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
