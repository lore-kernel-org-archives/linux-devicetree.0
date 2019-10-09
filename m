From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/4] dt-bindings: dmaengine: sf-pdma: add bindins for
 SiFive PDMA
Date: Wed, 9 Oct 2019 18:34:01 -0500
Message-ID: <20191009233401.GA8805@bogus>
References: <20191003090945.29210-1-green.wan@sifive.com>
 <20191003090945.29210-2-green.wan@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191003090945.29210-2-green.wan@sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-hackers@sifive.com, Green Wan <green.wan@sifive.com>, Vinod Koul <vkoul@kernel.org>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, "Paul E. McKenney" <paulmck@linux.ibm.com>, Yash Shah <yash.shah@sifive.com>, Bin Meng <bmeng.cn@gmail.com>, Sagar Kadam <sagar.kadam@sifive.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu,  3 Oct 2019 17:09:01 +0800, Green Wan wrote:
> Add DT bindings document for Platform DMA(PDMA) driver of board,
> HiFive Unleashed Rev A00.
> 
> Signed-off-by: Green Wan <green.wan@sifive.com>
> ---
>  .../bindings/dma/sifive,fu540-c000-pdma.yaml  | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
