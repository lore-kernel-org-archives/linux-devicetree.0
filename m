From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 2/3] pci: iproc: Add Broadcom iProc PCIe support
Date: Mon, 09 Mar 2015 13:35:24 +0100
Message-ID: <2314573.X8TfIpVCUq@wuerfel>
References: <1425603699-13416-1-git-send-email-rjui@broadcom.com> <CAE_wzQ_Rq5u83UXOYRLShxuCzcgxA0BSPFZT4RmvDj8nfTSGcg@mail.gmail.com> <54F9EB42.3010804@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54F9EB42.3010804-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Dmitry Torokhov <dtor-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Anatol Pomazau <anatol-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday 06 March 2015 10:00:34 Ray Jui wrote:
> > 
> 
> Although I have not tested it, but to my best knowledge there shouldn't
> be any technical issue by making the PCIe iProc driver a loadable module
> and installing the module later after the kernel finishes booting.
> 
> But I wonder why I haven't seen any PCIe host driver being allowed to be
> compiled as module? Maybe there's no obvious benefit of doing that.
> People typically opt to load slave devices as module but tend to keep
> the bus or host devices compiled in.
> 
> And to allow a PCI host driver to be compiled as module, some PCI
> functions need to have their symbols exported:
> 
> ERROR: "pci_common_swizzle" [drivers/pci/host/pcie-iproc.ko] undefined!
> ERROR: "pci_fixup_irqs" [drivers/pci/host/pcie-iproc.ko] undefined!
> ERROR: "pci_assign_unassigned_bus_resources"
> [drivers/pci/host/pcie-iproc.ko] undefined!
> ERROR: "pci_remove_root_bus" [drivers/pci/host/pcie-iproc.ko] undefined!
> ERROR: "pci_stop_root_bus" [drivers/pci/host/pcie-iproc.ko] undefined!
> ERROR: "pci_create_root_bus" [drivers/pci/host/pcie-iproc.ko] undefined!
> 
> Maybe Bjorn can help to shed some light here? Should I go ahead and
> export_symbol these PCI functions and make the iProc PCI driver "tristate"?

My best guess is that no loadable driver ever tried to use these and
we should indeed just export them.

The call to pci_assign_unassigned_bus_resources could be avoided by using
pci_rescan_bus(), which would simplify the driver a little, but for
some reason, nothing else uses that, so I'm not sure about it.

The pci_remove_root_bus/pci_stop_root_bus calls are rarely used anywhere
else. Are they functional to the point where you could unload a pci
host driver that is a loadable module? If so, that would be
wonderful.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
