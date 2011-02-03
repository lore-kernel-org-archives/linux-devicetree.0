From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH TIP v2 03/14] x86/dtb: Add a device tree for CE4100
Date: Thu, 3 Feb 2011 14:07:46 -0700
Message-ID: <20110203210746.GI6180@angua.secretlab.ca>
References: <1295843342-1122-1-git-send-email-bigeasy@linutronix.de>
	<1295843342-1122-4-git-send-email-bigeasy@linutronix.de>
	<20110127050027.GB23443@yookeroo>
	<20110202185841.GA28674@www.tglx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110202185841.GA28674-Hfxr4Dq0UpYb1SvskN2V4Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 03, 2011 at 12:28:41AM +0530, Sebastian Andrzej Siewior wrote:
> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
> Signed-off-by: Dirk Brandewie <dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> - intel,ce4100-immr become intel,ce4100-cp. cp stands for core
>   peripherals. The Atom data sheet talks here about ACPI devices. Since
>   we don't have ACPI this does not apply here.
> - The interrupt map is gone. There are now plenty of device nodes.
> - The "unit address string" got fixed, it uses not DD,V format.

You can go ahead and keep the revision history above the s-o-b and ---
lines.  It turns out that having the revision history in the commit
text is actually useful when trying to figure out what version of a
patch actually got applied.

>  arch/x86/platform/ce4100/falconfalls.dts |  424 ++++++++++++++++++++++++++++++
>  1 files changed, 424 insertions(+), 0 deletions(-)
>  create mode 100644 arch/x86/platform/ce4100/falconfalls.dts
> 
> diff --git a/arch/x86/platform/ce4100/falconfalls.dts b/arch/x86/platform/ce4100/falconfalls.dts
> new file mode 100644
> index 0000000..e888657
> --- /dev/null
> +++ b/arch/x86/platform/ce4100/falconfalls.dts
> @@ -0,0 +1,424 @@
> +/*
> + * CE4100 on Falcon Falls
> + *
> + * (c) Copyright 2010 Intel Corporation
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; version 2 of the License.
> + */
> +/dts-v1/;
> +/ {
> +	model = "intel,falconfalls";
> +	compatible = "intel,falconfalls";
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu@0 {
> +			device_type = "cpu";
> +			compatible = "intel,ce4100";
> +			reg = <0>;
> +			lapic = <&lapic0>;
> +		};
> +	};
> +
> +	soc@0 {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		compatible = "intel,ce4100-cp";

You'll need to add blurbs to Documentation/devicetree/bindings
(Documentation/powerpc/dts-bindings in Linus' tree; renamed in
linux-next) for each of these new compatible bindings to document the
part that they describe and any special properties that go with each
compatible value (if any).  You can send it as a followup patch.

> +				gpio@b,1 {
> +					compatible = "pci8086,2e67.2",
> +						   "pci8086,2e67",
> +						   "pciclassff0000",
> +						   "pciclassff00";
> +
> +					reg = <0x15900 0x0 0x0 0x0 0x0>;
> +					interrupts = <15 1>;
> +				};

You'll probably want to make use of the gpio-controller binding for
the gpio nodes so that other nodes can reference it.  Not a
showstopper for this patch though.

Otherwise looks good to me.
g.
