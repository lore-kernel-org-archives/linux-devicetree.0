From: Rob Herring <robh@kernel.org>
Subject: Re: [EXT] Re: [v1 1/4] dt-bindings: display: Add DT bindings for
 LS1028A HDP-TX PHY.
Date: Wed, 19 Jun 2019 08:07:12 -0600
Message-ID: <CAL_JsqJnBw+OqEX46CC1E2=9CDmeT8hQtvMpufsnU8z3+1RoBQ@mail.gmail.com>
References: <20190508103703.40885-1-wen.he_1@nxp.com> <20190613200813.GA895@bogus>
 <DB7PR04MB5195E49670279C9A28C28A5EE2EB0@DB7PR04MB5195.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DB7PR04MB5195E49670279C9A28C28A5EE2EB0@DB7PR04MB5195.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wen He <wen.he_1@nxp.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>
List-Id: devicetree@vger.kernel.org

On Sun, Jun 16, 2019 at 7:45 PM Wen He <wen.he_1@nxp.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Rob Herring <robh@kernel.org>
> > Sent: 2019=E5=B9=B46=E6=9C=8814=E6=97=A5 4:08
> > To: Wen He <wen.he_1@nxp.com>
> > Cc: linux-kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > devicetree@vger.kernel.org; shawnguo@kernel.org; Leo Li
> > <leoyang.li@nxp.com>
> > Subject: [EXT] Re: [v1 1/4] dt-bindings: display: Add DT bindings for L=
S1028A
> > HDP-TX PHY.
> >
> > Caution: EXT Email
> >
> > On Wed, May 08, 2019 at 10:35:25AM +0000, Wen He wrote:
> > > Add DT bindings documentmation for the HDP-TX PHY controller. The
> > > describes which could be found on NXP Layerscape ls1028a platform.
> >
> > Drop the hard stop (.) from the subject.
> >
> > >
> > > Signed-off-by: Wen He <wen.he_1@nxp.com>
> > > ---
> > >  .../devicetree/bindings/display/fsl,hdp.txt   | 56 +++++++++++++++++=
++
> > >  1 file changed, 56 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/display/fsl,hdp.txt
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/fsl,hdp.txt
> > > b/Documentation/devicetree/bindings/display/fsl,hdp.txt
> > > new file mode 100644
> > > index 000000000000..36b5687a1261
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/fsl,hdp.txt
> > > @@ -0,0 +1,56 @@
> > > +NXP Layerscpae ls1028a HDP-TX PHY Controller
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +The following bindings describe the Cadence HDP TX PHY on ls1028a
> > > +that offer multi-protocol support of standars such as eDP and
> > > +Displayport, supports for 25-600MHz pixel clock and up to 4k2k at 60=
MHz
> > resolution.
> > > +The HDP transmitter is a Cadence HDP TX controller IP with a
> > > +companion PHY IP.
> >
> > I'm confused. This binding covers both blocks or is just one of them?
> >
>
> Hi Rob,
>
> This binding covers both blocks(HDP TX PHY and HDP TX Controller),
> Because they are belong to the one IP.

In that case, you should also have an output port to a DP connector
node (or DP panel).

Rob
