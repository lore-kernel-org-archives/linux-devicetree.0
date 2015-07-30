From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v2 2/2] powerpc/mpc85xx: Add FSL QorIQ DPAA FMan support
 to the SoC device tree(s)
Date: Thu, 30 Jul 2015 15:12:23 -0500
Message-ID: <1438287143.2993.367.camel@freescale.com>
References: <1438230794-10983-1-git-send-email-igal.liberman@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1438230794-10983-1-git-send-email-igal.liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: igal.liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, madalin.bucur-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2015-07-30 at 07:33 +0300, Igal.Liberman wrote:
> @@ -307,4 +307,117 @@
>               reg = <0xe0000 0x1000>;
>               fsl,has-rstcr;
>       };
> +
> +      fman@100000{
> +             #address-cells = <1>;
> +             #size-cells = <1>;
> +             cell-index = <0>;
> +             ranges = <0 0x100000 0x100000>;
> +             compatible = "fsl,fman";
> +             reg = <0x100000 0x100000>;
> +             interrupts = <24 2 0 0>, <16 2 1 30>;
> +             clock-frequency = <0>;
> +             fsl,qman-channel-range = <0x40 0x7>;

fman is supposed to have clocks/clock-names, not clock-frequency.

-Scott

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
