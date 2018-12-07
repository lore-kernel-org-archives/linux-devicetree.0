From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [ v3 2/3] mtd: rawnand: stm32_fmc2: add STM32 FMC2 NAND flash
 controller driver
Date: Fri, 7 Dec 2018 10:06:03 +0100
Message-ID: <CACRpkdb83-kEwrip+t8g2VVFiREXspfWKQa2=Zd1ah1sSLNHjQ@mail.gmail.com>
References: <1543509663-26128-1-git-send-email-christophe.kerello@st.com> <1543509663-26128-3-git-send-email-christophe.kerello@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1543509663-26128-3-git-send-email-christophe.kerello@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: christophe.kerello@st.com
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Mark Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-mtd@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

Hi Christophe,

On Thu, Nov 29, 2018 at 5:42 PM Christophe Kerello
<christophe.kerello@st.com> wrote:

> +/* FMC2 Controller Registers */
> +#define FMC2_BCR1                      0x0
> +#define FMC2_PCR                       0x80
(...)
> +/* Register: FMC2_BCR1 */
> +#define FMC2_BCR1_FMC2EN               BIT(31)

Well this looks like an especially clever register map and a specific choice
of bit 31 in the fist register to activate FMC2. Registers 0x04 thru
0x7c are completely unused save for one bit.

It's almost like this is the good old FSMC integrated in parallel with FMC2,
so that if you don't set bit 31, this becomes something that can be used
with drivers/mtd/nand/raw/fsmc_nand.c, and FMC2 mode is activated
by setting this bit, activating all the new registers.

It wouldn't surprise me given how HW designers like to work.

Is this the case?

If that is the case I think it should at least be mentioned in commit
logs and DT bindings and possibly in a comment on the driver
itself.

Yours,
Linus Walleij
