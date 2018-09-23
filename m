From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 2/3] mtd: rawnand: stm32_fmc2: add STM32 FMC2 NAND flash
 controller driver
Date: Sun, 23 Sep 2018 13:34:51 +0200
Message-ID: <20180923133451.78c95cef@xps13>
References: <1537199260-7280-1-git-send-email-christophe.kerello@st.com>
        <1537199260-7280-3-git-send-email-christophe.kerello@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1537199260-7280-3-git-send-email-christophe.kerello@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: christophe.kerello@st.com
Cc: boris.brezillon@bootlin.com, richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

Hi Christophe,

<christophe.kerello@st.com> wrote on Mon, 17 Sep 2018 17:47:39 +0200:

> From: Christophe Kerello <christophe.kerello@st.com>
> 
> The driver adds the support for the STMicroelectronics FMC2 NAND
> Controller found on STM32MP SOCs.
> 
> This patch is based on FMC2 command sequencer.
> The purpose of the command sequencer is to facilitate the programming
> and the reading of NAND flash pages with the ECC and to free the CPU
> of sequencing tasks.
> It requires one DMA channel for write and two DMA channels for read
> operations.
> 
> Only NAND_ECC_HW mode is actually supported.
> The driver supports a maximum 8k page size.
> The following ECC strength and step size are currently supported:
>  - nand-ecc-strength = <8>, nand-ecc-step-size = <512> (BCH8)
>  - nand-ecc-strength = <4>, nand-ecc-step-size = <512> (BCH4)
>  - nand-ecc-strength = <1>, nand-ecc-step-size = <512> (Extended ecc
>    based on HAMMING)
> 
> This patch has been tested on Micron MT29F8G08ABACAH4 and
> MT29F8G16ABACAH4
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
> ---


[...]

> +/* NAND callbacks setup */
> +static void stm32_fmc2_nand_callbacks_setup(struct stm32_fmc2 *fmc2)
> +{
> +	struct nand_chip *chip = &fmc2->chip;
> +
> +	/* Specific callbacks to read/write a page */
> +	chip->ecc.correct = stm32_fmc2_ham_correct;
> +	chip->ecc.write_page = stm32_fmc2_sequencer_write_page;
> +	chip->ecc.read_page = stm32_fmc2_sequencer_read_page;
> +	chip->ecc.write_page_raw = stm32_fmc2_sequencer_write_page_raw;
> +	chip->ecc.read_page_raw = stm32_fmc2_sequencer_read_page_raw;

Are you sure all the tests in mtd-utils are successful?


Thanks,
Miquèl
