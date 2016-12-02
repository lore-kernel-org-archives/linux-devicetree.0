From: Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: [PATCH v2 0/3 pci/next] PCI: rcar, rcar-gen2: Bindings cleanups
Date: Fri,  2 Dec 2016 11:36:57 +0100
Message-ID: <1480675020-26346-1-git-send-email-horms+renesas@verge.net.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Phil Edworthy <phil.edworthy-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

this short series makes some bindings cleanups to the Renesas PCI drivers.

Simon Horman (3):
  PCI: rcar-gen2: Use gen2 fallback compatibility last
  PCI: rcar: Use gen2 fallback compatibility last
  PCI: rcar: Add gen3 fallback compatibility string for pcie-rcar

 Documentation/devicetree/bindings/pci/rcar-pci.txt | 1 +
 drivers/pci/host/pci-rcar-gen2.c                   | 2 +-
 drivers/pci/host/pcie-rcar.c                       | 6 ++++--
 3 files changed, 6 insertions(+), 3 deletions(-)

-- 
2.7.0.rc3.207.g0ac5344

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
