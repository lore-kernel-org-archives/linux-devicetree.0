From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 07/12] dt-bindings: clock: mediatek: delete mmsys
 clocks
Date: Fri, 16 Nov 2018 17:07:33 -0600
Message-ID: <20181116230733.GA17794@bogus>
References: <20181116125449.23581-1-matthias.bgg@kernel.org>
 <20181116125449.23581-8-matthias.bgg@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181116125449.23581-8-matthias.bgg@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: matthias.bgg@kernel.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, ck.hu@mediatek.com, p.zabel@pengutronix.de, airlied@linux.ie, mturquette@baylibre.com, sboyd@codeaurora.org, ulrich.hecht+renesas@gmail.com, laurent.pinchart@ideasonboard.com, matthias.bgg@gmail.com, sean.wang@mediatek.com, sean.wang@kernel.org, rdunlap@infradead.org, wens@csie.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Matthias Brugger <mbrugger@suse.com>
List-Id: devicetree@vger.kernel.org

On Fri, 16 Nov 2018 13:54:44 +0100, matthias.bgg@kernel.org wrote:
> From: Matthias Brugger <mbrugger@suse.com>
> 
> Some SoCs will now load the clock part of mmsys via
> a platform device from the dsiplay driver.
> Remove the compatible from the clock bindings description.
> 
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> ---
>  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.txt        | 3 ---
>  1 file changed, 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
