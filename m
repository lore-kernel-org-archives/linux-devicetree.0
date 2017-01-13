From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: mt8173: Fix cpu_thermal cooling-maps
 contributions
Date: Fri, 13 Jan 2017 16:36:17 +0100
Message-ID: <ac6266a7-b540-8fdd-7ece-ef4871cceaae@gmail.com>
References: <20170113023006.150845-1-djkurtz@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170113023006.150845-1-djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Dawei Chien <dawei.chien-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Javi Merino <javi.merino-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Andrew-CT Chen <andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yong Wu <yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel-IAPFreCvJWPdpHbCvnp+Ag@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 13/01/17 03:30, Daniel Kurtz wrote:
> According to [0], the contribution field for each cooling-device express
> their relative power efficiency. Higher weights express higher power
> efficiency.  Weighting is relative such that if each cooling device has a
> weight of 1 they are considered equal. This is particularly useful in
> heterogeneous systems where two cooling devices may perform the same kind
> of compute, but with different efficiency.
>
> [0] Documentation/thermal/power_allocator.txt
>
> According to Mediatek IC designer, the power efficiency ratio between the
> LITTLE core cluster (cooling-device cpu0) and big core cluster
> (cooling-device cpu1) is around 3:1 (3072:1024).
>
> Signed-off-by: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

applied, thanks.

> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> index 12e702771f5c..9a3b0d20f7a8 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -182,12 +182,12 @@
>  				map@0 {
>  					trip = <&target>;
>  					cooling-device = <&cpu0 0 0>;
> -					contribution = <1024>;
> +					contribution = <3072>;
>  				};
>  				map@1 {
>  					trip = <&target>;
>  					cooling-device = <&cpu2 0 0>;
> -					contribution = <2048>;
> +					contribution = <1024>;
>  				};
>  			};
>  		};
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
