From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v5 00/11] PCI: Add support to the Cadence PCIe controller
Date: Tue, 30 Jan 2018 11:41:55 +0000
Message-ID: <20180130114155.GA12009@e107981-ln.cambridge.arm.com>
References: <cover.1517170521.git.cyrille.pitchen@free-electrons.com>
 <20180128214741.GA232763@bhelgaas-glaptop.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180128214741.GA232763-1RhO1Y9PlrlHTL0Zs8A6p5iNqAH0jzoTYJqu5kTmcBRl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Cyrille Pitchen <cyrille.pitchen-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, adouglas-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, stelford-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, dgary-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, kgopi-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, eandrews-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, sureshp-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Jan 28, 2018 at 03:47:41PM -0600, Bjorn Helgaas wrote:
> On Sun, Jan 28, 2018 at 09:40:14PM +0100, Cyrille Pitchen wrote:
> > Hi all,
> > 
> > this series of patches adds support to the Cadence PCIe controller.
> > It was tested on a ARM64 platform emulated by a Palladium running the
> > pci-next kernel.
> > 
> > The host mode was tested with some PCIe devices connected to the Palladium
> > through a speed-bridge. Some of those devices were a USB host controller
> > and a SATA controller. The PCIe host controller was also tested with a
> > second controller configured in endpoint mode and connected back to back
> > to the first controller.
> > 
> > The EndPoint Controller (EPC) driver was tested with 2 PCI functions, both
> > handled by the pci-epf-test driver, using the pcitest userspace program.
> > I used the "-D" optional command line parameter to select the proper PCI
> > function.
> > 
> > Best regards,
> > 
> > Cyrille
> > 
> > ChangeLog
> > 
> > v4 -> v5:
> > - rebase on today's (20180128) linux-pci/next
> 
> Don't bother rebasing onto linux-pci/next.
> 
> If your patches actually *depend* on something that has already been
> merged onto a PCI topic branch, you should mention that and say which
> branch.

Yes - Cyrille please advise which branch(es) this series depends on,
it does not apply cleanly to -rc4.

Merge window is open and I do not know what we can do with this series
for v4.16 but please let me know.

Thanks,
Lorenzo
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
