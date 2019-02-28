From: Seiya Wang <seiya.wang@mediatek.com>
Subject: Re: [PATCH v2 2/2] clk: mediatek: correct cpu clock name for MT8173
 SoC
Date: Thu, 28 Feb 2019 10:03:37 +0800
Message-ID: <1551319417.3477.0.camel@mtksdccf07>
References: <20190225065112.3400-1-seiya.wang@mediatek.com>
         <20190225065112.3400-2-seiya.wang@mediatek.com>
         <155120509627.260864.5936412356126577519@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <155120509627.260864.5936412356126577519@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 2019-02-26 at 10:18 -0800, Stephen Boyd wrote:
> Quoting Seiya Wang (2019-02-24 22:51:12)
> > diff --git a/include/dt-bindings/clock/mt8173-clk.h b/include/dt-bindings/clock/mt8173-clk.h
> > index 8aea623dd518..76e4e5b65353 100644
> > --- a/include/dt-bindings/clock/mt8173-clk.h
> > +++ b/include/dt-bindings/clock/mt8173-clk.h
> > @@ -194,7 +194,8 @@
> >  #define CLK_INFRA_PMICWRAP             11
> >  #define CLK_INFRA_CLK_13M              12
> >  #define CLK_INFRA_CA53SEL               13
> > -#define CLK_INFRA_CA57SEL               14
> > +#define CLK_INFRA_CA57SEL               14 /* Deprecated. Don't use it. */
> > +#define CLK_INFRA_CA72SEL               14
> 
> Also, please send a followup patch to remove the deprecated define later
> when the dts file is fixed up.
> 

Sure. Thank you so much~
