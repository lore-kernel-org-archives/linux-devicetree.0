From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] of: use platform_device_add
Date: Thu, 22 Nov 2012 21:19:09 +0000
Message-ID: <20121122211909.9B1E03E129E@localhost>
References: <1353521759-28263-1-git-send-email-grant.likely@secretlab.ca>
 <20121121183403.GA7657@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121121183403.GA7657-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
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
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 21 Nov 2012 10:34:03 -0800, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org> wrote:
> On Wed, Nov 21, 2012 at 06:15:59PM +0000, Grant Likely wrote:
> > This allows platform_device_add a chance to call insert_resource on all
> > of the resources from OF. At a minimum this fills in proc/iomem and
> > presumably makes resource tracking and conflict detection work better.
> > However, it has the side effect of moving all OF generated platform
> > devices from /sys/devices to /sys/devices/platform/. It /shouldn't/
> > break userspace because userspace is not supposed to depend on the full
> > path (because userspace always does what it is supposed to, right?).
> > 
> > It also has a backup call to of_device_add() when running on PowerPC to
> > catch any devices that have overlapping regions. It will complain about
> > them, but it will not fail to register the device.
> > 
> > Cc: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
> > Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
> > Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> > Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> > Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> > ---
> > 
> > Greg, do you mind taking a look at this? The reason the OF code hasn't been
> > calling platform_device_add() directly to this point is:
> > a) there are some trees with resource overlays
> > b) I want the devices in /sys/devices not /sys/devices/platform.
> 
> Putting the devices all in the "flat" location of /sys/devices/ is a bit
> worrisome to me.  What's wrong with platform/ ?  That is what they are,
> right?  Why change this?

Hahaha. *You* encouraged me to write the patch to remove
/sys/devices/platform/ when I was waffling over whether or not it was a
good idea. Granted, that was well over a year ago, but it takes me a
while to get around to some of the things on my todo list. :-)

It's not so much that there is anything wrong with platform/ other than
it is nonsensical. For example, a core system bus is often represented by an
platform device of it's own with a bunch of peripherals as children of
that. For example a PCI host controller. It doesn't make much sense to me for
some core devices to be at /sys/devices and others to be gathered
together under /sys/devices/platform.

However, all that mildly feels 'wrong' to me but isn't that big deal. A
bigger problem with b) (which I didn't describe well) is that existing
PowerPC support roots the platform devices hierarchy at /sys/devices, not
/sys/devices/platform and I'm nervous that changing it will break
things. If I commit the change that makes the move, and somebody
complains that I broke their userspace, then I need to have an exception
for those system or revert the patch entirely.

Regardless, I'm no longer happy with DT and non-DT platform device
registration having separate code paths. I would /like/ for
sys/device/platform to disappear, but that is merely a side issue.
The real issue is whether or not existing PowerPC userspace breaks. If
it does, there needs to be an exception to keep things under
/sys/devices.

> > I could easily add exceptions to platform_device_add() for both those cases, but
> > I don't like adding DT exceptions to the common code. However, I still need to
> > support the platforms that unfortunately have overlapping resources. This patch
> > does that by still calling the old path if platform_device_add() fails, but it
> > isn't nice either because of_device_add() has to duplicate
> > platform_device_add(). Blech. Plus the exception only applies for PowerPC.
> > 
> > So, how do you feel about having a 'relaxed' mode for platform_device_add()
> > which means it won't fail if resources overlap and maybe won't do the silly
> > platform_bus parent thing. Thoughts?
> 
> I have no objection for the resource issue, if you assure me it will not
> be abused :)

I can make that assurance. It will be powerpc-only also.

g.
