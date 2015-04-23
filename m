From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 3/5] Documentation: Add documentation for the APM
 X-Gene SoC EDAC DTS binding
Date: Thu, 23 Apr 2015 13:48:32 -0500
Message-ID: <CAL_JsqLyoEOw-Xzr2_QC-qbVW50CBEintD4hAtiY=_xwR5EBgw@mail.gmail.com>
References: <1426573821-1937-1-git-send-email-lho@apm.com> <1426573821-1937-2-git-send-email-lho@apm.com>
 <1426573821-1937-3-git-send-email-lho@apm.com> <1426573821-1937-4-git-send-email-lho@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426573821-1937-4-git-send-email-lho-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Cc: Doug Thompson <dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>, "jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "patches-qTEPVZfXA3Y@public.gmane.org" <patches-qTEPVZfXA3Y@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 17, 2015 at 1:30 AM, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org> wrote:
> This patch adds documentation for the APM X-Gene SoC EDAC DTS binding.
>
> Signed-off-by: Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>
> Signed-off-by: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
> ---
>  .../devicetree/bindings/edac/apm-xgene-edac.txt    |   82 ++++++++++++++++++++
>  1 files changed, 82 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/edac/apm-xgene-edac.txt
>
> diff --git a/Documentation/devicetree/bindings/edac/apm-xgene-edac.txt b/Documentation/devicetree/bindings/edac/apm-xgene-edac.txt
> new file mode 100644
> index 0000000..db8c1c4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/edac/apm-xgene-edac.txt
> @@ -0,0 +1,82 @@
> +* APM X-Gene SoC EDAC nodes
> +
> +EDAC nodes are defined to describe on-chip error detection and correction.
> +There are four types of EDAC:
> +
> +  memory controller    - Memory controller
> +  PMD (L1/L2)          - Processor module unit (PMD) L1/L2 cache
> +  L3                   - CPU L3 cache
> +  SoC                  - SoC IP such as SATA, Ethernet, and etc
> +
> +The following section describes the memory controller DT node binding.
> +
> +Required properties:
> +- compatible           : Shall be "apm,xgene-edac-mc".
> +- reg                  : First resource shall be the PCP resource.
> +                         Second resource shall be the CSW resource.
> +                         Third resource shall be the MCB-A resource.
> +                         Fourth resource shall be the MCB-B resource.
> +                         Fifth resource shall be the MCU resource.
> +- interrupts            : Interrupt-specifier for MCU error IRQ(s).
> +
> +The following section describes the L1/L2 DT node binding.
> +
> +- compatible           : Shall be "apm,xgene-edac-pmd".
> +- reg                  : First resource shall be the PCP resource.
> +                         Second resource shall be the PMD resource.
> +                         Third resource shall be the PMD efuse resource.
> +- interrupts            : Interrupt-specifier for PMD error IRQ(s).
> +
> +The following section describes the L3 DT node binding.
> +
> +- compatible           : Shall be "apm,xgene-edac-l3".
> +- reg                  : First resource shall be the PCP resource.
> +                         Second resource shall be the L3 resource.
> +- interrupts            : Interrupt-specifier for L3 error IRQ(s).
> +
> +The following section describes the SoC DT node binding.
> +
> +- compatible           : Shall be "apm,xgene-edac-soc"".
> +- reg                  : First resource shall be the PCP resource.
> +                         Second resource shall be the SoC resource.
> +                         Third resource shall be the register bus resource.
> +- interrupts           : Interrupt-specifier for SoC error IRQ(s).
> +
> +Example:
> +       edacmc0: edacmc0@7e800000 {
> +               compatible = "apm,xgene-edac-mc";
> +               reg = <0x0 0x78800000 0x0 0x1000>,
> +                     <0x0 0x7e200000 0x0 0x1000>,
> +                     <0x0 0x7e700000 0x0 0x1000>,
> +                     <0x0 0x7e720000 0x0 0x1000>,
> +                     <0x0 0x7e800000 0x0 0x1000>;
> +               interrupts = <0x0 0x20 0x4>,
> +                            <0x0 0x21 0x4>;
> +       };
> +
> +       edacl3: edacl3@7e600000 {
> +               compatible = "apm,xgene-edac-l3";
> +               reg = <0x0 0x78800000 0x0 0x1000>,

You are defining overlapping resources. Don't do that.

It looks to me like you are creating nodes based on driver functions,
not h/w blocks. I would expect to see a memory controller node which
contains ECC related registers. If you have blocks with multiple
unrelated functions, then you should be using syscon to divide up the
functions to different subsystems like EDAC.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
