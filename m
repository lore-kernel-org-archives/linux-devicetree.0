From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 01/17] dt-bindings: vendor-prefixes: Add PLX Technology
Date: Fri, 4 Mar 2016 22:29:32 -0600
Message-ID: <20160305042932.GX13525@rob-hp-laptop>
References: <1457005210-18485-1-git-send-email-narmstrong@baylibre.com>
 <1457005210-18485-2-git-send-email-narmstrong@baylibre.com>
 <1457017335.3425.72.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1457017335.3425.72.camel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>, Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 03, 2016 at 04:02:15PM +0100, Philipp Zabel wrote:
> Am Donnerstag, den 03.03.2016, 12:39 +0100 schrieb Neil Armstrong:
> > Add PLX Technology vendor prefix.
> > 
> > Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> > index 72e2c5a..03970fb 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> > @@ -178,6 +178,7 @@ picochip	Picochip Ltd
> >  plathome	Plat'Home Co., Ltd.
> >  plda	PLDA
> >  pixcir  PIXCIR MICROELECTRONICS Co., Ltd
> > +plxtech	PLX Technology, Inc.
> 
> The PLX Technology NASDAQ symbol used to be PLXT.

And is no longer listed? If not, then plxtech is fine. Otherwise, use 
plxt.

Can you fix the alphabetizing while you are at it.

Rob
