From: Sharma Bhupesh <bhupesh.sharma@freescale.com>
Subject: RE: [PATCH v2 04/10] doc/bindings: Update PCIe devicetree binding
 documentation for LS2080A
Date: Wed, 9 Sep 2015 03:45:31 +0000
Message-ID: <BY1PR0301MB130337BA5B78D1887FE1880C82520@BY1PR0301MB1303.namprd03.prod.outlook.com>
References: <1441349872-4560-1-git-send-email-bhupesh.sharma@freescale.com>
 <1441349872-4560-5-git-send-email-bhupesh.sharma@freescale.com>
 <80094129.LHZFOe1ZPU@wuerfel>
 <CADRPPNR-cSSQC5sLMmoqcxX46J6hdULa_V4v2BK7T8s8pcX0cg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CADRPPNR-cSSQC5sLMmoqcxX46J6hdULa_V4v2BK7T8s8pcX0cg@mail.gmail.com>
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
To: Li Leo <LeoLi@freescale.com>, Arnd Bergmann <arnd@arndb.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "marc.zyngier@arm.com" <marc.zyngier@arm.com>, "Catalin.Marinas@arm.com" <Catalin.Marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "Lian M.H." <Minghuan.Lian@freescale.com>, "olof@lixom.net" <olof@lixom.net>, "bhupesh.linux@gmail.com" <bhupesh.linux@gmail.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> From: pku.leo@gmail.com [mailto:pku.leo@gmail.com]
> Sent: Wednesday, September 09, 2015 1:36 AM
> On Mon, Sep 7, 2015 at 6:32 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> > On Friday 04 September 2015 12:27:46 Bhupesh Sharma wrote:
> >> @@ -4,7 +4,8 @@ This PCIe host controller is based on the Synopsis
> >> Designware PCIe IP  and thus inherits all the common properties
> defined in designware-pcie.txt.
> >>
> >>  Required properties:
> >> -- compatible: should contain the platform identifier such as
> "fsl,ls1021a-pcie"
> >> +- compatible: should contain the platform identifier such as
> >> +"fsl,ls1021a-pcie",
> >> +  "fsl,ls2080a-pcie".
> >>  - reg: base addresses and lengths of the PCIe controller
> >>  - interrupts: A list of interrupt outputs of the controller. Must
> contain an
> >>    entry for each entry in the interrupt-names property.
> >>
> >
> > Are the two PCIe hosts mutually compatible? If they are, you should
> > mandate one of the strings as the base model for identification, with
> > the additional model being optional for identification of the specific
> SoC.
> 
> It seems that controllers on these chips are not exactly the same.
> They will get different driver data by matching the compatible strings.
> Probably we could define a more generic compatible string, such as
> "fsl,layerscape-pcie" or "fsl,ls-pcie".

Yes, Minghaun captured the differences in the two versions in the v1 review
discussion for the DTS here:
http://lists.infradead.org/pipermail/linux-arm-kernel/2015-April/338343.html

Regards,
Bhupesh
