From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 1/2] Documentation: DT: vdma: Add clock support for
 vdma
Date: Wed, 20 Apr 2016 07:27:36 -0700
Message-ID: <20160420142736.GO7128@xsjsorenbubuntu>
References: <1461152599-28858-1-git-send-email-appanad@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1461152599-28858-1-git-send-email-appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kedareswara rao Appana <appana.durga.rao-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, luis-HiykPkW1eAzzDCI4PIEvbQC/G2K4zDHf@public.gmane.org, anirudh-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, shubhraj-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2016-04-20 at 17:13:18 +0530, Kedareswara rao Appana wrote:
> This patch updates the binding doc with clock description
> for vdma.
>=20
> Signed-off-by: Kedareswara rao Appana <appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> ---
> Changes for v2:
> --> Listed down all the clocks supported by the h/w
>     as suggested by the Datta.
> --> Used IP clock names instead of shortcut clock names.
>=20
>  Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt | 8 +++=
+++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma=
=2Etxt b/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
> index fcc2b65..afe9eb7 100644
> --- a/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
> +++ b/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
> @@ -21,6 +21,11 @@ Required properties:
>  - dma-channel child node: Should have at least one channel and can h=
ave up to
>  	two channels per device. This node specifies the properties of each
>  	DMA channel (see child node properties below).
> +- clocks: Input clock specifier. Refer to common clock bindings.
> +- clock-names: List of input clocks "s_axi_lite_aclk", "m_axi_mm2s_a=
clk"
> +	       "m_axi_s2mm_aclk", "m_axis_mm2s_aclk", "s_axis_s2mm_aclk"
> +	       (list of input cloks may vary based on the ip configuration.

s/cloks/clocks

Acked-by: S=C3=B6ren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>

	S=C3=B6ren
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
