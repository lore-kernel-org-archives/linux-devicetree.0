From: Mars Cheng <mars.cheng@mediatek.com>
Subject: Re: [PATCH 1/2] ndings: mediatek: Add bindings for mediatek MT6765
 Platform
Date: Wed, 13 Jun 2018 09:59:24 +0800
Message-ID: <1528855164.5296.9.camel@mtkswgap22>
References: <1528843243-29782-1-git-send-email-mars.cheng@mediatek.com>
         <1528843243-29782-2-git-send-email-mars.cheng@mediatek.com>
         <CAL_JsqJ3LjA3yG7UvD7FyhCxF60xWuu=c4uXLW1wD7MCLWuOPg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJ3LjA3yG7UvD7FyhCxF60xWuu=c4uXLW1wD7MCLWuOPg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, CC Hwang <cc.hwang@mediatek.com>, Loda Chou <loda.chou@mediatek.com>, Miles Chen <miles.chen@mediatek.com>, Jades Shih <jades.shih@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, My Chuang <my.chuang@mediatek.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com
List-Id: devicetree@vger.kernel.org

On Tue, 2018-06-12 at 18:51 -0600, Rob Herring wrote:
> On Tue, Jun 12, 2018 at 4:40 PM, Mars Cheng <mars.cheng@mediatek.com> wrote:
> > This adds dt-binding documentation for Mediatek MT6765. Only
> > include very basic items, gic, uart timer and cpu.
> 
> Check your subject...

Hi Rob

oops, my bad... will correct this in v2

> 
> >
> > Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/arm/mediatek.txt |    4 ++++
> >  .../interrupt-controller/mediatek,sysirq.txt       |    1 +
> >  .../devicetree/bindings/serial/mtk-uart.txt        |    1 +
> >  3 files changed, 6 insertions(+)
