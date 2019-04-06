From: Grant Likely <Grant.Likely@arm.com>
Subject: Re: [PATCH v2 0/2] PCI: Describe external-facing ports in device tree
Date: Sat, 6 Apr 2019 19:42:27 +0000
Message-ID: <31d32816-be43-3507-ac7c-b31481e80e55@arm.com>
References: <20190402131548.41949-1-jean-philippe.brucker@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190402131548.41949-1-jean-philippe.brucker@arm.com>
Content-Language: en-US
Content-ID: <E8E442CF2580E84E82747BEF91D4B7BC@eurprd08.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jean-Philippe Brucker <Jean-Philippe.Brucker@arm.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Mark Rutland <Mark.Rutland@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Jeremy Linton <Jeremy.Linton@arm.com>, nd <nd@arm.com>, Robin Murphy <Robin.Murphy@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 02/04/2019 20:15, Jean-Philippe Brucker wrote:
> Since v1 [1], I improved the wording of patch 1/2 as suggested by Bjorn.
> 
> Add an "external-facing" property to PCI ports in device-tree, to help
> identify untrusted devices. The notion of untrusted PCI devices was
> added to the v5.0 kernel to describe devices that should have strict
> IOMMU protection [2], for example devices that are plugged in a
> Thunderbolt port. ACPI systems use the ExternalFacingPort property [3].
> Add an equivalent mechanism to device tree.
> 
> [1] https://lore.kernel.org/linux-pci/20190318182124.53859-1-jean-philippe.brucker@arm.com/
> [2] https://lkml.org/lkml/2018/11/26/631
> [3] https://docs.microsoft.com/en-us/windows-hardware/drivers/pci/dsd-for-pcie-root-ports#identifying-externally-exposed-pcie-root-ports

For both:

Reviewed-by: Grant Likely <grant.likely@arm.com>

> 
> Jean-Philippe Brucker (2):
>    dt-bindings: Add external-facing PCIe port property
>    PCI: OF: Support external-facing property
> 
>   Documentation/devicetree/bindings/pci/pci.txt | 50 +++++++++++++++++++
>   drivers/pci/of.c                              |  3 ++
>   2 files changed, 53 insertions(+)
> 
