From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC PATCH] edac: zynq: Added EDAC support for zynq ddr ecc
 controller
Date: Mon, 10 Mar 2014 10:56:56 +0000
Message-ID: <20140310105655.GH14999@e106331-lin.cambridge.arm.com>
References: <4adb2b4b-2ad6-42b9-929e-cc062f817245@TX2EHSMHS021.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4adb2b4b-2ad6-42b9-929e-cc062f817245-8XeO8fnFoNFnw48GICbVzrjjLBE8jN/0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: "dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org" <dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org" <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org" <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, "kpc528-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <kpc528-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "kalluripunnaiahchoudary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <kalluripunnaiahchoudary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org" <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Mar 09, 2014 at 02:57:16AM +0000, Punnaiah Choudary Kalluri wrote:
> Added EDAC support for reporting the ecc errors of zynq ddr controller.
> The ddr ecc controller corrects single bit errors and detects double bit
> errors
> 
> Signed-off-by: Punnaiah Choudary Kalluri <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> ---
>  .../devicetree/bindings/edac/zynq_edac.txt         |   18 +
>  drivers/edac/Kconfig                               |    7 +
>  drivers/edac/Makefile                              |    1 +
>  drivers/edac/zynq_edac.c                           |  613 ++++++++++++++++++++
>  4 files changed, 639 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/edac/zynq_edac.txt
>  create mode 100644 drivers/edac/zynq_edac.c
> 
> diff --git a/Documentation/devicetree/bindings/edac/zynq_edac.txt b/Documentation/devicetree/bindings/edac/zynq_edac.txt
> new file mode 100644
> index 0000000..c21ff83
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/edac/zynq_edac.txt
> @@ -0,0 +1,18 @@
> +Zynq EDAC driver, it does reports the DDR ECC single bit errors that are
> +corrected and double bit ecc errors that are detected by the DDR ECC controller.
> +ECC support for DDR is available in half-bus width(16 bit) configuration only.
> +
> +Required properties:
> +- compatible: Should be "xlnx,ps7-ddrc" or "xlnx,ps7-ddrc-1.00.a"

Is this an or or a xor?

For the former case, which is the most general, which can be used as a
fallback?

How about something like:

- compatible: should contain:
  * "xlnx,ps7-ddrc-1.00.a" for <DESCRIPTION HERE>
  * "xlnx,ps7-ddrc" for any compatible variant

Is there any need at all for the "xlnx,ps7-ddrc" string? The driver
doesn't care about it.

Cheers,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
