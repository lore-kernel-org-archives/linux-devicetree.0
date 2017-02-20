From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 1/3] mtd: nand: Cleanup/rework the atmel_nand driver
Date: Mon, 20 Feb 2017 22:27:17 +0200
Message-ID: <CAHp75VdwQGP-qa0c0KQwrdpZmCGc3RuEsJ-E-XLbBzQSn4Yxcg@mail.gmail.com>
References: <1487593718-20752-1-git-send-email-boris.brezillon@free-electrons.com>
 <1487593718-20752-2-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1487593718-20752-2-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>, Nicolas Ferre <nicolas.ferre@atmel.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Haavard Skinnemoen <hskinnemoen@gmail.com>, Hans-Christian Egtvedt <egtvedt@samfundet.no>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Wenyou Yang <wenyou.yang@atmel.com>, Josh Wu <rainyfeeling@outlook.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 20, 2017 at 2:28 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:

>  drivers/mtd/nand/atmel/nand-controller.c | 2269 +++++++++++++++++++++++++++
>  drivers/mtd/nand/atmel_nand.c            | 2479 ------------------------------

Does -M -C help you?
At least it would help reviewers

-- 
With Best Regards,
Andy Shevchenko
