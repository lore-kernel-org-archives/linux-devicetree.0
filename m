From: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 0/4] dra7: Add PCIe support
Date: Tue, 22 Jul 2014 15:33:06 -0600
Message-ID: <20140722213306.GB25432@google.com>
References: <1405587643-13808-1-git-send-email-kishon@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1405587643-13808-1-git-send-email-kishon-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, mohit.kumar-qxv4g6HH51o@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jul 17, 2014 at 02:30:39PM +0530, Kishon Vijay Abraham I wrote:
> Changes from v2:
> * Added myself as MAINTAINER of pcie dra7xx driver
> 
> Changes from v1:
> * fixed dw_pcie_prog_viewport_io_outbound() to use untranslated address
> * split dra7xx patch into driver part and documentation part
> 
> [1] is split into separate series in order for individual subsystem
> Maintainers to pick up the patches. This series handles the PCIe
> support for DRA7.
> 
> Rebased to pci -next.
> 
> [1] -> https://lkml.org/lkml/2014/5/29/258
> 
> Kishon Vijay Abraham I (4):
>   PCI: designware: Configuration space should be specified in 'reg'
>   PCI: designware: use untranslated address while programming ATU
>   Documentation: pci: ti: Add dt binding documentation for PCIe in
>     DRA7xx
>   PCI: host: pcie-dra7xx: add support for pcie-dra7xx controller
> 
>  .../devicetree/bindings/pci/designware-pcie.txt    |    4 +
>  Documentation/devicetree/bindings/pci/ti-pci.txt   |   59 +++
>  MAINTAINERS                                        |    8 +
>  drivers/pci/host/Kconfig                           |   10 +
>  drivers/pci/host/Makefile                          |    1 +
>  drivers/pci/host/pci-dra7xx.c                      |  458 ++++++++++++++++++++
>  drivers/pci/host/pcie-designware.c                 |   72 ++-
>  drivers/pci/host/pcie-designware.h                 |    4 +
>  8 files changed, 600 insertions(+), 16 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pci/ti-pci.txt
>  create mode 100644 drivers/pci/host/pci-dra7xx.c

I applied these to pci/host-designware for v3.17.  This will not be in my
first pull request because I'm going on vacation and won't have time to get
everything through -next and tagged.  But I'm planning a second pull
request that will include this.

Mohit, I applied your ack of "use untranslated address" from the v1 posting
(your mail of Jul 09) to the corresponding patch here, since Kishon didn't
carry it forward.  Let me know if that's not OK.

I also squashed the last two patches into one so the DT binding
documentation goes along with the dra7xx driver addition.

Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
