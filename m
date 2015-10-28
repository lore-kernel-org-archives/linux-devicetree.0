From: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v12 1/6] fpga: add usage documentation for simple fpga bus
Date: Tue, 27 Oct 2015 17:23:41 -0700
Message-ID: <CAAtXAHce3OVfZt5MCTdJ8bTEjP0QWTE1y5C9SOMSH1+YWsWLYg@mail.gmail.com>
References: <1445983755-24007-1-git-send-email-atull@opensource.altera.com>
	<1445983755-24007-2-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445983755-24007-2-git-send-email-atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Cc: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Josh Cartwright <joshc-acOepvfBmUk@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org" <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Alan,

great docs! Couple of nits inline below

On Tue, Oct 27, 2015 at 3:09 PM,  <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org> wrote:
> From: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
>
> Add a document spelling out usage of the simple fpga bus.
>
> Signed-off-by: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> ---
> v9:  Initial version of this patch in patchset
> v10: s/fpga/FPGA/g
>      improve formatting
>      some rewriting
>      move to staging/simple-fpga-bus
> v11: No change in this patch for v11 of the patch set
> v12: Moved out of staging
>      Small changes due to using FPGA bridge framework and not
>      representing the bridges as resets.
> ---
>  Documentation/fpga/simple-fpga-bus.txt |   58 ++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 Documentation/fpga/simple-fpga-bus.txt
>
> diff --git a/Documentation/fpga/simple-fpga-bus.txt b/Documentation/fpga/simple-fpga-bus.txt
> new file mode 100644
> index 0000000..bd43478
> --- /dev/null
> +++ b/Documentation/fpga/simple-fpga-bus.txt
> @@ -0,0 +1,58 @@
> +Simple FPGA Bus
> +
> +Alan Tull 2015
> +
> +Overview
> +========
> +
> +The simple FPGA bus adds device tree overlay support for FPGA's.  Loading a

FPGAs
> +DT overlay will result in the FPGA getting an image loaded, its bridges will

I'd prefer 'will result in the FPGA being programmed with an image'

> +be released, and the DT populated for nodes below the simple-fpga-bus.  This
> +results in drivers getting probed for the hardware that just got added.  This
> +is intended to support the FPGA usage where the FPGA has hardware that
> +requires drivers.  Removing the overlay will result in the drivers getting
> +removed and the bridges being disabled.
> +
> +The simple FPGA bus will need to disable and enable bridges that will only
> +affect the child devices that are below the bus.  If partial reconfiguration
> +is to be done, then bridges will need to be added within the FPGA design to
> +protect the rest of the bus when one part of the FPGA design is being
> +reconfigured.
> +
> +
> +Sequence
> +========
> +
> +Load the DT overlay.  One way to do that from user space is to use Pantelis'
> +DT-Overlay configfs interface.
> +
> +This causes the simple FPGA bus go be probed and will do the following:

I think you mean *to* be probed
> + 1. Disable the FPGA bridges.
> + 2. Call the FPGA manager core to program the FPGA.
> + 3. Release the FPGA bridges.
> + 4. Call of_platform_populate resulting in device drivers getting probed.
> +
> +
> +Requirements
> +============
> +
> + 1. An FPGA image that has a hardware block or blocks that use drivers that are
> +    supported in the kernel.
> + 2. A device tree overlay (example is in the simple-fpga-bus bindings document).
> + 3. A FPGA manager driver supporting writing the FPGA.
> + 4. FPGA bridge drivers.
> +
> +The DT overlay includes bindings (documented in bindings/simple-fpga-bus.txt)
> +that specify:
> + * Which FPGA manager to use.
> + * Which image file to load.
> + * Flags indicating whether this this image is for full reconfiguration or
> +   partial.
> + * A list of FPGA bridges.
> + * Child nodes specifying the devices that will be added with appropriate
> +   compatible strings, etc.
> +
> +Since this code uses the firmware interface to get the image and DT overlay,
> +they currently have to be files on the file system.  It doesn't have to be that
> +way forever as DT bindings could be added to point to other sources for the
> +image.

Having this will be really useful, but I agree this can be a follow up patch.
> --
> 1.7.9.5
>

I'll take a closer look but feel free to add a:

Reviewed-by: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>

Cheers,

Moritz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
