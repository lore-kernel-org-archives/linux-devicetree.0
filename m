From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/2] dt-bindings: Document the Synopsys DW AXI DMA
 bindings
Date: Wed, 7 Mar 2018 19:56:36 -0600
Message-ID: <20180308015636.vqn5t6syuo7kae4r@rob-hp-laptop>
References: <20180306114615.8895-1-Eugeniy.Paltsev@synopsys.com>
 <20180306114615.8895-3-Eugeniy.Paltsev@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180306114615.8895-3-Eugeniy.Paltsev@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Cc: dmaengine@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, Wan Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>, Andy Shevchenko <andy.shevchenko@gmail.com>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 06, 2018 at 02:46:15PM +0300, Eugeniy Paltsev wrote:
> This patch adds documentation of device tree bindings for the Synopsys
> DesignWare AXI DMA controller.
> 
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> ---
> Changes v2->v3:
>  * None.
> 
>  .../devicetree/bindings/dma/snps,dw-axi-dmac.txt   | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.txt

Reviewed-by: Rob Herring <robh@kernel.org>
