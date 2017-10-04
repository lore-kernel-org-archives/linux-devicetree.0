From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] nvmem: imx-ocotp: read uniq CPU ID and export as system
 serial number
Date: Wed, 4 Oct 2017 16:44:29 +0100
Message-ID: <20171004154428.GK23092@leverpostej>
References: <20171004151616.2622-1-marcus.folkesson@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171004151616.2622-1-marcus.folkesson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcus Folkesson <marcus.folkesson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 04, 2017 at 05:16:16PM +0200, Marcus Folkesson wrote:
> The uniq ID is usually exported as ATAG_SERIAL but in case of
> devicetrees, this information is not passed.
> 
> The uniq ID is stored in OCOTP memory (bank 0, Word 1,2) on imx CPUs.
> Read the ID and set as system serial number.
> 
> This function is activated by setting `read-system-serial`
> dt property for the imx-ocotp node.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> 
> Comment:
> I'm not sure if this functionality really should be in a device driver.
> Maybe it should be in arch/arm/mach-imx/. However, it's not
> completely wrong so I give it a shot.
> 
>  .../devicetree/bindings/nvmem/imx-ocotp.txt        |  1 +
>  drivers/nvmem/imx-ocotp.c                          | 38 ++++++++++++++++++++++
>  2 files changed, 39 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt b/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
> index 70d791b03ea1..bf0cc9e5e50f 100644
> --- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
> +++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
> @@ -16,6 +16,7 @@ Required properties:
>  
>  Optional properties:
>  - read-only: disable write access
> +- read-system-serial: read uniq ID and export as system serial number. Available in /proc/cpuinfo

As described, this is a pure SW option (

/proc/cpuinfo is a not a HW detail, and whether or not to export this
information there is a policy. So as described, this shouldn't be in the
DT.

Are you just trying to describe whether hte information is available in
the OCOTP memory?

e.g. maybe this should be something like:

- has-unique-id: OCOTP bank0, Words 1 & 2 contain a unique ID
  identifying the system.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
