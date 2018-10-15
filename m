From: Christophe Kerello <christophe.kerello@st.com>
Subject: Re: [PATCH v2 2/3] mtd: rawnand: stm32_fmc2: add STM32 FMC2 NAND
 flash controller driver
Date: Mon, 15 Oct 2018 10:09:49 +0200
Message-ID: <b10a3919-7b86-c177-2254-30d32ac6f25e@st.com>
References: <1538732520-2800-1-git-send-email-christophe.kerello@st.com>
 <1538732520-2800-3-git-send-email-christophe.kerello@st.com>
 <20181005115809.55356782@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181005115809.55356782@bbrezillon>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org



On 10/05/2018 11:58 AM, Boris Brezillon wrote:
> On Fri, 5 Oct 2018 11:41:59 +0200
> <christophe.kerello@st.com> wrote:
> 
>> +struct stm32_fmc2 {
> 
> You should inherit from nand_controller even if the nand_chip already
> embeds a dummy nand controller object.
> 
> 	struct nand_controller base;
> 

Hi Boris,

Ok, i will add and handle the nand controller structure.

Regards,
Christophe Kerello.

>> +	struct stm32_fmc2_nand nand;
>> +	struct device *dev;
>> +	void __iomem *io_base;
>> +	void __iomem *data_base[FMC2_MAX_CE];
>> +	void __iomem *cmd_base[FMC2_MAX_CE];
>> +	void __iomem *addr_base[FMC2_MAX_CE];
>> +	phys_addr_t io_phys_addr;
>> +	phys_addr_t data_phys_addr[FMC2_MAX_CE];
>> +	struct clk *clk;
>> +
>> +	struct dma_chan *dma_tx_ch;
>> +	struct dma_chan *dma_rx_ch;
>> +	struct dma_chan *dma_ecc_ch;
>> +	struct sg_table dma_data_sg;
>> +	struct sg_table dma_ecc_sg;
>> +	u8 *ecc_buf;
>> +	int dma_ecc_len;
>> +
>> +	struct completion complete;
>> +	struct completion dma_data_complete;
>> +	struct completion dma_ecc_complete;
>> +
>> +	u8 cs_assigned;
>> +	int cs_sel;
>> +};
