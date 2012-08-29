From: Daniel Drake <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>
Subject: Challenges of migrating to DT
Date: Wed, 29 Aug 2012 08:48:15 -0600
Message-ID: <CAMLZHHTPoL5Bfnbg731H7pnF3hORKR1W1St+WnnWsCz3+nvggw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
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
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

At OLPC we are working hard to migrate from board files to the device
tree for our existing ARM laptop XO-1.75, and we are also working
directly with the DT (no board file) from day 1 with development of
our upcoming XO-4 ARM laptop.

While the coding aspect is going fine, we have some open questions
around the migration aspects and sustainability of our DT efforts. I'm
wondering if these issues extend to other DT users and if there are
any experiences that we can learn from.

The root of the issue is that using DT creates a strong bond between
the firmware (DT provider) and the kernel (DT consumer). However, we
cannot guarantee that our users stick to specific firmware/DT pair.

1. For our existing XO-1.75 users in the field, our existing DT is not
good enough to allow a DT-based kernel to boot. When we upgrade these
systems from board-file-based kernels to DT ones, we can also push a
firmware update, but we cannot guarantee that the firmware update gets
installed at the same time as the new kernel. (The firmware will only
be updated when AC power is available, and it typically isn't
available at the time when the software update is received from the
school server).

So this covers the first tricky situation: upgrades. We have an issue
where we ideally need to support an old, DT-less firmware running
against a kernel with no board file that looks to do everything from
the DT.


2. For our new XO-4 efforts, we are having to define DT layouts for
the hardware shipped in the laptop. And while we're working hard to do
this cleanly, I fear that the upstreaming process will result in some
(incompatible?) changes to these nodes and layouts. However, we're
under time pressures and we're a small team; it seems unlikely that
we'll be able to upstream much of this before our initial shipment to
real users. So we will again potentially find ourselves in a similar
situation to above, where "old" software releases (i.e. the one
shipped to first customers) include a DT that it somehow
incompatible/insufficient for a new kernel (some time later when we
upstream things and move to the upstream-refined DT layout).

I know that there is a great deal of help available on this list for
the upstreaming process, and in an ideal world we'd upstream
everything before shipping, but in this case reality takes a nasty
bite (resources-wise this would be difficult to achieve for us) and
I'm wondering if others have faced similar situations in the past.


One solution that initially stands out is appending the DT to the
kernel image, to break the tricky bond between firmware and kernel.
But this is probably harder than it sounds; we ship slightly different
versions of these laptops (with/without touchscreen, different camera
sensors, ...) and shipping different kernels to cover all the
different combinations would be painful.

More discussion here:
http://wiki.laptop.org/go/Device_tree_upgrade_considerations

Thanks
Daniel
