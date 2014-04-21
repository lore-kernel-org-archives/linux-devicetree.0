From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 5/6] powerpc/corenet: Add DPAA FMan support to the SoC
 device tree(s)
Date: Mon, 21 Apr 2014 17:14:02 -0500
Message-ID: <1398118442.1694.190.camel@snotra.buserror.net>
References: <1397823693-27977-1-git-send-email-Shruti@Freescale.com>
	 <1397823693-27977-5-git-send-email-Shruti@Freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397823693-27977-5-git-send-email-Shruti-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shruti Kanetkar <Shruti-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 2014-04-18 at 07:21 -0500, Shruti Kanetkar wrote:
> FMan 1 Gb/s MACs (dTSEC and mEMAC) have support for SGMII PHYs.
> Add support for the internal SerDes TBI PHYs
> 
> Based on prior work by Andy Fleming <afleming-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> Signed-off-by: Shruti Kanetkar <Shruti-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
> ---
>  arch/powerpc/boot/dts/fsl/b4860si-post.dtsi |  28 +++++
>  arch/powerpc/boot/dts/fsl/b4si-post.dtsi    |  51 +++++++++
>  arch/powerpc/boot/dts/fsl/p1023si-post.dtsi |  14 +++
>  arch/powerpc/boot/dts/fsl/p2041si-post.dtsi |  64 ++++++++++++
>  arch/powerpc/boot/dts/fsl/p3041si-post.dtsi |  64 ++++++++++++
>  arch/powerpc/boot/dts/fsl/p4080si-post.dtsi | 104 +++++++++++++++++++
>  arch/powerpc/boot/dts/fsl/p5020si-post.dtsi |  64 ++++++++++++
>  arch/powerpc/boot/dts/fsl/p5040si-post.dtsi | 128 +++++++++++++++++++++++
>  arch/powerpc/boot/dts/fsl/t4240si-post.dtsi | 154 ++++++++++++++++++++++++++++
>  9 files changed, 671 insertions(+)
> 
> diff --git a/arch/powerpc/boot/dts/fsl/b4860si-post.dtsi b/arch/powerpc/boot/dts/fsl/b4860si-post.dtsi
> index cbc354b..45b0ff5 100644
> --- a/arch/powerpc/boot/dts/fsl/b4860si-post.dtsi
> +++ b/arch/powerpc/boot/dts/fsl/b4860si-post.dtsi
> @@ -172,6 +172,34 @@
>  		compatible = "fsl,b4860-rcpm", "fsl,qoriq-rcpm-2.0";
>  	};
>  
> +/include/ "qoriq-fman3-0-1g-4.dtsi"
> +/include/ "qoriq-fman3-0-1g-5.dtsi"
> +/include/ "qoriq-fman3-0-10g-0.dtsi"
> +/include/ "qoriq-fman3-0-10g-1.dtsi"
> +	fman@400000 {
> +		ethernet@e8000 {
> +			tbi-handle = <&tbi4>;
> +		};

Binding needed

Where is the "reg" for these unit addresses?

> +		mdio@e9000 {
> +			tbi4: tbi-phy@8 {
> +				reg = <0x8>;
> +				device_type = "tbi-phy";
> +			};
> +		};

Binding needed for tbi-phy device_type.  Why are we using device_type at
all for this?

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
