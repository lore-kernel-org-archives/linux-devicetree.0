From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH v2] mtd: nand: marvell: Fix clock resource by adding a
 register clock
Date: Mon, 12 Mar 2018 20:35:29 +0100
Message-ID: <20180312203529.7963ef29@bbrezillon>
References: <20180307161316.14612-1-gregory.clement@bootlin.com>
 <20180307204418.014622b8@bbrezillon> <87vae11bep.fsf@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <87vae11bep.fsf@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Rob Herring <robh@kernel.org>, Antoine Tenart <antoine.tenart@bootlin.com>, Hanna Hawa <hannah@marvell.com>, Omri Itach <omrii@marvell.com>, Nadav Haklai <nadavh@marvell.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-mtd@lists.infradead.org, Igal Liberman <igall@marvell.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Shadi Ammouri <shadi@marvell.com>, Marcin Wojtas <mw@semihalf.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Mon, 12 Mar 2018 17:55:26 +0100
Gregory CLEMENT <gregory.clement@bootlin.com> wrote:

> >  
> >>  	struct completion complete;
> >>  	unsigned long assigned_cs;
> >>  	struct list_head chips;
> >> @@ -2747,12 +2748,24 @@ static int marvell_nfc_probe(struct platform_device *pdev)
> >>  	if (ret)
> >>  		return ret;
> >>  
> >> +	nfc->reg_clk = devm_clk_get(&pdev->dev, "reg");
> >> +	if (PTR_ERR(nfc->reg_clk) != -ENOENT) {
> >> +		if (!IS_ERR(nfc->reg_clk)) {
> >> +			ret = clk_prepare_enable(nfc->reg_clk);
> >> +			if (ret)
> >> +				goto unprepare_clk;  
> >
> > I already suggested to move the devm_clk_get(&pdev->dev, "reg") before
> > the clk_prepare_enable(nfc->ecc_clk) one to simplify the error path.
> >  
> 
> Actually I started to implement your suggestion but unlike what you
> though it made the code less simpler. Indeed by having the mandatory
> clock first than in case of failure we can directly exit the function.
> 
> If the reg clock was initialized first, then if the core/ecc clock fail
> in soem case we woudl need to daisbel the reg clock and in other case we
> could directly exit.

Well, it's pretty much the same problem if you do it in the order you
propose here: if the core clk enable fails, you'll have to disable the
reg clk. Plus, I'm not a big fan of if/else block imbrications when we
can avoid them.

> 
> 
> >> +		} else {
> >> +			ret = PTR_ERR(nfc->reg_clk);
> >> +			goto unprepare_clk;
> >> +		}
> >> +	}  
> >
> > So nfc->reg_clk stays assigned to -ENOENT if the clk is not present, and
> > clk_disable_unprepare() will manipulate an invalid pointer when called
> > from the error or ->remove() path.  
> 
> I think you missed the fact that the clk_disable_unprepare() function
> managed the invalid pointer, have a look on the functions and you will
> see that IS_ERR() is used, so there is no point to set the pointer to NULL.

Right. I just checked the clk_prepare() implementation which is
checking for NULL value only and I thought clk_disable() and
clk_unprepare() were doing the same, which apparently is not the case.


-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
