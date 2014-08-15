From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 3/6] Documentation: DT: Add entry for FSL Management
 Complex
Date: Fri, 15 Aug 2014 12:00:20 +0100
Message-ID: <20140815110020.GC15621@leverpostej>
References: <1408096156-29772-1-git-send-email-bhupesh.sharma@freescale.com>
 <1408096156-29772-4-git-send-email-bhupesh.sharma@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1408096156-29772-4-git-send-email-bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bhupesh Sharma <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "J. German Rivera" <German.Rivera-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, "stuart.yoder-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <stuart.yoder-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "arnab.basu-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <arnab.basu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

[devicetree-discuss is no more, fixing up to devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org]

Hi,

On Fri, Aug 15, 2014 at 10:49:12AM +0100, Bhupesh Sharma wrote:
> This patch adds a devicetree binding documentation for FSL's
> Management Complex.
> 
> Management Complex is a hardware resource manager that manages
> specialized hardware objects used in network-oriented packet
> processing applications
> 
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Signed-off-by: Stuart Yoder <stuart.yoder-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Signed-off-by: J. German Rivera <German.Rivera-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  .../devicetree/bindings/misc/fsl,qoriq-mc.txt      |   40 ++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
> 
> diff --git a/Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt b/Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
> new file mode 100644
> index 0000000..608529e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
> @@ -0,0 +1,40 @@
> +* Freescale Management Complex
> +
> +The Freescale Management Complex (fsl-mc) is a hardware resource
> +manager that manages specialized hardware objects used in
> +network-oriented packet processing applications.  After the fsl-mc
> +block is enabled, pools of hardware resources are available, such as
> +queues, buffer pools, I/O interfaces.  These resources are building
> +blocks that can be used to create functional hardware objects/devices
> +such as network interfaces, crypto accelerator instances, L2 switches,
> +etc.
> +
> +Required properties:
> +
> +    - compatible
> +        Value type: <string>
> +        Definition: Must be "fsl,qoriq-mc".  A Freescale Management Complex
> +                    compatible with this binding must have Block Revision
> +                    Registers BRR1 and BRR2 at offset 0x0BF8 and 0x0BFC in
> +                    the MC control register region.
> +
> +    - reg
> +        Value type: <prop-encoded-array>
> +        Definition: A standard property.  Specifies one or two regions
> +                    defining the MC's registers:
> +
> +                       -the first region is the command portal for the
> +                        this machine and must always be present
> +
> +                       -the second region is the MC control registers. This
> +                        region may not be present in some scenarios, such
> +                        as in the device tree presented to a virtual machine.

This looks extremely simple. Is this unit self-contained or does it
relate to other blocks which will be described separately?

> +
> +Example:
> +
> +        fsl_mc: fsl-mc@80c000000 {
> +                compatible = "fsl,qoriq-mc";
> +                reg = <0x00000008 0x0c000000 0 0x40        // MC portal base
> +                       0x00000000 0x08340000 0 0x40000 >;  // MC control reg

Nit: could we bracket list entries individually please?

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
