From: Christophe Kerello <christophe.kerello@st.com>
Subject: Re: [ v3 2/3] mtd: rawnand: stm32_fmc2: add STM32 FMC2 NAND flash
 controller driver
Date: Fri, 7 Dec 2018 17:53:00 +0100
Message-ID: <7c295246-8756-9363-a891-856ddf7af92b@st.com>
References: <1543509663-26128-1-git-send-email-christophe.kerello@st.com>
 <1543509663-26128-3-git-send-email-christophe.kerello@st.com>
 <CACRpkdb83-kEwrip+t8g2VVFiREXspfWKQa2=Zd1ah1sSLNHjQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdb83-kEwrip+t8g2VVFiREXspfWKQa2=Zd1ah1sSLNHjQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, =?UTF-8?Q?Miqu=c3=a8l_Raynal?= <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Mark Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-mtd@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

On 12/7/18 10:06 AM, Linus Walleij wrote:
> Hi Christophe,
> 
> On Thu, Nov 29, 2018 at 5:42 PM Christophe Kerello
> <christophe.kerello@st.com> wrote:
> 
>> +/* FMC2 Controller Registers */
>> +#define FMC2_BCR1                      0x0
>> +#define FMC2_PCR                       0x80
> (...)
>> +/* Register: FMC2_BCR1 */
>> +#define FMC2_BCR1_FMC2EN               BIT(31)
> 
> Well this looks like an especially clever register map and a specific choice
> of bit 31 in the fist register to activate FMC2. Registers 0x04 thru
> 0x7c are completely unused save for one bit.
> 
> It's almost like this is the good old FSMC integrated in parallel with FMC2,
> so that if you don't set bit 31, this becomes something that can be used
> with drivers/mtd/nand/raw/fsmc_nand.c, and FMC2 mode is activated
> by setting this bit, activating all the new registers.
> 
> It wouldn't surprise me given how HW designers like to work.
> 
> Is this the case?
> 

Hi Linus,

Based on FMC2 datasheet,
The FMC2 controller includes 2 memory controllers:
  - the NOR/PSRAM memory controller
  - the NAND memory controller

The NOR/PSRAM controller mapping is starting at 0.
The NAND controller mapping is starting at 0x80.

We have only planned to develop a driver for the NAND memory controller.
There is currently no customer request to develop the NOR/PSRAM memory 
controller.

The bit FMC2_BCR1_FMC2EN is not used to switch from an IP version to 
another. After reset, the FMC2 controller is disabled. Once all the used 
memory controllers are configured, the FMC2 controller must be enabled 
by setting the FMC2EN bit in the FMC2_BCR1 register. If this bit is not 
set, the controller stays in disabled state.

Regards,
Christophe Kerello.

> If that is the case I think it should at least be mentioned in commit
> logs and DT bindings and possibly in a comment on the driver
> itself.
> 
> Yours,
> Linus Walleij
> 
