From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] powerpc/mpc85xx: Add pcsphy nodes to FManV3 device tree
Date: Mon, 21 Dec 2015 08:40:33 -0600
Message-ID: <1450708833.18314.35.camel@freescale.com>
References: <1450655851-6556-1-git-send-email-igal.liberman@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1450655851-6556-1-git-send-email-igal.liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: igal.liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: madalin.bucur-KZfg59tc24xl57MIdRCFDg@public.gmane.org, shaohui.xie-KZfg59tc24xl57MIdRCFDg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 2015-12-21 at 01:57 +0200, igal.liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org wrote:
> From: Igal Liberman <igal.liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> 
> Signed-off-by: Igal Liberman <igal.liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> 
> This patch adds pcsphy node to FManV3 device tree.
> Based on: https://patchwork.ozlabs.org/patch/503921/
> ---
>  .../dts/fsl/qoriq-fman3-0-10g-0-best-effort.dtsi   |    5 +++++
>  arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-0.dtsi |    5 +++++
>  .../dts/fsl/qoriq-fman3-0-10g-1-best-effort.dtsi   |    5 +++++
>  arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-1.dtsi |    5 +++++
>  arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-0.dtsi  |    5 +++++
>  arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-1.dtsi  |    5 +++++
>  arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-2.dtsi  |    5 +++++
>  arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-3.dtsi  |    5 +++++
>  arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-4.dtsi  |    5 +++++
>  arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-5.dtsi  |    5 +++++
>  arch/powerpc/boot/dts/fsl/qoriq-fman3-1-10g-0.dtsi |    5 +++++
>  arch/powerpc/boot/dts/fsl/qoriq-fman3-1-10g-1.dtsi |    5 +++++
>  arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-0.dtsi  |    5 +++++
>  arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-1.dtsi  |    5 +++++
>  arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-2.dtsi  |    5 +++++
>  arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-3.dtsi  |    5 +++++
>  arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-4.dtsi  |    5 +++++
>  arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-5.dtsi  |    5 +++++
>  18 files changed, 90 insertions(+)

Binding?

-Scott
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
