From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH 00/12] Marvell NAND controller rework with ->exec_op()
Date: Mon, 18 Dec 2017 08:11:35 +0100
Message-ID: <877etkecig.fsf@belgarion.home>
References: <20171207201814.30411-1-miquel.raynal@free-electrons.com>
 <20171214070930.0b885f6d@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20171214070930.0b885f6d@bbrezillon> (Boris Brezillon's message
 of "Thu, 14 Dec 2017 07:09:30 +0100")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Miquel Raynal <miquel.raynal@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Catalin Marinas <catalin.marinas@arm.com>, Hanna Hawa <hannah@marvell.com>, Will Deacon <will.deacon@arm.com>, Nadav Haklai <nadavh@marvell.com>, linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>, Marek Vasut <marek.vasut@gmail.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Haojian Zhuang <haojian.zhuang@gmail.com>, Rob Herring <robh+dt@kernel.org>, Gregory Clement <gregory.clement@free-electrons.com>, Ofer Heifetz <oferh@marvell.com>, linux-arm-kernel@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Eric Miao <eric.y.miao@gmail.com>, Antoine Tenart <antoine.tenart@free-electrons.com>, Cyri
List-Id: devicetree@vger.kernel.org

Boris Brezillon <boris.brezillon@free-electrons.com> writes:

>> Robert, it would be great if you could also do more testing on PXA and
>> validate this driver. If needed, a branch ready to be tested is
>> available at [3]. It is based on nand/next and has all the changes
>> brought by the previously mentionned series as well as this one.
>
> Robert, do you think you'll have some time to test Miquel's branch on
> your PXA boards? Miquel already tested on one of these boards (CM-X300),
> but we'd like to have other testers. Also feel free to review the
> driver if have the time.
>
> Thanks,
>
> Boris

Hi Boris and Miquel,

I have applied the whole serie to linux-next yesterday.

A boot attempt on my zylonite with my old defconfig (with the new Marvell NAND
config activated) yields to :
 - this message
[    3.136818] marvell-nfc pxa3xx-nand: could not identify the nand chip
[    3.143874] marvell-nfc: probe of pxa3xx-nand failed with error -22
 - then my board hangs

Is there something to be done to improve the trace level so that you can guess
what's happening ?

Cheers.

--
Robert
