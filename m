From: Willy Tarreau <w@1wt.eu>
Subject: Re: [PATCH v3 0/7] Marvell NAND controller rework with ->exec_op()
Date: Thu, 11 Jan 2018 23:28:33 +0100
Message-ID: <20180111222833.GA15584@1wt.eu>
References: <20180109103637.23798-1-miquel.raynal@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180109103637.23798-1-miquel.raynal@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Miquel Raynal <miquel.raynal@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Catalin Marinas <catalin.marinas@arm.com>, Hanna Hawa <hannah@marvell.com>, Will Deacon <will.deacon@arm.com>, Nadav Haklai <nadavh@marvell.com>, linux-mtd@lists.infradead.org, Robert Jarzmik <robert.jarzmik@free.fr>, Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>, Marek Vasut <marek.vasut@gmail.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Haojian Zhuang <haojian.zhuang@gmail.com>, Rob Herring <robh+dt@kernel.org>, Gregory Clement <gregory.clement@free-electrons.com>, Ofer Heifetz <oferh@marvell.com>, linux-arm-kernel@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
List-Id: devicetree@vger.kernel.org

Hi Miquel,

On Tue, Jan 09, 2018 at 11:36:30AM +0100, Miquel Raynal wrote:
> These changes have been tested on:
>    - PXA3xx platform with a CM-X300 board (2kiB page NAND, 1b/512B
>      strength, Hamming ECC engine) [32 bits]
>    - Armada 385 DB AP (4kiB page NAND, 4b/512B, BCH ECC engine) [32 bits]
>    - Armada 398 DB (4kiB page NAND, 8b/512B, BCH ECC engine using a layout
>      with a last chunk different than the others) [32 bits]
>    - Armada 7040 DB and Armada 8040 DB (4kiB page NAND, 4b/512B, BCH ECC
>      engine) [64 bits]
>    - Triax dvb-tc board (2kiB page NAND, 4b/512B, BCH ECC engine) [32 bits]

If you're interested, I have a mirabox with an armada 370 which uses the
same driver. I've not powered it up for a while but if that can be useful
I can try to find some time for this.

Just let me know
Willy
