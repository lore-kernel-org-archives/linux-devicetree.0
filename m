From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v6 3/4] dt-bindings: arm: fsl: Add Kontron i.MX6UL N6310 compatibles
Date: Thu, 22 Aug 2019 15:45:12 +0200
Message-ID: <CAJKOXPc6UNMszVr+fRdLtPxj0GFVrwJ7JqyGrzXz+MC=fY7gUA@mail.gmail.com>
References: <1566315318-30320-1-git-send-email-krzk@kernel.org>
 <1566315318-30320-3-git-send-email-krzk@kernel.org> <CAL_JsqJLSZ50tdFcdPFc2ifcDoFZFuw=SoKsunzjtAhZ-11fBg@mail.gmail.com>
 <CAJKOXPfkNcWw9sunwXGRz42jOL0cdRC-iiHLtWCYvo5oxCMwFQ@mail.gmail.com>
 <CAL_JsqKAH6n1sMoWOhfiHKxgREr-EN1tw0QtC1H8Fm=a7PNzOA@mail.gmail.com>
 <20190820202142.GA15866@kozik-lap> <CAL_JsqKBWB2FiVjYo9O7DPw1JYJvan7uRgbR0VBG=FfHDVYdZQ@mail.gmail.com>
 <20190821175458.GA25168@kozik-lap> <CAL_Jsq+YZ9KdCCT1grtpf7Z1o=-mFuq3O=o7iVGSAhJYO1-=Ww@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+YZ9KdCCT1grtpf7Z1o=-mFuq3O=o7iVGSAhJYO1-=Ww@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Schrempf Frieder <frieder.schrempf@kontron.de>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, 22 Aug 2019 at 14:52, Rob Herring <robh+dt@kernel.org> wrote:
>
> On Wed, Aug 21, 2019 at 12:55 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > On Tue, Aug 20, 2019 at 03:27:39PM -0500, Rob Herring wrote:
> > > > I see. If I understand the schema correctly, this should look like:
> > >
> > > Looks correct, but a couple of comments.
> > >
> > > > diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> > > > index 7294ac36f4c0..eb263d1ccf13 100644
> > > > --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> > > > +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> > > > @@ -161,6 +161,22 @@ properties:
> > > >          items:
> > > >            - enum:
> > > >                - fsl,imx6ul-14x14-evk      # i.MX6 UltraLite 14x14 EVK Board
> > > > +              - kontron,imx6ul-n6310-som  # Kontron N6310 SOM
> > >
> > > Is the SOM ever used alone? If not, then no point in listing this here.
> >
> > SoM alone: no, because it requires some type of base board. However it
> > will be used by some customer designs with some amount of
> > changes/addons.
> >
> > Looking at other aproaches, usually SoMs have their own compatible.  In
> > such case - I should document it somewhere.
>
> I wasn't suggesting not having the compatible for it, but you don't
> need it in this list because that is not valid. You have to list it
> with the base board compatibles.

The diff against v7 would be like this then:
---
diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml
b/Documentation/devicetree/bindings/arm/fsl.yaml
index 1f440817fc03..7219c15f6185 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -161,7 +161,6 @@ properties:
         items:
           - enum:
               - fsl,imx6ul-14x14-evk      # i.MX6 UltraLite 14x14 EVK Board
-              - kontron,imx6ul-n6310-som  # Kontron N6310 SOM
           - const: fsl,imx6ul

       - description: Kontron N6310 S Board
---

This passes the dtbs_check.

I'll send v8
