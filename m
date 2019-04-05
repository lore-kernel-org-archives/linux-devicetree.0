From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v2 2/2] PCI: OF: Support external-facing property
Date: Fri, 5 Apr 2019 16:18:40 -0500
Message-ID: <20190405211840.GB159318@google.com>
References: <20190402131548.41949-1-jean-philippe.brucker@arm.com>
 <20190402131548.41949-3-jean-philippe.brucker@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190402131548.41949-3-jean-philippe.brucker@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Grant.Likely@arm.com, linux-pci@vger.kernel.org, Jeremy.Linton@arm.com, robh+dt@kernel.org, Robin.Murphy@arm.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 02, 2019 at 02:15:48PM +0100, Jean-Philippe Brucker wrote:
> Set the "untrusted" attribute to any PCIe port that has an
> "external-facing" device tree property. Any device downstream of this
> port will inherit the attribute and have only the strictest IOMMU
> protection.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

Rob, you can take both of these, or ack the first and I'll take them.

> ---
>  drivers/pci/of.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/pci/of.c b/drivers/pci/of.c
> index 3d32da15c215..3e7ac7748d90 100644
> --- a/drivers/pci/of.c
> +++ b/drivers/pci/of.c
> @@ -35,6 +35,9 @@ void pci_set_bus_of_node(struct pci_bus *bus)
>  		bus->dev.of_node = pcibios_get_phb_of_node(bus);
>  	else
>  		bus->dev.of_node = of_node_get(bus->self->dev.of_node);
> +
> +	if (of_get_property(bus->dev.of_node, "external-facing", NULL))
> +		bus->self->untrusted = true;
>  }
>  
>  void pci_release_bus_of_node(struct pci_bus *bus)
> -- 
> 2.21.0
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
