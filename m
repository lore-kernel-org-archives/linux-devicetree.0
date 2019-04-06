From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: Add external-facing PCIe port property
Date: Sat, 06 Apr 2019 01:06:36 -0500
Message-ID: <5ca841ee.1c69fb81.1ba7b.707f@mx.google.com>
References: <20190402131548.41949-1-jean-philippe.brucker@arm.com>
 <20190402131548.41949-2-jean-philippe.brucker@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190402131548.41949-2-jean-philippe.brucker@arm.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Grant.Likely@arm.com, linux-pci@vger.kernel.org, Jeremy.Linton@arm.com, robh+dt@kernel.org, bhelgaas@google.com, Robin.Murphy@arm.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue,  2 Apr 2019 14:15:47 +0100, Jean-Philippe Brucker wrote:
> Provide a way for the firmware to tell the OS which devices are external
> to the machine and therefore untrusted. The property can describe for
> example Thunderbolt and other user-accessible ports, which should always
> have the strongest IOMMU protection.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
> ---
>  Documentation/devicetree/bindings/pci/pci.txt | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
