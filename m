From: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH] of: use platform_device_add
Date: Wed, 21 Nov 2012 10:34:03 -0800
Message-ID: <20121121183403.GA7657@kroah.com>
References: <1353521759-28263-1-git-send-email-grant.likely@secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1353521759-28263-1-git-send-email-grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
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
Cc: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 21, 2012 at 06:15:59PM +0000, Grant Likely wrote:
> This allows platform_device_add a chance to call insert_resource on all
> of the resources from OF. At a minimum this fills in proc/iomem and
> presumably makes resource tracking and conflict detection work better.
> However, it has the side effect of moving all OF generated platform
> devices from /sys/devices to /sys/devices/platform/. It /shouldn't/
> break userspace because userspace is not supposed to depend on the full
> path (because userspace always does what it is supposed to, right?).
> 
> It also has a backup call to of_device_add() when running on PowerPC to
> catch any devices that have overlapping regions. It will complain about
> them, but it will not fail to register the device.
> 
> Cc: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
> Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
> Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> ---
> 
> Greg, do you mind taking a look at this? The reason the OF code hasn't been
> calling platform_device_add() directly to this point is:
> a) there are some trees with resource overlays
> b) I want the devices in /sys/devices not /sys/devices/platform.

Putting the devices all in the "flat" location of /sys/devices/ is a bit
worrisome to me.  What's wrong with platform/ ?  That is what they are,
right?  Why change this?

> I could easily add exceptions to platform_device_add() for both those cases, but
> I don't like adding DT exceptions to the common code. However, I still need to
> support the platforms that unfortunately have overlapping resources. This patch
> does that by still calling the old path if platform_device_add() fails, but it
> isn't nice either because of_device_add() has to duplicate
> platform_device_add(). Blech. Plus the exception only applies for PowerPC.
> 
> So, how do you feel about having a 'relaxed' mode for platform_device_add()
> which means it won't fail if resources overlap and maybe won't do the silly
> platform_bus parent thing. Thoughts?

I have no objection for the resource issue, if you assure me it will not
be abused :)

But the sysfs location is still an issue, sorry.

thanks,

greg k-h
