From: Sean Wang <sean.wang@mediatek.com>
Subject: Re: [PATCH v2 29/30] dt-bindings: add vendor prefix for bananapi
Date: Mon, 1 May 2017 14:58:00 +0800
Message-ID: <1493621880.32195.13.camel@mtkswgap22>
References: <1493198774-4478-1-git-send-email-sean.wang@mediatek.com>
         <1493198774-4478-30-git-send-email-sean.wang@mediatek.com>
         <20170428203727.m6jm5w6nb2iirxih@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20170428203727.m6jm5w6nb2iirxih@rob-hp-laptop>
Sender: linux-gpio-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: matthias.bgg@gmail.com, john@phrozen.org, mark.rutland@arm.com, linux@armlinux.org.uk, linus.walleij@linaro.org, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 2017-04-28 at 15:37 -0500, Rob Herring wrote:
> On Wed, Apr 26, 2017 at 05:26:13PM +0800, sean.wang@mediatek.com wrote:
> > From: Sean Wang <sean.wang@mediatek.com>
> > 
> > Banana Pi team in Sinovoip Co., Limited which are dedicated to
> > design and manufacture open hardware product.
> > 
> > Website: http://www.banana-pi.org/
> > 
> > Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> > index ec0bfb9..8ca0f3c 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> > @@ -44,6 +44,7 @@ avia	avia semiconductor
> >  avic	Shanghai AVIC Optoelectronics Co., Ltd.
> >  axentia	Axentia Technologies AB
> >  axis	Axis Communications AB
> > +bananapi Banana Pi SINOVOP CO., LIMITED
> 
> s/SINOVOP/SINOVOIP/ 

Hi Rob,

thanks for your careful reviewing , i will correct it in the next
version.

BTW, Could those related dts changes go through your tree if everything
looks good? Because I find Matthias have been inactive for a while and
the latest branch in his tree seems still staying on 4.10.

	Sean

> 
> >  boe	BOE Technology Group Co., Ltd.
> >  bosch	Bosch Sensortec GmbH
> >  boundary	Boundary Devices Inc.
> > -- 
> > 1.9.1
> > 


