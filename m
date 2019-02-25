From: Seiya Wang <seiya.wang@mediatek.com>
Subject: Re: [PATCH v1 2/2] clk: mediatek: correct cpu clock name for MT8173
 SoC
Date: Mon, 25 Feb 2019 14:14:15 +0800
Message-ID: <1551075255.1446.8.camel@mtksdccf07>
References: <20190211071555.31430-1-seiya.wang@mediatek.com>
         <20190211071555.31430-2-seiya.wang@mediatek.com>
         <155078662163.77512.15925700437277835877@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <155078662163.77512.15925700437277835877@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 2019-02-21 at 14:03 -0800, Stephen Boyd wrote:
> Quoting Seiya Wang (2019-02-10 23:15:55)
> > Change cpu clock name from ca57 to ca72 since MT8173 does use cortex-a72.
> > 
> > Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>
> > ---
> 
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> 
> I'm guessing I can't apply this patch because the define is renamed
> which would break older DTs. Another option would be to just add another
> define and mark the old define as deprecated and unsupported. Then I
> could apply the patch to clk tree.

Thank you so much for your advice. We will update the patches and resend
soon.
