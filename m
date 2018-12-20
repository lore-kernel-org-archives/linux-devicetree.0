From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH v4 2/3] mtd: rawnand: stm32_fmc2: add STM32 FMC2 NAND
 flash controller driver
Date: Thu, 20 Dec 2018 14:43:57 +0100
Message-ID: <20181220144357.630df47c@bbrezillon>
References: <1544781488-18723-1-git-send-email-christophe.kerello@st.com>
        <1544781488-18723-3-git-send-email-christophe.kerello@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544781488-18723-3-git-send-email-christophe.kerello@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Christophe Kerello <christophe.kerello@st.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

On Fri, 14 Dec 2018 10:58:07 +0100
Christophe Kerello <christophe.kerello@st.com> wrote:

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
>  - nand-ecc-strength = <1>, nand-ecc-step-size = <512> (Extended ECC
>    based on Hamming)
> 
> This patch has been tested on Micron MT29F8G08ABACAH4 and
> MT29F8G16ABACAH4
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>

Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>
