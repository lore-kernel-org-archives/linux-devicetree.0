From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [RESEND PATCH v4,1/3] media: dt-bindings: media: add
 'assigned-clocks' to vcodec examples
Date: Thu, 14 Feb 2019 08:33:32 +0100
Message-ID: <3f77d34a-a2a4-a2c1-a4e6-32669ff69357@xs4all.nl>
References: <1550111093-7057-1-git-send-email-yunfei.dong@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550111093-7057-1-git-send-email-yunfei.dong@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Yunfei Dong <yunfei.dong@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Rob Herring <robh+dt@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Qianqian Yan <qianqian.yan@mediatek.com>
List-Id: devicetree@vger.kernel.org

Hi Yunfei Dong,

Why is this series resent? Patches 1 and 3 have been merged in our
media master tree already.

Regards,

	Hans

On 2/14/19 3:24 AM, Yunfei Dong wrote:
> Fix MTK binding document for MT8173 dtsi changed in order
> to use standard CCF interface.
> MT8173 SoC from Mediatek.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Signed-off-by: Qianqian Yan <qianqian.yan@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/media/mediatek-vcodec.txt  |   13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> index 2a615d8..b6b5dde 100644
> --- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> +++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> @@ -66,6 +66,15 @@ vcodec_dec: vcodec@16000000 {
>                    "vencpll",
>                    "venc_lt_sel",
>                    "vdec_bus_clk_src";
> +    assigned-clocks = <&topckgen CLK_TOP_VENC_LT_SEL>,
> +                      <&topckgen CLK_TOP_CCI400_SEL>,
> +                      <&topckgen CLK_TOP_VDEC_SEL>,
> +                      <&apmixedsys CLK_APMIXED_VCODECPLL>,
> +                      <&apmixedsys CLK_APMIXED_VENCPLL>;
> +    assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL_370P5>,
> +                             <&topckgen CLK_TOP_UNIVPLL_D2>,
> +                             <&topckgen CLK_TOP_VCODECPLL>;
> +    assigned-clock-rates = <0>, <0>, <0>, <1482000000>, <800000000>;
>    };
>  
>    vcodec_enc: vcodec@18002000 {
> @@ -105,4 +114,8 @@ vcodec_dec: vcodec@16000000 {
>                    "venc_sel",
>                    "venc_lt_sel_src",
>                    "venc_lt_sel";
> +    assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>,
> +                      <&topckgen CLK_TOP_VENC_LT_SEL>;
> +    assigned-clock-parents = <&topckgen CLK_TOP_VENCPLL_D2>,
> +                             <&topckgen CLK_TOP_UNIVPLL1_D2>;
>    };
> 
