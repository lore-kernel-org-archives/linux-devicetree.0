From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] PCI: layerscape: Add 'dma-coherent' property
Date: Wed, 8 Jun 2016 14:54:43 -0500
Message-ID: <20160608195443.GA7766@rob-hp-laptop>
References: <1465282546-28256-1-git-send-email-Gang.Liu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1465282546-28256-1-git-send-email-Gang.Liu@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Liu Gang <Gang.Liu@nxp.com>
Cc: devicetree@vger.kernel.org, leoyang.li@nxp.com, minghuan.lian@nxp.com, linux-arm-kernel@lists.infradead.org, scott.wood@nxp.com, shawnguo@kernel.org, mingkai.hu@nxp.com
List-Id: devicetree@vger.kernel.org

On Tue, Jun 07, 2016 at 02:55:45PM +0800, Liu Gang wrote:
> Add 'dma-coherent' description for PCI nodes.
> 
> The 'dma-coherent' indicates that the hardware IP block can ensure
> the coherency of the data transferred from/to the IP block. This
> can avoid the software cache flush/invalid actions, and improve
> the performance significantly.
> 
> The PCI IP block of ls1043a has this capability, so adding
> this feature to improve the PCI performance.
> 
> Signed-off-by: Liu Gang <Gang.Liu@nxp.com>
> ---
>  Documentation/devicetree/bindings/pci/layerscape-pci.txt | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>

> 
> diff --git a/Documentation/devicetree/bindings/pci/layerscape-pci.txt b/Documentation/devicetree/bindings/pci/layerscape-pci.txt
> index ef683b2..41e9f55 100644
> --- a/Documentation/devicetree/bindings/pci/layerscape-pci.txt
> +++ b/Documentation/devicetree/bindings/pci/layerscape-pci.txt
> @@ -24,6 +24,9 @@ Required properties:
>    The first entry must be a link to the SCFG device node
>    The second entry must be '0' or '1' based on physical PCIe controller index.
>    This is used to get SCFG PEXN registers
> +- dma-coherent: Indicates that the hardware IP block can ensure the coherency
> +  of the data transferred from/to the IP block. This can avoid the software
> +  cache flush/invalid actions, and improve the performance significantly.
>  
>  Example:
>  
> @@ -38,6 +41,7 @@ Example:
>  		#address-cells = <3>;
>  		#size-cells = <2>;
>  		device_type = "pci";
> +		dma-coherent;
>  		num-lanes = <4>;
>  		bus-range = <0x0 0xff>;
>  		ranges = <0x81000000 0x0 0x00000000 0x40 0x00010000 0x0 0x00010000   /* downstream I/O */
> -- 
> 2.1.0.27.g96db324
> 
