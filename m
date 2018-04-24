From: Sean Wang <sean.wang@mediatek.com>
Subject: Re: [PATCH v1 3/4] clk: mediatek: add g3dsys support for MT2701 and
 MT7623
Date: Tue, 24 Apr 2018 23:43:22 +0800
Message-ID: <1524584602.12322.16.camel@mtkswgap22>
References: <cover.1524044917.git.sean.wang@mediatek.com>
         <96dc02879c10388c2efa08b1cf33b77f938908ee.1524044917.git.sean.wang@mediatek.com>
         <20180424144009.b66sxo3okjvsr4yc@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180424144009.b66sxo3okjvsr4yc@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, airlied@linux.ie, matthias.bgg@gmail.com, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 2018-04-24 at 09:40 -0500, Rob Herring wrote:
> On Wed, Apr 18, 2018 at 06:24:55PM +0800, sean.wang@mediatek.com wrote:
> > From: Sean Wang <sean.wang@mediatek.com>
> > 
> > Add clock driver support for g3dsys on MT2701 and MT7623, which is
> > providing essential clock gate and reset controller to Mali-450.
> > 
> > Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> > ---
> >  drivers/clk/mediatek/Kconfig              |  6 ++
> >  drivers/clk/mediatek/Makefile             |  1 +
> >  drivers/clk/mediatek/clk-mt2701-g3d.c     | 95 +++++++++++++++++++++++++++++++
> 
> >  include/dt-bindings/clock/mt2701-clk.h    |  4 ++
> >  include/dt-bindings/reset/mt2701-resets.h |  3 +
> 
> These below in the binding patch.
> 

Thanks, I will split them out in the next version.

> >  5 files changed, 109 insertions(+)
> >  create mode 100644 drivers/clk/mediatek/clk-mt2701-g3d.c
