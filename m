From: Sean Wang <sean.wang@mediatek.com>
Subject: Re: [PATCH v1 2/4] dt-bindings: clock: mediatek: add g3dsys bindings
Date: Thu, 19 Apr 2018 11:50:02 +0800
Message-ID: <1524109802.12959.10.camel@mtkswgap22>
References: <cover.1524044917.git.sean.wang@mediatek.com>
         <4b5d243d33433f83874359794b796d4228574714.1524044917.git.sean.wang@mediatek.com>
         <152410791532.46528.10083030894445315558@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <152410791532.46528.10083030894445315558@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: airlied@linux.ie, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, mark.rutland@arm.com, matthias.bgg@gmail.com, mturquette@baylibre.com, robh+dt@kernel.org, dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 2018-04-18 at 20:18 -0700, Stephen Boyd wrote:
> Quoting sean.wang@mediatek.com (2018-04-18 03:24:54)
> > From: Sean Wang <sean.wang@mediatek.com>
> > 
> > Add bindings to g3dsys providing necessary clock and reset control to
> > Mali-450.
> > 
> > Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> > ---
> >  .../bindings/arm/mediatek/mediatek,g3dsys.txt      | 30 ++++++++++++++++++++++
> 
> Why isn't this under bindings/clock/ ?
> 

Tons of bindings for clock controller have been present at
binding/arm/mediatek. g3dsys just have a follow-up to them.

It's worth another patch moving them all from bindings/arm/mediatek/ to
bindings/clock/mediatek.

what's your opinion for either doing it prior to g3dsys binding being
added or doing it in the future ?

> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
