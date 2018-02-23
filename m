From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH v4 1/6] mtd: nand: use Marvell reworked NAND controller
 driver with all platforms
Date: Fri, 23 Feb 2018 21:40:26 +0100
Message-ID: <87tvu7783p.fsf@belgarion.home>
References: <20180219223557.2458-1-miquel.raynal@bootlin.com>
 <20180219223557.2458-2-miquel.raynal@bootlin.com>
 <20180222104943.5a155319@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20180222104943.5a155319@bbrezillon> (Boris Brezillon's message
 of "Thu, 22 Feb 2018 10:49:43 +0100")
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
> Arnd, Robert, I'd like to apply this patch through the MTD tree so
> we can get rid of the pxa driver in 4.17. Robert already gave his
> Tested-by, but I wanted to make sure this was okay for me to take it
> through the MTD tree. I can provide an immutable branch if needed.
>
> Thanks,
>
> Boris
Hi Boris,

As I'm expecting conflicts in the pxa tree this next cycle (I have gpio, mtd and
the normal pxa tree in mind), an immutable branch is needed for me please. I'll
merge it into the pxa/for-next tree just to be sure I have all the conflict
covered.

Cheers.

--
Robert

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
