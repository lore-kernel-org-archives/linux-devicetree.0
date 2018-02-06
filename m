From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v5 00/11] PCI: Add support to the Cadence PCIe controller
Date: Tue, 6 Feb 2018 09:39:39 +0000
Message-ID: <20180206093939.GA2579@e107981-ln.cambridge.arm.com>
References: <cover.1517170521.git.cyrille.pitchen@free-electrons.com>
 <20180128214741.GA232763@bhelgaas-glaptop.roam.corp.google.com>
 <20180130114155.GA12009@e107981-ln.cambridge.arm.com>
 <8cec81b2-85c4-d7bf-4171-9e94a745eab0@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <8cec81b2-85c4-d7bf-4171-9e94a745eab0-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cyrille Pitchen <cyrille.pitchen-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, adouglas-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, stelford-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, dgary-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, kgopi-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, eandrews-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, sureshp-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 30, 2018 at 10:12:36PM +0100, Cyrille Pitchen wrote:

[...]

> >>> v4 -> v5:
> >>> - rebase on today's (20180128) linux-pci/next
> >>
> >> Don't bother rebasing onto linux-pci/next.
> >>
> >> If your patches actually *depend* on something that has already been
> >> merged onto a PCI topic branch, you should mention that and say which
> >> branch.
> > 
> > Yes - Cyrille please advise which branch(es) this series depends on,
> > it does not apply cleanly to -rc4.
> > 
> > Merge window is open and I do not know what we can do with this series
> > for v4.16 but please let me know.
> >
> 
> I've just sent v6. No change from v5 except that the series has been
> rebased onto linux-pci/master (v4.15-rc4) and tested on the Palladium.
> I've cherry-picked one Kishon's patch from linux-pci/next to test the
> endpoint mode.

We have applied v6 that should get into v4.16, thank you !

Lorenzo
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
