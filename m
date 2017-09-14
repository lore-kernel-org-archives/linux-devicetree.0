From: York Sun <york.sun-3arQi8VN3Tc@public.gmane.org>
Subject: Re: [PATCH] config: ls1012aqds: Add USB EHCI support for ls1012aqds
Date: Thu, 14 Sep 2017 19:54:41 +0000
Message-ID: <VI1PR04MB20781CC22A5EDB904EF1D3259A6F0@VI1PR04MB2078.eurprd04.prod.outlook.com>
References: <1501148945-11775-1-git-send-email-yinbo.zhu@nxp.com>
Reply-To: York Sun <york.sun-3arQi8VN3Tc@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yinbo Zhu <yinbo.zhu-3arQi8VN3Tc@public.gmane.org>, "u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org" <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Andy Tang <andy.tang-3arQi8VN3Tc@public.gmane.org>, =?iso-8859-2?Q?Horia_Geant=E3?= <horia.geanta-3arQi8VN3Tc@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Mihai Emilian Bantea <mihai.bantea-3arQi8VN3Tc@public.gmane.org>, Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>, Gang Liu <gang.liu-3arQi8VN3Tc@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rajesh Bhagat <rajesh.bhagat-3arQi8VN3Tc@public.gmane.org>, Rajat Srivastava <rajat.srivastava-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 07/27/2017 03:05 AM, yinbo.zhu-3arQi8VN3Tc@public.gmane.org wrote:=0A=
> From: Rajesh Bhagat <rajesh.bhagat-3arQi8VN3Tc@public.gmane.org>=0A=
> =0A=
> Add USB EHCI support for ls1012aqds platform=0A=
> =0A=
> Signed-off-by: Rajat Srivastava <rajat.srivastava-3arQi8VN3Tc@public.gmane.org>=0A=
> Signed-off-by: Rajesh Bhagat <rajesh.bhagat-3arQi8VN3Tc@public.gmane.org>=0A=
> Signed-off-by: yinbo.zhu <yinbo.zhu-3arQi8VN3Tc@public.gmane.org>=0A=
> ---=0A=
>   arch/arm/include/asm/arch-fsl-layerscape/immap_lsch2.h | 1 +=0A=
>   include/configs/ls1012aqds.h                           | 2 ++=0A=
>   include/usb/ehci-ci.h                                  | 2 +-=0A=
>   3 files changed, 4 insertions(+), 1 deletion(-)=0A=
> =0A=
> diff --git a/arch/arm/include/asm/arch-fsl-layerscape/immap_lsch2.h b/arc=
h/arm/include/asm/arch-fsl-layerscape/immap_lsch2.h=0A=
> index 8ad199f..4afc338 100644=0A=
> --- a/arch/arm/include/asm/arch-fsl-layerscape/immap_lsch2.h=0A=
> +++ b/arch/arm/include/asm/arch-fsl-layerscape/immap_lsch2.h=0A=
> @@ -35,6 +35,7 @@=0A=
>   #define CONFIG_SYS_XHCI_USB1_ADDR		(CONFIG_SYS_IMMR + 0x01f00000)=0A=
>   #define CONFIG_SYS_XHCI_USB2_ADDR		(CONFIG_SYS_IMMR + 0x02000000)=0A=
>   #define CONFIG_SYS_XHCI_USB3_ADDR		(CONFIG_SYS_IMMR + 0x02100000)=0A=
> +#define CONFIG_SYS_EHCI_USB1_ADDR		(CONFIG_SYS_IMMR + 0x07600000)=0A=
>   #define CONFIG_SYS_PCIE1_ADDR			(CONFIG_SYS_IMMR + 0x2400000)=0A=
>   #define CONFIG_SYS_PCIE2_ADDR			(CONFIG_SYS_IMMR + 0x2500000)=0A=
>   #define CONFIG_SYS_PCIE3_ADDR			(CONFIG_SYS_IMMR + 0x2600000)=0A=
> diff --git a/include/configs/ls1012aqds.h b/include/configs/ls1012aqds.h=
=0A=
> index 5b8500b..55f2578 100644=0A=
> --- a/include/configs/ls1012aqds.h=0A=
> +++ b/include/configs/ls1012aqds.h=0A=
> @@ -115,6 +115,8 @@=0A=
>   =0A=
>   #ifdef CONFIG_HAS_FSL_DR_USB=0A=
>   #define CONFIG_USB_EHCI_FSL=0A=
> +#define CONFIG_USB_ULPI=0A=
> +#define CONFIG_USB_ULPI_VIEWPORT=0A=
>   #define CONFIG_EHCI_HCD_INIT_AFTER_RESET=0A=
>   #endif=0A=
>   =0A=
> diff --git a/include/usb/ehci-ci.h b/include/usb/ehci-ci.h=0A=
> index 847b698..cd3eb47 100644=0A=
> --- a/include/usb/ehci-ci.h=0A=
> +++ b/include/usb/ehci-ci.h=0A=
> @@ -156,7 +156,7 @@=0A=
>   #elif defined(CONFIG_MPC85xx)=0A=
>   #define CONFIG_SYS_FSL_USB1_ADDR CONFIG_SYS_MPC85xx_USB1_ADDR=0A=
>   #define CONFIG_SYS_FSL_USB2_ADDR CONFIG_SYS_MPC85xx_USB2_ADDR=0A=
> -#elif defined(CONFIG_ARCH_LS1021A)=0A=
> +#elif defined(CONFIG_LS102XA) || defined(CONFIG_ARCH_LS1012A)=0A=
=0A=
Please use CONFIG_ARCH_LS1021A, not CONFIG_LS102XA.=0A=
=0A=
York=0A=
=0A=
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
