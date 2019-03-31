From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: meson: Add drive-strength
 property
Date: Sun, 31 Mar 2019 09:04:08 +0200
Message-ID: <722ef39685fb3b519d09c00a3444708abd685f9d.camel@baylibre.com>
References: <20190314163725.7918-1-jbrunet@baylibre.com>
         <20190314163725.7918-2-jbrunet@baylibre.com> <20190330212830.GA28281@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190330212830.GA28281@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Guillaume La Roque <glaroque@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, 2019-03-31 at 01:40 -0500, Rob Herring wrote:
> On Thu, Mar 14, 2019 at 05:37:24PM +0100, Jerome Brunet wrote:
> > From: Guillaume La Roque <glaroque@baylibre.com>
> > 
> > Add optional drive-strength property
> > 
> > Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > ---
> >  Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
> > index a47dd990a8d3..4e3d5a27c91c 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
> > +++ b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
> > @@ -51,6 +51,9 @@ Configuration nodes support the generic properties "bias-disable",
> >  "bias-pull-up" and "bias-pull-down", described in file
> >  pinctrl-bindings.txt
> >  
> > +Optional properties :
> > + - drive-strength: Drive strength for the specified pins in uA.
> 
> The standard definition says this is in mA.

Yes, the problem we have and the solutions we are thinking about are explained
in detail in the cover letter of this patchset. Could you share your opinion
on it ?

Thx

> 
> > +
> >  === Example ===
> >  
> >  	pinctrl: pinctrl@c1109880 {
> > -- 
> > 2.20.1
> > 
