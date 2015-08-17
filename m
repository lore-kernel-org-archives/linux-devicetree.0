From: Wang Dongsheng <Dongsheng.Wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCH v2 1/2] powerpc/85xx: Add binding for SCFG
Date: Mon, 17 Aug 2015 05:50:35 +0000
Message-ID: <SN1PR0301MB16165146428CF6A8C48FF1B29D790@SN1PR0301MB1616.namprd03.prod.outlook.com>
References: <1439521930-28191-1-git-send-email-dongsheng.wang@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439521930-28191-1-git-send-email-dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wang Dongsheng <Dongsheng.Wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Priyanka Jain <Priyanka.Jain-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Scott,

Could you apply the patches?

Regards,
-Dongsheng

> -----Original Message-----
> From: Dongsheng Wang [mailto:dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org]
> Sent: Friday, August 14, 2015 11:12 AM
> To: Wood Scott-B07421
> Cc: Jain Priyanka-B32167; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linuxppc-
> dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; Wang Dongsheng-B40534
> Subject: [PATCH v2 1/2] powerpc/85xx: Add binding for SCFG
> 
> From: Wang Dongsheng <dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> 
> SCFG provides SoC specific configuration and status registers for
> the chip. Add this for powerpc platform.
> 
> Signed-off-by: Wang Dongsheng <dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
> *V2*
> - Remove scfg description in board.txt and create scfg.txt for scfg.
> - Change "fsl,<board>-scfg" to "fsl,<chip>-scfg"
> 
> diff --git a/Documentation/devicetree/bindings/powerpc/fsl/scfg.txt
> b/Documentation/devicetree/bindings/powerpc/fsl/scfg.txt
> new file mode 100644
> index 0000000..0532c46
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/powerpc/fsl/scfg.txt
> @@ -0,0 +1,18 @@
> +Freescale Supplement configuration unit (SCFG)
> +
> +SCFG is the supplemental configuration unit, that provides SoC specific
> +configuration and status registers for the chip. Such as getting PEX port
> +status.
> +
> +Required properties:
> +
> +- compatible: should be "fsl,<chip>-scfg"
> +- reg: should contain base address and length of SCFG memory-mapped
> +registers
> +
> +Example:
> +
> +	scfg: global-utilities@fc000 {
> +		compatible = "fsl,t1040-scfg";
> +		reg = <0xfc000 0x1000>;
> +	};
> --
> 2.1.0.27.g96db324

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
