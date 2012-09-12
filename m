From: Stefano Stabellini <stefano.stabellini-mvvWK6WmYclDPfheJLI6IQ@public.gmane.org>
Subject: Re: [PATCH v3 06/25] docs: Xen ARM DT bindings
Date: Wed, 12 Sep 2012 18:07:16 +0100
Message-ID: <alpine.DEB.2.02.1208281823270.15568@kaball.uk.xensource.com>
References: <alpine.DEB.2.02.1208161618550.4850@kaball.uk.xensource.com>
	<1345131377-14713-6-git-send-email-stefano.stabellini@eu.citrix.com>
	<503BFCD8.5090804@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <503BFCD8.5090804-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "xen-devel-GuqFBffKawuULHF6PoxzQEEOCMrvLtNR@public.gmane.org" <xen-devel-GuqFBffKawuULHF6PoxzQEEOCMrvLtNR@public.gmane.org>, "linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org" <linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, Ian Campbell <Ian.Campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "catalin.marinas-5wv7dgnIgG8@public.gmane.org" <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "konrad.wilk-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org" <konrad.wilk-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, "Tim (Xen.org)" <tim-LM2mM/qkH7s@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Vrabel <david.vrabel-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 28 Aug 2012, Rob Herring wrote:
> On 08/16/2012 10:35 AM, Stefano Stabellini wrote:
> > Add a doc to describe the Xen ARM device tree bindings
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini-mvvWK6WmYclDPfheJLI6IQ@public.gmane.org>
> > CC: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> > CC: David Vrabel <david.vrabel-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/arm/xen.txt |   22 ++++++++++++++++++++++
> >  1 files changed, 22 insertions(+), 0 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/arm/xen.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/xen.txt b/Documentation/devicetree/bindings/arm/xen.txt
> > new file mode 100644
> > index 0000000..ec6d884
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/xen.txt
> > @@ -0,0 +1,22 @@
> > +* Xen hypervisor device tree bindings
> > +
> > +Xen ARM virtual platforms shall have the following properties:
> > +
> > +- compatible:
> > +	compatible = "xen,xen", "xen,xen-<version>";
> > +  where <version> is the version of the Xen ABI of the platform.
> > +
> > +- reg: specifies the base physical address and size of a region in
> > +  memory where the grant table should be mapped to, using an
> > +  HYPERVISOR_memory_op hypercall. 
> > +
> > +- interrupts: the interrupt used by Xen to inject event notifications.
> 
> You should look at ePAPR 1.1 which defines hypervisor related bindings.
> While it is a PPC doc, we should reuse or extend what makes sense.
> 
> See section 7.5:
> 
> https://www.power.org/resources/downloads/Power_ePAPR_APPROVED_v1.1.pdf

Thanks for the link, I wasn't aware of ePAPR.

The hypervisor node defined by ePAPR is not very different from what I
am proposing. Should I try to be compatible with the hypervisor
specification above (as in compatible = "epapr,hypervisor-1.1")?
Or should I just use it as a reference for my own specification?

Personally I would rather avoid full compatibility with ePAPR.
