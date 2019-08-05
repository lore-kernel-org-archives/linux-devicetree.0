From: Ashish Kumar <ashish.kumar@nxp.com>
Subject: RE: [EXT] Re: [Patch v3 1/2] dt-bindings: spi: spi-fsl-qspi: Add
 ls2080a compatibility string to bindings
Date: Mon, 5 Aug 2019 09:08:17 +0000
Message-ID: <VI1PR04MB4015C2C9407598EFEEB4CB2D95DA0@VI1PR04MB4015.eurprd04.prod.outlook.com>
References: <1560942714-13330-1-git-send-email-Ashish.Kumar@nxp.com>
 <1560942714-13330-2-git-send-email-Ashish.Kumar@nxp.com>
 <20190709200837.GA7806@bogus>
 <CA+EcR23hhD2=abMtNGDoW1LtXSE4qfjTy1uzU7sgrbi7W=KSbw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <CA+EcR23hhD2=abMtNGDoW1LtXSE4qfjTy1uzU7sgrbi7W=KSbw@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: "broonie@kernel.org" <broonie@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Han Xu <xhnjupt@gmail.com>, "bbrezillon@kernel.org" <bbrezillon@kernel.org>, Kuldeep Singh <kuldeep.singh@nxp.com>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Rob Herring <robh@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Han Xu <xhnjupt@gmail.com>
> Sent: Thursday, August 1, 2019 8:53 PM
> To: Rob Herring <robh@kernel.org>
> Cc: Ashish Kumar <ashish.kumar@nxp.com>; devicetree@vger.kernel.org;
> bbrezillon@kernel.org; Kuldeep Singh <kuldeep.singh@nxp.com>;
> broonie@kernel.org; linux-mtd@lists.infradead.org; linux-arm-
> kernel@lists.infradead.org
> Subject: [EXT] Re: [Patch v3 1/2] dt-bindings: spi: spi-fsl-qspi: Add ls2080a
> compatibility string to bindings
> 
> Caution: EXT Email
> 
> On Tue, Jul 9, 2019 at 3:09 PM Rob Herring <robh@kernel.org> wrote:
> >
> > On Wed, 19 Jun 2019 16:41:53 +0530, Ashish Kumar wrote:
> > > There are 2 version of QSPI-IP, according to which controller
> > > registers sets can be big endian or little endian.There are some
> > > other minor changes like RX fifo depth etc.
> > >
> > > The big endian version uses driver compatible "fsl,ls1021a-qspi" and
> > > little endian version uses driver compatible "fsl,ls2080a-qspi"
> > >
> > > Signed-off-by: Kuldeep Singh <kuldeep.singh@nxp.com>
> > > Signed-off-by: Ashish Kumar <ashish.kumar@nxp.com>
> > > ---
> > > v3:
> > > Rebase to top
> > > v2:
> > > Convert to patch series and rebasing done on top of tree
> > >
> > >  Documentation/devicetree/bindings/spi/spi-fsl-qspi.txt | 3 +--
> > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > >
> >
> > Reviewed-by: Rob Herring <robh@kernel.org>
> 
> Acked-by: Han Xu <han.xu@nxp.com>

Hello Mark,

Could you please send this patch[1] from your spi tree, It applies seamlessly on
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git/

[1]: http://patchwork.ozlabs.org/patch/1118636/

Regards 
Ashish
> 
> >
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Flists
> > .infradead.org%2Fmailman%2Flistinfo%2Flinux-
> mtd%2F&amp;data=02%7C01%7C
> >
> Ashish.Kumar%40nxp.com%7Ca172f045af714e408d0a08d716942751%7C686
> ea1d3bc
> >
> 2b4c6fa92cd99c5c301635%7C0%7C1%7C637002697881500159&amp;sdata=f
> 8i1y4aa
> > k3gPnuXM3fD1xFPp4RB7GEWZ45%2BeWPOoNSA%3D&amp;reserved=0
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
