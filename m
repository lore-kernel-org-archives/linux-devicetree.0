From: Henry Chen <henryc.chen@mediatek.com>
Subject: Re: [RFC V2 09/11] dt-bindings: interconnect: Add header for
 interconnect node
Date: Mon, 19 Aug 2019 09:43:34 +0800
Message-ID: <1566179014.6371.10.camel@mtksdaap41>
References: <1556614265-12745-1-git-send-email-henryc.chen@mediatek.com>
         <1556614265-12745-10-git-send-email-henryc.chen@mediatek.com>
         <20190501202844.GA5092@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190501202844.GA5092@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Georgi Djakov <georgi.djakov@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <swboyd@chromium.org>, Nicolas Boichat <drinkcat@google.com>, Fan Chen <fan.chen@mediatek.com>, James Liao <jamesjj.liao@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 2019-05-01 at 15:28 -0500, Rob Herring wrote:
> On Tue, Apr 30, 2019 at 04:51:03PM +0800, Henry Chen wrote:
> > Add header file for mt8183 interconnect node that could be shared between
> > the interconeect provider driver and Device Tree source files.
> > 
> > Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
> > ---
> >  include/dt-bindings/interconnect/mtk,mt8183.h | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >  create mode 100644 include/dt-bindings/interconnect/mtk,mt8183.h
> 
> This goes with the binding patch.
ok, will merged into previous patch 08.
