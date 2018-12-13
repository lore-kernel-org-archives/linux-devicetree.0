From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [ v3 2/3] mtd: rawnand: stm32_fmc2: add STM32 FMC2 NAND flash
 controller driver
Date: Thu, 13 Dec 2018 11:45:35 +0100
Message-ID: <CACRpkdbiX=9tDnE+tR7Jj-QEY_=_MvS9v8Jg8X7MzQcX7aPp-Q@mail.gmail.com>
References: <1543509663-26128-1-git-send-email-christophe.kerello@st.com>
 <1543509663-26128-3-git-send-email-christophe.kerello@st.com>
 <CACRpkdb83-kEwrip+t8g2VVFiREXspfWKQa2=Zd1ah1sSLNHjQ@mail.gmail.com> <7c295246-8756-9363-a891-856ddf7af92b@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7c295246-8756-9363-a891-856ddf7af92b@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: christophe.kerello@st.com
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Mark Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-mtd@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

On Fri, Dec 7, 2018 at 5:53 PM Christophe Kerello
<christophe.kerello@st.com> wrote:
> On 12/7/18 10:06 AM, Linus Walleij wrote:

> Based on FMC2 datasheet,
> The FMC2 controller includes 2 memory controllers:
>   - the NOR/PSRAM memory controller
>   - the NAND memory controller
>
> The NOR/PSRAM controller mapping is starting at 0.
> The NAND controller mapping is starting at 0x80.
>
> We have only planned to develop a driver for the NAND memory controller.
> There is currently no customer request to develop the NOR/PSRAM memory
> controller.

OK I get it, so there is no FSMC (v1), but a NOR controller, thanks!

If people need to access the NOR controller I think they can just patch
your driver to handle both or have a second driver on the side
(I suspect the pins are anyways set up such that you can just
use either NOR or NAND.)

Yours,
Linus Walleij
