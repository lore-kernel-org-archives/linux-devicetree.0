From: Rob Herring <robh@kernel.org>
Subject: Re: [RFC V2 01/11] dt-bindings: soc: Add dvfsrc driver bindings
Date: Wed, 1 May 2019 15:25:04 -0500
Message-ID: <20190501202504.GA32615@bogus>
References: <1556614265-12745-1-git-send-email-henryc.chen@mediatek.com>
 <1556614265-12745-2-git-send-email-henryc.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1556614265-12745-2-git-send-email-henryc.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <swboyd@chromium.org>, Nicolas Boichat <drinkcat@google.com>, Fan Chen <fan.chen@mediatek.com>, James Liao <jamesjj.liao@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Henry Chen <henryc.chen@mediatek.com>
List-Id: devicetree@vger.kernel.org

On Tue, 30 Apr 2019 16:50:55 +0800, Henry Chen wrote:
> Document the binding for enabling dvfsrc on MediaTek SoC.
> 
> Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
> ---
>  .../devicetree/bindings/soc/mediatek/dvfsrc.txt    | 23 ++++++++++++++++++++++
>  include/dt-bindings/soc/mtk,dvfsrc.h               | 14 +++++++++++++
>  2 files changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/dvfsrc.txt
>  create mode 100644 include/dt-bindings/soc/mtk,dvfsrc.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
