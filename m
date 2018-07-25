Return-Path: <SRS0=N8v/=KJ=mediatek.com=yong.wu@kernel.org>
Message-ID: <1532509635.22373.6.camel@mhfsdcap03>
Subject: Re: [PATCH v5 07/11] soc: mediatek: add MT6765 subdomain support
From: Yong Wu <yong.wu@mediatek.com>
Date: Wed, 25 Jul 2018 17:07:15 +0800
In-Reply-To: <ce7724590f4e4551be88b76a7355738c@MTKMBS31N1.mediatek.inc>
References: <1531817552-17221-1-git-send-email-mars.cheng@mediatek.com>
	 <1531817552-17221-8-git-send-email-mars.cheng@mediatek.com>
	 <ce7724590f4e4551be88b76a7355738c@MTKMBS31N1.mediatek.inc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
To: Mars Cheng <Mars.Cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, "; Rob Herring" <robh+dt@kernel.org>, "; Marc Zyngier" <marc.zyngier@arm.com>, Ryder, Stephen, "Sean Wang =?UTF-8?Q?=28=E7=8E=8B=E5=BF=97=E4=BA=98=29?=  <sean.wang@mediatek.com>, ;devicetree@vger.kernel.org; CC Hwang =?UTF-8?Q?=28S=E8=87=B4=29?=" <cc.hwang@mediatek.com>, "; wsd_upstream" <wsd_upstream@mediatek.com>, "; Loda Chou =?UTF-8?Q?=28=E5=91=A8=E5=AE=8F=E9=9C=96=29?= " <Loda.Chou@mediatek.com>, "; linux-kernel@vger.kernel.org;" linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org, "Owen Chen =?UTF-8?Q?=28=E5=B3=BB=E6=96=8C=29?=  <owen.chen@mediatek.com>," <"; linux-clk"@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Mars,

> -----Original Message-----
> From: Linux-mediatek [mailto:linux-mediatek-bounces@lists.infradead.org] On Behalf Of Mars Cheng
> Sent: Tuesday, July 17, 2018 4:52 PM
> To: Matthias Brugger <matthias.bgg@gmail.com>; Rob Herring <robh+dt@kernel.org>; Marc Zyngier <marc.zyngier@arm.com>; Ryder Lee (李庚V) <Ryder.Lee@mediatek.com>; Stephen Boyd <sboyd@kernel.org>; Sean Wang (王志亘) <sean.wang@mediatek.com>
> Cc: devicetree@vger.kernel.org; CC Hwang (S致) <cc.hwang@mediatek.com>; wsd_upstream <wsd_upstream@mediatek.com>; Loda Chou (周宏霖) <Loda.Chou@mediatek.com>; linux-kernel@vger.kernel.org; linux-mediatek@lists.infradead.org; linux-serial@vger.kernel.org; Mars Cheng (森友) <Mars.Cheng@mediatek.com>; Owen Chen (峻斌) <owen.chen@mediatek.com>; linux-clk@vger.kernel.org; linux-arm-kernel@lists.infradead.org
> Subject: [PATCH v5 07/11] soc: mediatek: add MT6765 subdomain support
> 
> add extend data, parent_n for domain-subdomain corresponse.
> 
> Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
> Signed-off-by: Owen Chen <owen.chen@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-scpsys-ext.c |  132 ++++++++++++++++++++++++++++++++-
>  1 file changed, 131 insertions(+), 1 deletion(-)
> 
[...]
> +
> +#define SMI_COMMON_SMI_CLAMP_MT6765		0x03C0
> +#define SMI_COMMON_SMI_CLAMP_SET_MT6765	0x03C4
> +#define SMI_COMMON_SMI_CLAMP_CLR_MT6765	0x03C8

  From my understanding, this smi register could clamp the dummy
commands after the larb power down for the sake of safe,
is it right?

   If it's yes, I guess we could put this in the larb device's
runtime_resume/runtime_suspend callback.
   we can enable the clamp in the larb's runtime_suspend and clear it in
the larb's runtime_resume.

   then we don't need add "syscon" for smi-common node.

   please tell me if I miss something.

   Thanks.

> +
[...]
> 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
