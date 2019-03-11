From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 3/9] dt-bindings: mfd: Add compatible for the MediaTek
 MT6358 PMIC
Date: Mon, 11 Mar 2019 17:06:30 -0500
Message-ID: <20190311220630.GA4082@bogus>
References: <1552275991-34648-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1552275991-34648-4-git-send-email-hsin-hsiung.wang@mediatek.com>
 <CAGp9LzrWawWy+mX5VpLeqdV85f0iEdRv6JtJbjS5pamN5xfKjA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGp9LzrWawWy+mX5VpLeqdV85f0iEdRv6JtJbjS5pamN5xfKjA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Wang <sean.wang@kernel.org>
Cc: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, Lee Jones <lee.jones@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>, Eddie Huang <eddie.huang@mediatek.com>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, srv_heupstream <srv_heupstream@mediatek.com>, Alessandro Zummo <a.zummo@towertech.it>, Marc Zyngier <marc.zyngier@arm.com>, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, linux-mediatek@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 11, 2019 at 12:19:32PM -0700, Sean Wang wrote:
> Hi,
> 
> Always put the patches about dt-binding changes at the head of the
> series to let the related maintainer more easily find them.
> 
> On Sun, Mar 10, 2019 at 8:48 PM Hsin-Hsiung Wang
> <hsin-hsiung.wang@mediatek.com> wrote:
> >
> > This adds compatible for the MediaTek MT6358 PMIC.
> >
> > Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/mfd/mt6397.txt | 11 ++++++++---
> >  1 file changed, 8 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
> > index 0ebd08a..62f1c17 100644
> > --- a/Documentation/devicetree/bindings/mfd/mt6397.txt
> > +++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
> > @@ -17,22 +17,27 @@ Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
> >  This document describes the binding for MFD device and its sub module.
> >
> >  Required properties:
> > -compatible: "mediatek,mt6397" or "mediatek,mt6323"
> > +compatible:
> > +       "mediatek,mt6323" for PMIC MT6323
> > +       "mediatek,mt6358" for PMIC MT6358
> > +       "mediatek,mt6397" for PMIC MT6397
> 
> don't change anything not related MT6358

Reformatting like this is preferred.

Rob
