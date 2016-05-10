From: Romain Izard <romain.izard.pro@gmail.com>
Subject: Re: [PATCH 1/2] Revert "mtd: atmel_nand: Support variable RB_EDGE interrupts"
Date: Tue, 10 May 2016 11:59:29 +0200
Message-ID: <CAGkQfmPm16sgizhWJEH8onHR+4hC2an9m1k8=AqoNjsK3EeU3Q@mail.gmail.com>
References: <1462776680-5284-1-git-send-email-wenyou.yang@atmel.com>
 <1462776680-5284-2-git-send-email-wenyou.yang@atmel.com> <20160510105549.50b60d8c@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160510105549.50b60d8c@bbrezillon>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Wenyou Yang <wenyou.yang@atmel.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Brown <broonie@kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Josh Wu <rainyfeeling@outlook.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, LKML <linux-kernel@vger.kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, linux-mtd@lists.infradead.org, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Boris,

2016-05-10 10:55 GMT+02:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
>
> Romain, I thought you had a real use case on sama5d4 where this patch
> was needed to make the whole thing work. Not sure why you submitted
> this patch if you couldn't test it on a real board.

My target CPU is SAMA5D2, but I chose the SAMA5D4 for the compatible
string as it was the earliest design whose datasheet mentioned the
RB_EDGE3 bit.

I wrote the SAMA5D2 support in advance, as I was waiting for my board to
be ready, basing myself on what was found in the datasheet.  The changes
included both the variable RB_EDGE support, and the PMECC register
layout changes, which were a prerequisite to use the SAMA5D2 NAND
controller.

I tested the code against regressions on sama5d3xek, and Wenyou reported
that he tested it on Atmel's SAMA5D2 PTC, which was the only existing
board at that time with both a SAMA5D2 SoC and a NAND chip.
Unfortunately, as the bug is only seen when writing on the flash, and it
only affects the speed of the device, he did not notice it.

I sent the patches early because I expected the submission process to
be long, and I wanted to be able to freeze the kernel version to be used
on my board as soon as possible.

Best regards,
-- 
Romain Izard
