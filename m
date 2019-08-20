From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v6 3/4] dt-bindings: arm: fsl: Add Kontron i.MX6UL N6310
 compatibles
Date: Tue, 20 Aug 2019 22:21:42 +0200
Message-ID: <20190820202142.GA15866@kozik-lap>
References: <1566315318-30320-1-git-send-email-krzk@kernel.org>
 <1566315318-30320-3-git-send-email-krzk@kernel.org>
 <CAL_JsqJLSZ50tdFcdPFc2ifcDoFZFuw=SoKsunzjtAhZ-11fBg@mail.gmail.com>
 <CAJKOXPfkNcWw9sunwXGRz42jOL0cdRC-iiHLtWCYvo5oxCMwFQ@mail.gmail.com>
 <CAL_JsqKAH6n1sMoWOhfiHKxgREr-EN1tw0QtC1H8Fm=a7PNzOA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqKAH6n1sMoWOhfiHKxgREr-EN1tw0QtC1H8Fm=a7PNzOA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Schrempf Frieder <frieder.schrempf@kontron.de>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 20, 2019 at 03:04:57PM -0500, Rob Herring wrote:
> On Tue, Aug 20, 2019 at 1:36 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > On Tue, 20 Aug 2019 at 18:59, Rob Herring <robh+dt@kernel.org> wrote:
> > >
> > > On Tue, Aug 20, 2019 at 10:35 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > >
> > > > Add the compatibles for Kontron i.MX6UL N6310 SoM and boards.
> > > >
> > > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > > >
> > > > ---
> > > >
> > > > Changes since v5:
> > > > New patch
> > > > ---
> > > >  Documentation/devicetree/bindings/arm/fsl.yaml | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> > > > index 7294ac36f4c0..d07b3c06d7cf 100644
> > > > --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> > > > +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> > > > @@ -161,6 +161,9 @@ properties:
> > > >          items:
> > > >            - enum:
> > > >                - fsl,imx6ul-14x14-evk      # i.MX6 UltraLite 14x14 EVK Board
> > > > +              - kontron,imx6ul-n6310-som  # Kontron N6310 SOM
> > > > +              - kontron,imx6ul-n6310-s    # Kontron N6310 S Board
> > > > +              - kontron,imx6ul-n6310-s-43 # Kontron N6310 S 43 Board
> > >
> > > This doesn't match what is in your dts files. Run 'make dtbs_check' and see.
> >
> > You mean the name does not match? I thought that '#' is a comment in YAML...
> 
> No, the number of compatible strings is the problem.

I see. If I understand the schema correctly, this should look like:

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 7294ac36f4c0..eb263d1ccf13 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -161,6 +161,22 @@ properties:
         items:
           - enum:
               - fsl,imx6ul-14x14-evk      # i.MX6 UltraLite 14x14 EVK Board
+              - kontron,imx6ul-n6310-som  # Kontron N6310 SOM
+          - const: fsl,imx6ul
+
+      - description: Kontron N6310 S Board
+        items:
+          - enum:
+              - kontron,imx6ul-n6310-s
+          - const: kontron,imx6ul-n6310-som
+          - const: fsl,imx6ul
+
+      - description: Kontron N6310 S 43 Board
+        items:
+          - enum:
+              - kontron,imx6ul-n6310-s-43
+          - const: kontron,imx6ul-n6310-s
+          - const: kontron,imx6ul-n6310-som
           - const: fsl,imx6ul

       - description: i.MX6ULL based Boards


It passes the dtbs_check. Is it correct?

Best regards,
Krzysztof
