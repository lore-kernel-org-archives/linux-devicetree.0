From: Benjamin GAIGNARD <benjamin.gaignard@st.com>
Subject: Re: [Linux-stm32] [ v3 2/3] mtd: rawnand: stm32_fmc2: add STM32 FMC2
 NAND flash controller driver
Date: Fri, 7 Dec 2018 10:21:38 +0000
Message-ID: <dafcda21-fceb-1577-7f1c-41f1009b99a7@st.com>
References: <1543509663-26128-1-git-send-email-christophe.kerello@st.com>
 <1543509663-26128-3-git-send-email-christophe.kerello@st.com>
 <CACRpkdb83-kEwrip+t8g2VVFiREXspfWKQa2=Zd1ah1sSLNHjQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdb83-kEwrip+t8g2VVFiREXspfWKQa2=Zd1ah1sSLNHjQ@mail.gmail.com>
Content-Language: en-US
Content-ID: <078A5EA132870140BCEA3C0D522F978E@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>, Christophe KERELLO <christophe.kerello@st.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger <richard@nod.at>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, =?utf-8?B?TWlxdcOobCBSYXluYWw=?= <miquel.raynal@bootlin.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>
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

No, it is the same story than for stmfx driver, it looks to be the same 
from registers

point of view but internal hardware block design is completely different.

>
> If that is the case I think it should at least be mentioned in commit
> logs and DT bindings and possibly in a comment on the driver
> itself.
>
> Yours,
> Linus Walleij
> _______________________________________________
> Linux-stm32 mailing list
> Linux-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
