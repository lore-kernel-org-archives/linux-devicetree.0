From: Leo Li <leoyang.li@nxp.com>
Subject: RE: [PATCH v2 2/3] dt-bindings: arm: fsl: Add devicetree binding for
 Oxalis
Date: Mon, 21 Jan 2019 19:57:20 +0000
Message-ID: <AM6PR04MB5863AE2A3DD74882BEC680CA8F9F0@AM6PR04MB5863.eurprd04.prod.outlook.com>
References: <20190114102053.16013-1-manivannan.sadhasivam@linaro.org>
 <20190114102053.16013-3-manivannan.sadhasivam@linaro.org>
 <CAL_JsqJpRPrCpRTpqh1v6JZwpEtZnaeuLTHR+0EiMSoxbk9zeQ@mail.gmail.com>
 <20190116022100.GC15808@dragon>
 <CAL_Jsq+myeZ1n4X=KhHZjtPDHnGH=L65xxYbzMrt8Rq6Bur4Bg@mail.gmail.com>
 <20190116101441.GH15808@dragon> <20190121060950.GA8713@Mani-XPS-13-9360>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190121060950.GA8713@Mani-XPS-13-9360>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "a.tropschug@ebs-systart.com" <a.tropschug@ebs-systart.com>, "m.bittner@ebs-systart.com" <m.bittner@ebs-systart.com>, Amit Kucheria <amit.kucheria@linaro.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Sent: Monday, January 21, 2019 12:10 AM
> To: Shawn Guo <shawnguo@kernel.org>; Rob Herring <robh+dt@kernel.org>
> Cc: Leo Li <leoyang.li@nxp.com>; moderated list:ARM/FREESCALE IMX / MXC
> ARM ARCHITECTURE <linux-arm-kernel@lists.infradead.org>;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
> a.tropschug@ebs-systart.com; m.bittner@ebs-systart.com; Amit Kucheria
> <amit.kucheria@linaro.org>
> Subject: Re: [PATCH v2 2/3] dt-bindings: arm: fsl: Add devicetree binding=
 for
> Oxalis
>=20
> On Wed, Jan 16, 2019 at 06:14:43PM +0800, Shawn Guo wrote:
> > On Tue, Jan 15, 2019 at 10:07:12PM -0600, Rob Herring wrote:
> > > On Tue, Jan 15, 2019 at 8:21 PM Shawn Guo <shawnguo@kernel.org>
> wrote:
> > > >
> > > > On Mon, Jan 14, 2019 at 12:02:47PM -0600, Rob Herring wrote:
> > > > > On Mon, Jan 14, 2019 at 4:21 AM Manivannan Sadhasivam
> > > > > <manivannan.sadhasivam@linaro.org> wrote:
> > > > > >
> > > > > > Add devicetree binding for Oxalis board in JSON format. While
> > > > > > adding that, let's fix the description for LS1012A also.
> > > > > >
> > > > > > Signed-off-by: Manivannan Sadhasivam
> > > > > > <manivannan.sadhasivam@linaro.org>
> > > > > > ---
> > > > > >  Documentation/devicetree/bindings/arm/fsl.yaml | 3 ++-
> > > > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml
> > > > > > b/Documentation/devicetree/bindings/arm/fsl.yaml
> > > > > > index d34fe0749199..0f30142fe316 100644
> > > > > > --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> > > > > > +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> > > > > > @@ -173,12 +173,13 @@ properties:
> > > > > >                - fsl,vf610
> > > > > >                - fsl,vf610m4
> > > > > >
> > > > > > -      - description: LS1021A based Boards
> > > > > > +      - description: LS1012A based Boards
> > > > >
> > > > > Well, yes that was wrong...
> > > > >
> > > > > >          items:
> > > > > >            - enum:
> > > > > >                - fsl,ls1012a-rdb
> > > > > >                - fsl,ls1012a-frdm
> > > > > >                - fsl,ls1012a-qds
> > > > > > +              - ebs-systart,oxalis
> > > > >
> > > > > Sort alphabetically.
> > > > >
> > > > > >            - const: fsl,ls1021a
> > > > >
> > > > > And this is wrong too.
> > > > >
> > > > > I you just change it, then we will be missing an entry for LS1021=
A.
> > > > > What's the status of that SoC because there is no board dts
> > > > > file? We should not have .dtsi files in the kernel which don't ge=
t built.
> > > >
> > > > Hmm, I do not see any LS1021A SoC .dtsi in the tree.  I suspect
> > > > it's just a typo of LS1012A.
> > > >
> > > > @Leo, do we have a LS1021A SoC?
> > >
> > > arch/arm/boot/dts/ls1021a.dtsi
> >
> > Oops, I only searched arm64 folder.
> >
> > So it seems the compatible of the boards below are missing there.
> >
> >   ls1021a-moxa-uc-8410a.dts
> >   ls1021a-qds.dts
> >   ls1021a-twr.dts
>=20
> So how should we proceed here? The above mentioned boards are lacking
> compatible in dts files and I guess that's the reason they didn't get
> mentioned in "fsl" binding file.
>=20
> Should I just go ahead and add the compatibles for these boards and list
> them in binding file?

Please go ahead and do that.  One thing is that the moxa-uc-8410a board is =
a 3rd-party board, not sure if it should belong to the fsl binding file.

Regards,
Leo
