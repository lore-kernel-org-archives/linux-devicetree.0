From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v19 01/12] fpga: add bindings document for fpga region
Date: Sat, 8 Oct 2016 15:49:28 -0500
Message-ID: <20161008204928.GB11595@rob-hp-laptop>
References: <20160928182200.15800-1-atull@opensource.altera.com>
 <20160928182200.15800-2-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160928182200.15800-2-atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Josh Cartwright <joshc-acOepvfBmUk@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Cyril Chemparathy <cyril.chemparathy-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Matthew Gerlach <mgerlach-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Walter Goossens <waltergoossens-CmkmPbn3yAE@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 28, 2016 at 01:21:49PM -0500, Alan Tull wrote:
> New bindings document for FPGA Region to support programming
> FPGA's under Device Tree control
> 
> Signed-off-by: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> Signed-off-by: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
> ---
> v9:  initial version added to this patchset
> v10: s/fpga/FPGA/g
>      replace DT overlay example with slightly more complicated example
>      move to staging/simple-fpga-bus
> v11: No change in this patch for v11 of the patch set
> v12: Moved out of staging.
>      Changed to use FPGA bridges framework instead of resets
>      for bridges.
> v13: bridge@0xff20000 -> bridge@ff200000, etc
>      Leave out directly talking about overlays
>      Remove regs and clocks directly under simple-fpga-bus in example
>      Use common "firmware-name" binding instead of "fpga-firmware"
> v14: Use firmware-name in bindings description
>      Call it FPGA Area
>      Remove bindings that specify FPGA Manager and FPGA Bridges
> v15: Cleanup as per Rob's comments
>      Combine usage doc with bindings document
>      Document as being Altera specific
>      Additions and changes to add FPGA Bus
> v16: Reworked to document FPGA Regions
>      rename altera-fpga-bus-fpga-area.txt -> fpga-region.txt
>      Remove references that made it sound exclusive to Altera
>      Remove altr, prefix from fpga-bus and fpga-area compatible strings
>      Added Moritz' usage example with Xilinx
>      Cleaned up unit addresses
> v17: Lots of rewrites to try to make things clearer
>      Clarify that overlay can be rejected if FPGA isn't programmed
>      Add external-fpga-config binding already used in u-boot
>      Change partial-reconfig binding to partial-fpga-config to align
>        with existing u-boot binding format *-fpga-config
>      Add a document from Xilinx' website
> v18: Fix node names underscores to be hyphens
>      Fix copy/pasted duplicate nodes in diagram
> v19: Fix more underscores
>      Make FPGA regions to be children of bridges
>      General cleanup and clarification
> ---
>  .../devicetree/bindings/fpga/fpga-region.txt       | 494 +++++++++++++++++++++
>  1 file changed, 494 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/fpga/fpga-region.txt

Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Nice job.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
