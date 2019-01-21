From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: arm: fsl: Add devicetree binding for
 Oxalis
Date: Mon, 21 Jan 2019 11:39:50 +0530
Message-ID: <20190121060950.GA8713@Mani-XPS-13-9360>
References: <20190114102053.16013-1-manivannan.sadhasivam@linaro.org>
 <20190114102053.16013-3-manivannan.sadhasivam@linaro.org>
 <CAL_JsqJpRPrCpRTpqh1v6JZwpEtZnaeuLTHR+0EiMSoxbk9zeQ@mail.gmail.com>
 <20190116022100.GC15808@dragon>
 <CAL_Jsq+myeZ1n4X=KhHZjtPDHnGH=L65xxYbzMrt8Rq6Bur4Bg@mail.gmail.com>
 <20190116101441.GH15808@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190116101441.GH15808@dragon>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, a.tropschug@ebs-systart.com, m.bittner@ebs-systart.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, Yang-Leo Li <leoyang.li@nxp.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 16, 2019 at 06:14:43PM +0800, Shawn Guo wrote:
> On Tue, Jan 15, 2019 at 10:07:12PM -0600, Rob Herring wrote:
> > On Tue, Jan 15, 2019 at 8:21 PM Shawn Guo <shawnguo@kernel.org> wrote:
> > >
> > > On Mon, Jan 14, 2019 at 12:02:47PM -0600, Rob Herring wrote:
> > > > On Mon, Jan 14, 2019 at 4:21 AM Manivannan Sadhasivam
> > > > <manivannan.sadhasivam@linaro.org> wrote:
> > > > >
> > > > > Add devicetree binding for Oxalis board in JSON format. While adding
> > > > > that, let's fix the description for LS1012A also.
> > > > >
> > > > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > > ---
> > > > >  Documentation/devicetree/bindings/arm/fsl.yaml | 3 ++-
> > > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> > > > > index d34fe0749199..0f30142fe316 100644
> > > > > --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> > > > > +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> > > > > @@ -173,12 +173,13 @@ properties:
> > > > >                - fsl,vf610
> > > > >                - fsl,vf610m4
> > > > >
> > > > > -      - description: LS1021A based Boards
> > > > > +      - description: LS1012A based Boards
> > > >
> > > > Well, yes that was wrong...
> > > >
> > > > >          items:
> > > > >            - enum:
> > > > >                - fsl,ls1012a-rdb
> > > > >                - fsl,ls1012a-frdm
> > > > >                - fsl,ls1012a-qds
> > > > > +              - ebs-systart,oxalis
> > > >
> > > > Sort alphabetically.
> > > >
> > > > >            - const: fsl,ls1021a
> > > >
> > > > And this is wrong too.
> > > >
> > > > I you just change it, then we will be missing an entry for LS1021A.
> > > > What's the status of that SoC because there is no board dts file? We
> > > > should not have .dtsi files in the kernel which don't get built.
> > >
> > > Hmm, I do not see any LS1021A SoC .dtsi in the tree.  I suspect it's
> > > just a typo of LS1012A.
> > >
> > > @Leo, do we have a LS1021A SoC?
> > 
> > arch/arm/boot/dts/ls1021a.dtsi
> 
> Oops, I only searched arm64 folder.
> 
> So it seems the compatible of the boards below are missing there.
> 
>   ls1021a-moxa-uc-8410a.dts
>   ls1021a-qds.dts
>   ls1021a-twr.dts

So how should we proceed here? The above mentioned boards are lacking
compatible in dts files and I guess that's the reason they didn't get
mentioned in "fsl" binding file.

Should I just go ahead and add the compatibles for these boards and list
them in binding file?

Thanks,
Mani

> 
> Shawn
