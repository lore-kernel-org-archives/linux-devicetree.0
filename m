From: Jia Hongtao-B38951 <B38951-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [RFC] powerpc/fsl-pci: Document the "fsl,has-isa" property for
 Freescale PCI
Date: Mon, 23 Apr 2012 03:34:37 +0000
Message-ID: <412C8208B4A0464FA894C5F0C278CD5D019E746D@039-SN1MPN1-002.039d.mgd.msft.net>
References: <1333263396-23932-1-git-send-email-B38951@freescale.com>
 <E3DD739D-1EC3-4BCA-AE26-1EAE7A086A1E@kernel.crashing.org>
 <412C8208B4A0464FA894C5F0C278CD5D019DBE90@039-SN1MPN1-002.039d.mgd.msft.net>
 <412C8208B4A0464FA894C5F0C278CD5D019DEA96@039-SN1MPN1-002.039d.mgd.msft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <412C8208B4A0464FA894C5F0C278CD5D019DEA96-TcFNo7jSaXPiTqIcKZ1S2K4g8xLGJsHaLnY5E4hWTkheoWH0uzbU5w@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jia Hongtao-B38951 <B38951-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Li Yang-R58472 <r58472-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Jia Hongtao-B38951
> Sent: Tuesday, April 10, 2012 5:17 PM
> To: Kumar Gala
> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org;
> Li Yang-R58472; Jia Hongtao-B38951
> Subject: RE: [RFC] powerpc/fsl-pci: Document the "fsl,has-isa" property
> for Freescale PCI
> 
> 
> > -----Original Message-----
> > From: linuxppc-dev-bounces+b38951=freescale.com-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> > [mailto:linuxppc-dev-bounces+b38951=freescale.com-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org] On
> > Behalf Of Jia Hongtao-B38951
> > Sent: Friday, April 06, 2012 11:05 AM
> > To: Kumar Gala
> > Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org;
> > Li Yang-R58472
> > Subject: RE: [RFC] powerpc/fsl-pci: Document the "fsl,has-isa" property
> > for Freescale PCI
> >
> >
> > > -----Original Message-----
> > > From: Kumar Gala [mailto:galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org]
> > > Sent: Wednesday, April 04, 2012 9:09 PM
> > > To: Jia Hongtao-B38951
> > > Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; Li Yang-R58472; devicetree-
> > > discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> > > Subject: Re: [RFC] powerpc/fsl-pci: Document the "fsl,has-isa"
> property
> > > for Freescale PCI
> > >
> > >
> > > On Apr 1, 2012, at 1:56 AM, Jia Hongtao wrote:
> > >
> > > > If PCI is primary bus we should set isa_io/mem_base when parsing
> PCI
> > > bridge
> > > > resources from device tree. The previous way to check the primary
> bus
> > > based
> > > > on a hard-coded address named primary_phb_addr. Now we add a
> property
> > > named
> > > > "fsl,has-isa" into device tree. In kernel we use this property to
> > find
> > > out
> > > > the bus is primary or not. This way is more flexible.
> > > >
> > > > Signed-off-by: Jia Hongtao <B38951-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > > > Signed-off-by: Li Yang <leoli-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > > > ---
> > > > .../devicetree/bindings/powerpc/fsl/pci.txt        |   36
> > > ++++++++++++++++++++
> > > > 1 files changed, 36 insertions(+), 0 deletions(-)
> > > > create mode 100644
> > > Documentation/devicetree/bindings/powerpc/fsl/pci.txt
> > >
> > > This isn't freescale specific, its linux specific.  If anything the
> > > property should be linux,has-isa.
> > >
> > > But in general I dont think this is a good idea.  In truth one could
> > > search the device tree for:
> > >
> > > 	device_type = "isa";
> > >
> > > to try and set this dynamically.
> > >
> > > - k
> > >
> >
> > Yes, it's not Freescale specific, but it's only used by Freescale now
> in
> > the kernel. This is why I named the property as "fsl,has-isa".
> >
> > To indicate PCI bus is primary we have three ways to go and we now like
> > the 2nd solution:
> >
> > 1. As this patch said, we add a property to device tree manually.
> >
> > 2. Set this property dynamically in uboot when scanning PCI bridge.
> > Actually we have already done this. The problem is users should update
> > uboot and kernel together or it's not work. To support old uboot we
> > decide
> > to add this property into device tree too temporarily. We will remove
> it
> > from device tree at an appropriate future.
> >
> > 3. Just as you said we could search the device tree by device_type =
> > "isa".
> >    There are two problems here:
> > 	* There is no OF API for searching just in PCI node now. That means
> > 	  we can't easily find whether there is "isa" bridge or not under
> > 	  this PCI controller while scanning it.
> > 	* Boards MPC8541CDS and MPC8555CDS has no "isa" node in device tree
> > 	  but has ISA bridge under PCI controller.
> >
> > - Jia Hongtao
> >
> 
> Hi Kumar,
> 
> I agree with the name change from "fsl,has-isa" to "linux,has-isa".
> If this is ok I will update this patch and send the patches based on this
> new property.
> 
> Also, I have a question about "isa" node in dts. Is this node being used
> by kernel? If not we can remove it from all boards and check the primary
> bus by uboot. If "isa" is useful why MPC8541CDS and MPC8555CDS has no
> "isa" node in device tree but has ISA bridge under PCI controller?
> 
> Thanks.
> - Jia Hongtao

Hi Kumar and Ben,

Do you have any idea on this?
Thanks.

 - Jia Hongtao
