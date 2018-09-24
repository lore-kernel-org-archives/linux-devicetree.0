From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH 2/3] mtd: rawnand: stm32_fmc2: add STM32 FMC2 NAND flash
 controller driver
Date: Mon, 24 Sep 2018 19:23:56 +0200
Message-ID: <20180924192356.5f2e56fd@bbrezillon>
References: <1537199260-7280-1-git-send-email-christophe.kerello@st.com>
        <1537199260-7280-3-git-send-email-christophe.kerello@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1537199260-7280-3-git-send-email-christophe.kerello@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: christophe.kerello@st.com
Cc: miquel.raynal@bootlin.com, richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

Hi Christophe,

On Mon, 17 Sep 2018 17:47:39 +0200
<christophe.kerello@st.com> wrote:

> +struct stm32_fmc2 {
> +	struct nand_chip chip;
> +	struct device *dev;
> +	void __iomem *io_base;
> +	void __iomem *data_base[FMC2_MAX_CE];
> +	void __iomem *cmd_base[FMC2_MAX_CE];
> +	void __iomem *addr_base[FMC2_MAX_CE];
> +	phys_addr_t io_phys_addr;
> +	phys_addr_t data_phys_addr[FMC2_MAX_CE];
> +	struct clk *clk;
> +
> +	struct dma_chan *dma_tx_ch;
> +	struct dma_chan *dma_rx_ch;
> +	struct dma_chan *dma_ecc_ch;
> +	struct sg_table dma_data_sg;
> +	struct sg_table dma_ecc_sg;
> +	u8 *ecc_buf;
> +	int dma_ecc_len;
> +
> +	struct completion complete;
> +	struct completion dma_data_complete;
> +	struct completion dma_ecc_complete;
> +
> +	struct stm32_fmc2_timings timings;
> +	u8 cs_assigned;
> +	int cs_sel;
> +	int ncs;
> +	int cs_used[FMC2_MAX_CE];
> +};

Can we have a clear separation between the NAND controller and NAND
chip structures. I know you only support a single chip per-controller
right now, but I prefer to have things clearly separated from the
beginning. 

Regards,

Boris
