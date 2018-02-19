From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: PCI: MediaTek: fix dtc warnings
Date: Sun, 18 Feb 2018 21:10:59 -0600
Message-ID: <20180219031059.jdv3q4big6c4ra7p@rob-hp-laptop>
References: <9940757fe2889f46d0de214c5f277bf3c2074205.1518577579.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <9940757fe2889f46d0de214c5f277bf3c2074205.1518577579.git.ryder.lee@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 14, 2018 at 11:27:58AM +0800, Ryder Lee wrote:
> dtc recently added PCI bus checks. Fix these warnings:
> 
> Warning (pci_bridge): Node /pcie@1a140000/pcie@0,0 missing bus-range for PCI bridge
> Warning (pci_bridge): Node /pcie@1a140000/pcie@1,0 missing bus-range for PCI bridge
> Warning (pci_bridge): Node /pcie@1a140000/pcie@2,0 missing bus-range for PCI bridge
> Warning (unit_address_format): Failed prerequisite 'pci_bridge'
> Warning (pci_device_reg): Failed prerequisite 'pci_bridge'
> Warning (pci_device_bus_num): Failed prerequisite 'pci_bridge'
> 
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  Documentation/devicetree/bindings/pci/mediatek-pcie.txt | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
