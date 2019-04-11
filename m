From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v3 0/2] PCI: Describe external-facing ports in device tree
Date: Thu, 11 Apr 2019 16:18:23 -0500
Message-ID: <20190411211823.GU256045@google.com>
References: <20190411124027.9490-1-jean-philippe.brucker@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190411124027.9490-1-jean-philippe.brucker@arm.com>
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
Cc: Mark.Rutland@arm.com, devicetree@vger.kernel.org, Grant.Likely@arm.com, linux-pci@vger.kernel.org, robh+dt@kernel.org, Robin.Murphy@arm.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Apr 11, 2019 at 01:40:25PM +0100, Jean-Philippe Brucker wrote:
> Since v2 [1] I fixed a possible NULL dereference reported by smatch,
> sorry about that. I dropped all tags for patch 2.
> 
> Add an "external-facing" property to PCI ports in device-tree, to help
> identify untrusted devices. The notion of untrusted PCI devices was
> added to the v5.0 kernel to describe devices that should have strict
> IOMMU protection [2], for example devices that are plugged in a
> Thunderbolt port. ACPI systems use the ExternalFacingPort property [3].
> Add an equivalent mechanism to device tree.
> 
> [1] https://lore.kernel.org/linux-pci/20190402131548.41949-1-jean-philippe.brucker@arm.com/
> [2] https://lkml.org/lkml/2018/11/26/631
> [3] https://docs.microsoft.com/en-us/windows-hardware/drivers/pci/dsd-for-pcie-root-ports#identifying-externally-exposed-pcie-root-ports
> 
> Jean-Philippe Brucker (2):
>   dt-bindings: Add external-facing PCIe port property
>   PCI: OF: Support external-facing property
> 
>  Documentation/devicetree/bindings/pci/pci.txt | 50 +++++++++++++++++++
>  drivers/pci/of.c                              | 14 ++++--
>  2 files changed, 60 insertions(+), 4 deletions(-)

Applied to pci/enumeration for v5.2, thanks, and thanks for fixing the NULL
pointer issue!
