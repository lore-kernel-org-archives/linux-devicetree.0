From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v1 2/2] clk: mediatek: correct cpu clock name for MT8173
 SoC
Date: Thu, 21 Feb 2019 14:03:41 -0800
Message-ID: <155078662163.77512.15925700437277835877@swboyd.mtv.corp.google.com>
References: <20190211071555.31430-1-seiya.wang@mediatek.com>
 <20190211071555.31430-2-seiya.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190211071555.31430-2-seiya.wang@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, Seiya Wang <seiya.wang@mediatek.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Quoting Seiya Wang (2019-02-10 23:15:55)
> Change cpu clock name from ca57 to ca72 since MT8173 does use cortex-a72.
> 
> Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

I'm guessing I can't apply this patch because the define is renamed
which would break older DTs. Another option would be to just add another
define and mark the old define as deprecated and unsupported. Then I
could apply the patch to clk tree.
