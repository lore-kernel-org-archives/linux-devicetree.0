From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2 2/2] PCI: OF: Support external-facing property
Date: Fri, 5 Apr 2019 22:28:05 +0100
Message-ID: <17400193-bf44-1573-a35a-852ab9127721@arm.com>
References: <20190402131548.41949-1-jean-philippe.brucker@arm.com>
 <20190402131548.41949-3-jean-philippe.brucker@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190402131548.41949-3-jean-philippe.brucker@arm.com>
Content-Language: en-GB
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-pci@vger.kernel.org, Grant.Likely@arm.com, Jeremy.Linton@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2019-04-02 2:15 pm, Jean-Philippe Brucker wrote:
> Set the "untrusted" attribute to any PCIe port that has an
> "external-facing" device tree property. Any device downstream of this
> port will inherit the attribute and have only the strictest IOMMU
> protection.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
> ---
>   drivers/pci/of.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/pci/of.c b/drivers/pci/of.c
> index 3d32da15c215..3e7ac7748d90 100644
> --- a/drivers/pci/of.c
> +++ b/drivers/pci/of.c
> @@ -35,6 +35,9 @@ void pci_set_bus_of_node(struct pci_bus *bus)
>   		bus->dev.of_node = pcibios_get_phb_of_node(bus);
>   	else
>   		bus->dev.of_node = of_node_get(bus->self->dev.of_node);
> +
> +	if (of_get_property(bus->dev.of_node, "external-facing", NULL))

You could use of_property_read_bool() for this, but either way,

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> +		bus->self->untrusted = true;
>   }
>   
>   void pci_release_bus_of_node(struct pci_bus *bus)
> 
