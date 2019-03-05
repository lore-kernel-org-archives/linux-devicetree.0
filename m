From: Jacky Bai <ping.bai@nxp.com>
Subject: RE: [PATCH 2/3] dt-bindings: arm: imx: Add the soc binding for imx8mm
Date: Tue, 5 Mar 2019 01:43:45 +0000
Message-ID: <VI1PR0402MB35190FE10A2331B9AF4733A587720@VI1PR0402MB3519.eurprd04.prod.outlook.com>
References: <1551691021-31505-1-git-send-email-ping.bai@nxp.com>
 <1551691021-31505-2-git-send-email-ping.bai@nxp.com>
 <CAL_JsqJFNgoAOHCOc0vdnxrwJR_T+iDddbS3nZc_d6grAC0k3w@mail.gmail.com>
 <CAL_JsqLA+ypzHLC=mx2f5YJBs9EJooiOOqMKc-dnm3DW_GJXLw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL_JsqLA+ypzHLC=mx2f5YJBs9EJooiOOqMKc-dnm3DW_GJXLw@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

> Subject: Re: [PATCH 2/3] dt-bindings: arm: imx: Add the soc binding for
> imx8mm
> 
> On Mon, Mar 4, 2019 at 9:36 AM Rob Herring <robh+dt@kernel.org> wrote:
> >
> > On Mon, Mar 4, 2019 at 3:12 AM Jacky Bai <ping.bai@nxp.com> wrote:
> > >
> > > Add the soc & board binding for i.MX8MM.
> > >
> > > Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> > > ---
> > >  Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml
> > > b/Documentation/devicetree/bindings/arm/fsl.yaml
> > > index 7e2cd6a..0620896 100644
> > > --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> > > +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> > > @@ -154,6 +154,12 @@ properties:
> > >            - const: compulab,cl-som-imx7
> > >            - const: fsl,imx7d
> > >
> > > +    - description: i.MX8MM based Boards
> > > +        items:
> >
> > The indentation is wrong (and is significant). 'items' should be
> > aligned with 'description'. IOW, it should be 6 spaces.
> 
> Looking again, items is correct, it is description that needs 2 more spaces.
> 
Thanks, will fix it in v2.

BR

> Rob
