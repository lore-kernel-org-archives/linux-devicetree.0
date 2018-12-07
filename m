From: Christophe Kerello <christophe.kerello@st.com>
Subject: Re: [ v3 2/3] mtd: rawnand: stm32_fmc2: add STM32 FMC2 NAND flash
 controller driver
Date: Fri, 7 Dec 2018 11:53:10 +0100
Message-ID: <cb694a48-9b81-1d7d-08ea-910f37772aed@st.com>
References: <1543509663-26128-1-git-send-email-christophe.kerello@st.com>
 <1543509663-26128-3-git-send-email-christophe.kerello@st.com>
 <20181207111808.144fc3f0@xps13>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181207111808.144fc3f0@xps13>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: boris.brezillon@bootlin.com, richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

Hi Miquèl,

This patchset already takes into account new framework modifications 
done by Boris (3rd batch of cleanups).

The select_chip hook is not used any more in this patchset and 
exec_op/setup_data_interface hooks have been moved to 
nand_controller_ops structure.

static const struct nand_controller_ops stm32_fmc2_nand_controller_ops = {
	.attach_chip = stm32_fmc2_attach_chip,
	.exec_op = stm32_fmc2_exec_op,
	.setup_data_interface = stm32_fmc2_setup_interface,
};

Regards,
Christophe Kerello.

On 12/7/18 11:18 AM, Miquel Raynal wrote:
> Hi Christophe,
> 
> Christophe Kerello <christophe.kerello@st.com> wrote on Thu, 29 Nov
> 2018 17:41:02 +0100:
> 
>> The driver adds the support for the STMicroelectronics FMC2 NAND
>> Controller found on STM32MP SOCs.
>>
>> This patch is based on FMC2 command sequencer.
>> The purpose of the command sequencer is to facilitate the programming
>> and the reading of NAND flash pages with the ECC and to free the CPU
>> of sequencing tasks.
>> It requires one DMA channel for write and two DMA channels for read
>> operations.
>>
>> Only NAND_ECC_HW mode is actually supported.
>> The driver supports a maximum 8k page size.
>> The following ECC strength and step size are currently supported:
>>   - nand-ecc-strength = <8>, nand-ecc-step-size = <512> (BCH8)
>>   - nand-ecc-strength = <4>, nand-ecc-step-size = <512> (BCH4)
>>   - nand-ecc-strength = <1>, nand-ecc-step-size = <512> (Extended ECC
>>     based on Hamming)
>>
>> This patch has been tested on Micron MT29F8G08ABACAH4 and
>> MT29F8G16ABACAH4
>>
>> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
>> ---
> 
> The driver look's good to me. However, Boris contributed new
> cleanups that I would like you to take into account before doing
> another 'deep' review. Please rebase on top of nand/next and have
> a look at the followingcommits. For the ->select_chip() hook, it
> should not be exposed anymore and switches should be handled
> locally by the driver (you have examples).
> 
> 7a08dbaedd36 mtd: rawnand: Move ->setup_data_interface() to nand_controller_ops
> f2abfeb2078b mtd: rawnand: Move the ->exec_op() method to nand_controller_ops
> 7d6c37e90cf9 mtd: rawnand: Deprecate the ->select_chip() hook
> 1770022ffa85 mtd: rawnand: ams-delta: Stop implementing ->select_chip()
> 653c57c7da08 mtd: rawnand: vf610: Stop implementing ->select_chip()
> 2ace451cae22 mtd: rawnand: tegra: Stop implementing ->select_chip()
> b25251414f6e mtd: rawnand: marvell: Stop implementing ->select_chip()
> 550b9fc4e3af mtd: rawnand: fsmc: Stop implementing ->select_chip()
> 02b4a52604a4 mtd: rawnand: Make ->select_chip() optional when ->exec_op() is implemented
> ae2294b10b0f mtd: rawnand: Pass the CS line to be selected in struct nand_operation
> 1d0178593d14 mtd: rawnand: Add nand_[de]select_target() helpers
> 
> While at it, could you also address Linus W. comments.
> 
> Thanks,
> Miquèl
> 
