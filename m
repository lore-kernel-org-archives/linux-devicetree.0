From: Leo Li <leoyang.li@nxp.com>
Subject: RE: [EXT] Re: [Patch v3 2/2] dt-bindings: spi: spi-fsl-qspi: Add
 bindings of ls1088a and ls1012a
Date: Wed, 31 Jul 2019 23:28:51 +0000
Message-ID: <VE1PR04MB66879C5045A813E7311534D68FDF0@VE1PR04MB6687.eurprd04.prod.outlook.com>
References: <1560942714-13330-1-git-send-email-Ashish.Kumar@nxp.com>
 <1560942714-13330-3-git-send-email-Ashish.Kumar@nxp.com>
 <20190709200857.GA8477@bogus>
 <VI1PR04MB4015206CD4AAA1E54C5978DA95DD0@VI1PR04MB4015.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <VI1PR04MB4015206CD4AAA1E54C5978DA95DD0@VI1PR04MB4015.eurprd04.prod.outlook.com>
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
To: Ashish Kumar <ashish.kumar@nxp.com>, Rob Herring <robh@kernel.org>, Han Xu <han.xu@nxp.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "bbrezillon@kernel.org" <bbrezillon@kernel.org>, Kuldeep Singh <kuldeep.singh@nxp.com>, "broonie@kernel.org" <broonie@kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Ashish Kumar
> Sent: Monday, July 29, 2019 4:09 AM
> To: Rob Herring <robh@kernel.org>; Leo Li <leoyang.li@nxp.com>
> Cc: devicetree@vger.kernel.org; bbrezillon@kernel.org; broonie@kernel.org;
> linux-arm-kernel@lists.infradead.org; linux-mtd@lists.infradead.org;
> Kuldeep Singh <kuldeep.singh@nxp.com>
> Subject: RE: [EXT] Re: [Patch v3 2/2] dt-bindings: spi: spi-fsl-qspi: Add
> bindings of ls1088a and ls1012a
> 
> 
> 
> > -----Original Message-----
> > From: Rob Herring <robh@kernel.org>
> > Sent: Wednesday, July 10, 2019 1:39 AM
> > To: Ashish Kumar <ashish.kumar@nxp.com>
> > Cc: devicetree@vger.kernel.org; bbrezillon@kernel.org;
> > broonie@kernel.org; linux-arm-kernel@lists.infradead.org;
> > linux-mtd@lists.infradead.org; Ashish Kumar <ashish.kumar@nxp.com>;
> > Kuldeep Singh <kuldeep.singh@nxp.com>; Ashish Kumar
> > <ashish.kumar@nxp.com>
> > Subject: [EXT] Re: [Patch v3 2/2] dt-bindings: spi: spi-fsl-qspi: Add
> > bindings of ls1088a and ls1012a
> >
> > Caution: EXT Email
> >
> > On Wed, 19 Jun 2019 16:41:54 +0530, Ashish Kumar wrote:
> > > Signed-off-by: Kuldeep Singh <kuldeep.singh@nxp.com>
> > > Signed-off-by: Ashish Kumar <ashish.kumar@nxp.com>
> > > ---
> > > v3:
> > > Rebase to top
> > > v2:
> > > Convert to patch series and rebasing done on top of tree
> > >
> > >  Documentation/devicetree/bindings/spi/spi-fsl-qspi.txt | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> >
> > Reviewed-by: Rob Herring <robh@kernel.org>
> 
> Hi Leo,
> 
> I think Rob, is waiting for you ack.

Binding patches usually go through subsystem tree.  So I think this actually need ack from qspi maintainer Han Xu and be picked up by SPI maintainer.

Regards,
Leo
