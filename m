From: kbuild test robot <lkp@intel.com>
Subject: [RFC PATCH] dmaengine: sf-pdma: sf_pdma_disclaim_chan() can be static
Date: Sun, 13 Oct 2019 21:04:47 +0800
Message-ID: <20191013130447.2t2hbjcaatguytm3@332d0cec05f4>
References: <20191003090945.29210-4-green.wan@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20191003090945.29210-4-green.wan@sifive.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@sifive.com>, Sagar Kadam <sagar.kadam@sifive.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, linux-riscv@lists.infradead.org, "Paul E. McKenney" <paulmck@linux.ibm.com>, Vinod Koul <vkoul@kernel.org>, linux-hackers@sifive.com, devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Green Wan <green.wan@sifive.com>, Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Dan Williams <dan.j.williams@intel.com>, kbuild-all@lists.01.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Yash Shah <yash.shah@sifive.com>, dmaengine@vger.kernel.org, Bin Meng <bmeng.cn@gmail.com>, "David S. Miller" <davem@davemloft.net>
List-Id: devicetree@vger.kernel.org


Fixes: 31c3b98b5a01 ("dmaengine: sf-pdma: add platform DMA support for HiFive Unleashed A00")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 sf-pdma.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/sf-pdma/sf-pdma.c b/drivers/dma/sf-pdma/sf-pdma.c
index 70197ad95c1a6..973ed9d8cfa44 100644
--- a/drivers/dma/sf-pdma/sf-pdma.c
+++ b/drivers/dma/sf-pdma/sf-pdma.c
@@ -97,14 +97,14 @@ static void sf_pdma_fill_desc(struct sf_pdma_chan *chan,
 	writeq(src, regs->src_addr);
 }
 
-void sf_pdma_disclaim_chan(struct sf_pdma_chan *chan)
+static void sf_pdma_disclaim_chan(struct sf_pdma_chan *chan)
 {
 	struct pdma_regs *regs = &chan->regs;
 
 	writel(PDMA_CLEAR_CTRL, regs->ctrl);
 }
 
-struct dma_async_tx_descriptor *
+static struct dma_async_tx_descriptor *
 	sf_pdma_prep_dma_memcpy(struct dma_chan *dchan,
 				dma_addr_t dest,
 				dma_addr_t src,
