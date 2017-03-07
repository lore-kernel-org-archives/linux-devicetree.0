From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v2 3/3] mtd: nand: Remove unused chip->write_page() hook
Date: Tue, 7 Mar 2017 21:04:50 +0900
Message-ID: <CAK7LNASNFJ6_LJBS7jyyJ3-Uv_ExTYAj+tkJTCYrpDz8_BXa3Q@mail.gmail.com>
References: <1487593718-20752-1-git-send-email-boris.brezillon@free-electrons.com>
 <1487593718-20752-4-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1487593718-20752-4-git-send-email-boris.brezillon@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Richard Weinberger <richard@nod.at>, Kumar Gala <galak@codeaurora.org>, Nicolas Ferre <nicolas.ferre@atmel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Wenyou Yang <wenyou.yang@atmel.com>, Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Josh Wu <rainyfeeling@outlook.com>, linux-mtd@lists.infradead.org, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Haavard Skinnemoen <hskinnemoen@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Hans-Christian Egtvedt <egtvedt@samfundet.no>
List-Id: devicetree@vger.kernel.org

Hi Boris,

2017-02-20 21:28 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> The last/only user of the chip->write_page() hook (the Atmel NAND
> controller driver) has been reworked and is no longer specifying a custom
> ->write_page() implementation.
> Drop this hook before someone else start abusing it.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>


Just a minor comment.


/**
 * nand_write_page - [REPLACEABLE] write one page
 * @mtd: MTD device structure


Can you update the comment block for nand_write_page(), too?

  [REPLACEABLE]  ->  [INTERNAL]




-- 
Best Regards
Masahiro Yamada
