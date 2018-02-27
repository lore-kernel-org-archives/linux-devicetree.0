From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH v4 5/6] arm: dts: pxa: use reworked NAND controller driver
Date: Tue, 27 Feb 2018 21:09:51 +0100
Message-ID: <87efl66vow.fsf@belgarion.home>
References: <20180219223557.2458-1-miquel.raynal@bootlin.com>
 <20180219223557.2458-6-miquel.raynal@bootlin.com>
 <20180222104618.1ff78b52@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20180222104618.1ff78b52@bbrezillon> (Boris Brezillon's message
 of "Thu, 22 Feb 2018 10:46:18 +0100")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: devicetree@vger.kernel.org, Eric Miao <eric.y.miao@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Antoine Tenart <antoine.tenart@bootlin.com>, Richard Weinberger <richard@nod.at>, Gregory Clement <gregory.clement@bootlin.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Haojian Zhuang <haojian.zhuang@gmail.com>, Nadav Haklai <nadavh@marvell.com>, Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel <linux-arm-kernel-bounces@lists.infradead.org>, Daniel Mack <daniel@zonque.org>
List-Id: devicetree@vger.kernel.org

Boris Brezillon <boris.brezillon@bootlin.com> writes:

> +Arnd and the LAKML
>
> Hi Miquel,
>
> Please try to Cc the LAKML and the arm-soc maintainers when you send DT
> changes.
>
> Arnd, Robert, I'd like to apply this patch through the MTD tree since
> it depends on patch 1 of this series ("mtd: nand: use Marvell reworked
> NAND controller driver with all platforms").
> Otherwise, I can leave it to Robert for 4.18.

This one looks conflict free, so I have no objection if you carry it through
your tree.

Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.

--
Robert

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
