From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 11/12] ARM: mvebu: Relocate Armada 370 PCIe device tree
 nodes
Date: Tue, 18 Jun 2013 23:35:50 +0200
Message-ID: <201306182335.50722.arnd@arndb.de>
References: <1371554737-25319-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1371554737-25319-12-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1371554737-25319-12-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 18 June 2013, Ezequiel Garcia wrote:
> +
> +                       ranges =
> +                              <0x82000000 0 0x40000    0xffff0001 0x40000 0 0x00002000
> +                               0x82000000 0 0x80000    0xffff0001 0x80000 0 0x00002000
> +                               0x82000000 0 0xe0000000 0xffff0002 0          0 0x08000000
> +                               0x81000000 0 0          0xffff0002 0x8000000  0 0x00100000>;

As pointed out on IRC, this is not a good representation of the memory space,
since it requires a non-zero sys->mem_offset, and it conflicts with the straight
mapping I suggested.

I think it should be

                               0x82000000 0 0xe0000000 0xffff0002 0  0xe0000000 0x08000000

if we want to encode the aperture in the ranges property here, i.e. have
a 1:1 mapping between PCI memory space and MBUS space, and in mbus,
you need the corresponding

-                           0xffff0002 0 0xe0000000 0x8100000
+                           0xffff0002 0xe0000000 0xe0000000 0x8100000

so that mbus actually translates the right addresses. You could also
have the PCI memory space start at 0, which would mean

                               0x82000000 0 0 0xffff0002 0  0 0x08000000

and

                              0xffff0002 0 0xe0000000 0x8100000

Note that the driver doesn't actually handle the generic case correctly, you would
need to apply this patch
	
diff --git a/drivers/pci/host/pci-mvebu.c b/drivers/pci/host/pci-mvebu.c
index 13a633b..aa674f4 100644
--- a/drivers/pci/host/pci-mvebu.c
+++ b/drivers/pci/host/pci-mvebu.c
@@ -790,6 +790,7 @@ static int __init mvebu_pcie_probe(struct platform_device *pdev)
 		}
 		if (restype == IORESOURCE_MEM) {
 			of_pci_range_to_resource(&range, np, &pcie->mem);
+			sys->mem_offset = range.cpu_addr - range.pci_addr;
 			pcie->mem.name = "MEM";
 		}
 	}

to deal with the generic case where the bus address is different from the
CPU address.

	Arnd
