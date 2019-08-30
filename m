From: Henry Chen <henryc.chen@mediatek.com>
Subject: Re: [PATCH V3 01/10] dt-bindings: soc: Add dvfsrc driver bindings
Date: Fri, 30 Aug 2019 13:26:38 +0800
Message-ID: <1567142798.5542.5.camel@mtksdaap41>
References: <1566995328-15158-1-git-send-email-henryc.chen@mediatek.com>
         <1566995328-15158-2-git-send-email-henryc.chen@mediatek.com>
         <20190829191631.GA15714@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190829191631.GA15714@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <swboyd@chromium.org>, Ryan Case <ryandcase@chromium.org>, Nicolas Boichat <drinkcat@google.com>, Fan Chen <fan.chen@mediatek.com>, James Liao <jamesjj.liao@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 2019-08-29 at 14:16 -0500, Rob Herring wrote:
> On Wed, 28 Aug 2019 20:28:39 +0800, Henry Chen wrote:
> > Document the binding for enabling dvfsrc on MediaTek SoC.
> > 
> > Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
> > ---
> >  .../devicetree/bindings/soc/mediatek/dvfsrc.txt    | 23 ++++++++++++++++++++++
> >  include/dt-bindings/soc/mtk,dvfsrc.h               | 14 +++++++++++++
> >  2 files changed, 37 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/dvfsrc.txt
> >  create mode 100644 include/dt-bindings/soc/mtk,dvfsrc.h
> > 
> 
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
> 
> If a tag was not added on purpose, please state why and what changed.

Hi Rob,

I'm sorry for the mistake. I stand corrected, and will add tags on next
version.

Henry
