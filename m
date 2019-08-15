From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: Add PHYTEC i.MX6 UL/ULL
 devicetree bindings
Date: Thu, 15 Aug 2019 07:43:56 -0600
Message-ID: <CAL_JsqJHfVDfpC9Yr7o3HO4wU7QR+sp0mxFLkxwVcGXXLeAyJw@mail.gmail.com>
References: <1563954573-370205-1-git-send-email-s.riedmueller@phytec.de>
 <20190813160448.GA27548@bogus> <073f9466-9dd3-a22c-e000-e9f4c60f90a0@phytec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <073f9466-9dd3-a22c-e000-e9f4c60f90a0@phytec.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Stefan_Riedm=C3=BCller?= <s.riedmueller@phytec.de>
Cc: "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, Andrew Smirnov <andrew.smirnov@gmail.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, NXP Linux Team <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 15, 2019 at 4:55 AM Stefan Riedm=C3=BCller
<s.riedmueller@phytec.de> wrote:
>
> Hi Rob,
>
> On 13.08.19 18:04, Rob Herring wrote:
> > On Wed, Jul 24, 2019 at 09:49:32AM +0200, Stefan Riedmueller wrote:
> >> Add devicetree bindings for i.MX6 UL/ULL based phyCORE-i.MX6 UL/ULL an=
d
> >> phyBOARD-Segin.
> >>
> >> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
> >> ---
> >>   Documentation/devicetree/bindings/arm/fsl.yaml | 8 ++++++++
> >>   1 file changed, 8 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Document=
ation/devicetree/bindings/arm/fsl.yaml
> >> index 7294ac36f4c0..40f007859092 100644
> >> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> >> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> >> @@ -161,12 +161,20 @@ properties:
> >>           items:
> >>             - enum:
> >>                 - fsl,imx6ul-14x14-evk      # i.MX6 UltraLite 14x14 EV=
K Board
> >> +              - phytec,imx6ul-pbacd10     # PHYTEC phyBOARD-Segin wit=
h i.MX6 UL
> >> +              - phytec,imx6ul-pbacd10-emmc  # PHYTEC phyBOARD-Segin e=
MMC Kit
> >> +              - phytec,imx6ul-pbacd10-nand  # PHYTEC phyBOARD-Segin N=
AND Kit
> >> +              - phytec,imx6ul-pcl063      # PHYTEC phyCORE-i.MX 6UL
> >
> > This doesn't match what is in the dts files:
> >
> > arch/arm/boot/dts/imx6ul-phytec-pcl063.dtsi:    compatible =3D "phytec,=
imx6ul-pcl063", "fsl,imx6ul";
> > arch/arm/boot/dts/imx6ul-phytec-phyboard-segin-full.dts:      compatibl=
e =3D "phytec,imx6ul-pbacd10", "phytec,imx6ul-pcl063",
> > "fsl,imx6ul";
> > arch/arm/boot/dts/imx6ul-phytec-phyboard-segin.dtsi:    compatible =3D =
"phytec,imx6ul-pbacd-10", "phytec,imx6ul-pcl063",
> > "fsl,imx6ul";
>
> Shawn already applied my patches which rename the compatibles, see
> https://lkml.org/lkml/2019/7/23/42

In any case, it still doesn't match. For example, from those patches:

+ model =3D "PHYTEC phyBOARD-Segin i.MX6 ULL Full Featured with eMMC";
+ compatible =3D "phytec,imx6ull-pbacd10-emmc", "phytec,imx6ull-pbacd10",
+     "phytec,imx6ull-pcl063","fsl,imx6ull";

The correct schema for this would be:

items:
  - const: phytec,imx6ull-pbacd10-emmc
  - const: phytec,imx6ull-pbacd10
  - const: phytec,imx6ull-pcl063
  - const: fsl,imx6ull

This defines how many entries (4), what they are, and the order of
them. Maybe the first entry can be an enum with the -nand compatible
if those are 2 options.

Run 'make dtbs_check' and make sure there aren't warnings for the root node=
.

Rob
