From: Willy Tarreau <w@1wt.eu>
Subject: Re: [PATCH v2 3/5] mtd: nand: replace pxa3xx_nand driver by its
 rework called marvell_nand
Date: Fri, 22 Dec 2017 23:00:56 +0100
Message-ID: <20171222220056.GB14055@1wt.eu>
References: <20171219132942.27433-1-miquel.raynal@free-electrons.com>
 <20171219132942.27433-4-miquel.raynal@free-electrons.com>
 <87608ycwx5.fsf@belgarion.home>
 <20171222221032.30f83cb5@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20171222221032.30f83cb5@bbrezillon>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Catalin Marinas <catalin.marinas@arm.com>, Hanna Hawa <hannah@marvell.com>, Will Deacon <will.deacon@arm.com>, Nadav Haklai <nadavh@marvell.com>, linux-mtd@lists.infradead.org, Robert Jarzmik <robert.jarzmik@free.fr>, Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>, Marek Vasut <marek.vasut@gmail.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Haojian Zhuang <haojian.zhuang@gmail.com>, Rob Herring <robh+dt@kernel.org>, Miquel Raynal <miquel.raynal@free-electrons.com>, Gregory Clement <gregory.clement@free-electrons.com>, Ofer Heifetz <oferh@marvell.com>, linux-arm-kernel@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 22, 2017 at 10:10:32PM +0100, Boris Brezillon wrote:
> On Fri, 22 Dec 2017 21:47:18 +0100
> Robert Jarzmik <robert.jarzmik@free.fr> wrote:
> > What I would propose instead is :
> >  - keep both the new marvell nand driver and the old pxa3xx_nand driver
> >  - switch pxa_defconfig to compile them both
> >  - continue testing (with my help)
> > 
> > Once I see the marvell_nand is working properly, we can remove pca3xx_nand in a
> > second stage, keeping the pxa platform functional all along.
> > 
> > Would you agree to that path ?
> 
> Hm, I tried this approach already (with Marvell's crypto engine) and it
> doesn't quite solve the problem, just delay it a bit until someone
> decides to remove the old driver. In my experience, people only start
> testing the new driver when they're forced to do it (IOW, when the old
> driver is removed and defconfigs are patched to use the new one). So
> let's find a way to fix the remaining issues you have instead of
> delaying the inevitable.

That also reminds me of the old vs new PATA/IDE drivers a long time ago.
A number of us would stay on the old ones because we were satisfied,
never really making the effort to migrate until it we were really forced.

For the NAND, I think that if the old driver had to coexist with the new
one, at the very least the config option name must change so that it's
not selected by default by make oldconfig, and it's clearly written that
it is not maintained anymore, may be broken and that any one having a
good reason to use it must absolutely contact the maintainer to get the
other one fixed.

Just my two cents,
Willy
