From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] QorIQ/TMU: add TMU node to device tree for QorIQ T104x
Date: Thu, 9 Apr 2015 22:55:40 -0500
Message-ID: <1428638140.22867.583.camel@freescale.com>
References: <1427782669-20368-1-git-send-email-hongtao.jia@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427782669-20368-1-git-send-email-hongtao.jia-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jia Hongtao <hongtao.jia-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2015-03-31 at 14:17 +0800, Jia Hongtao wrote:
> This is Thermal Monitoring Unit for QorIQ platform.
> 
> Signed-off-by: Jia Hongtao <hongtao.jia-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  .../devicetree/bindings/thermal/qoriq-thermal.txt  | 58 +++++++++++++++
>  arch/powerpc/boot/dts/fsl/qoriq-tmu-t104xsi.dtsi   | 82 ++++++++++++++++++++++
>  arch/powerpc/boot/dts/fsl/t1040si-post.dtsi        |  1 +
>  3 files changed, 141 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/thermal/qoriq-thermal.txt
>  create mode 100644 arch/powerpc/boot/dts/fsl/qoriq-tmu-t104xsi.dtsi
> 
> diff --git a/Documentation/devicetree/bindings/thermal/qoriq-thermal.txt b/Documentation/devicetree/bindings/thermal/qoriq-thermal.txt
> new file mode 100644
> index 0000000..dfc17fa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/thermal/qoriq-thermal.txt
> @@ -0,0 +1,58 @@
> +* Thermal Monitoring Unit (TMU) on Freescale QorIQ SoCs
> +
> +Required properties:
> +- compatible : "fsl,qoriq-tmu".

compatible: Must include "fsl,qoriq-tmu". The version of the device is
	    determined by the TMU IP Block Revision Register (IPBRR0)
	    at offset 0x0BF8.

	    Table of correspondences between IPBRR0 values and example  
	    chips:
		Value           Device
		-----------     -------
		0x01900102      T1040

> +- reg : address range of TMU registers.
> +- interrupts : should contain the interrupt for TMU.

s/should contain/contains/

> +- calibration : calibration table for TMU.

What is the format of the calibration table, and where does one get the
data?

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
