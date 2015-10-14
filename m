From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 1/2] powerpc/fsl: Add PCI node in device tree of
 bsc9132qds
Date: Wed, 14 Oct 2015 15:36:08 -0500
Message-ID: <1444854968.5185.205.camel@freescale.com>
References: <1444735761-1510-1-git-send-email-B48286@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444735761-1510-1-git-send-email-B48286-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhiqiang Hou <B48286-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org, mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, harninder.rai-KZfg59tc24xl57MIdRCFDg@public.gmane.org, Minghuan.Lian-KZfg59tc24xl57MIdRCFDg@public.gmane.org, Mingkai.Hu-KZfg59tc24xl57MIdRCFDg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2015-10-13 at 19:29 +0800, Zhiqiang Hou wrote:
> From: Harninder Rai <harninder.rai-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> 
> Signed-off-by: Harninder Rai <harninder.rai-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Signed-off-by: Minghuan Lian <Minghuan.Lian-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Change-Id: I4355add4a92d1fcf514843aea5ecadd2e2517969
> Reviewed-on: http://git.am.freescale.net:8181/2454
> Reviewed-by: Zang Tiefei-R61911 <tie-fei.zang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Reviewed-by: Kushwaha Prabhakar-B32579 <prabhakar-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Reviewed-by: Fleming Andrew-AFLEMING <AFLEMING-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Tested-by: Fleming Andrew-AFLEMING <AFLEMING-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

Get rid of the gerrit stuff.  And where is your signoff?

> diff --git a/arch/powerpc/boot/dts/fsl/bsc9132si-post.dtsi 
> b/arch/powerpc/boot/dts/fsl/bsc9132si-post.dtsi
> index c723071..78c8f1c 100644
> --- a/arch/powerpc/boot/dts/fsl/bsc9132si-post.dtsi
> +++ b/arch/powerpc/boot/dts/fsl/bsc9132si-post.dtsi
> @@ -40,6 +40,35 @@
>       interrupts = <16 2 0 0 20 2 0 0>;
>  };
>  
> +/* controller at 0xa000 */
> +&pci0 {
> +     compatible = "fsl,bsc9132-pcie", "fsl,qoriq-pcie-v2.2";
> +     device_type = "pci";
> +     #size-cells = <2>;
> +     #address-cells = <3>;
> +     bus-range = <0 255>;
> +     clock-frequency = <33333333>;
> +     interrupts = <16 2 0 0>;

This clock-frequency is not correct for PCIe.  Just remove it.

-Scott

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
