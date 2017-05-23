From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v3 5/5] mtd: mchp23k256: Add support for mchp23lcv1024
Date: Tue, 23 May 2017 03:57:23 +0200
Message-ID: <20170523015723.GL13759@lunn.ch>
References: <20170523004317.16908-1-chris.packham@alliedtelesis.co.nz>
 <20170523004317.16908-6-chris.packham@alliedtelesis.co.nz>
 <20170523005845.GI13759@lunn.ch>
 <f2d5f14ab64a412eab5eab5d572cc4a6@svr-chch-ex1.atlnz.lc>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <f2d5f14ab64a412eab5eab5d572cc4a6@svr-chch-ex1.atlnz.lc>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: Mark Rutland <mark.rutland@arm.com>, "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Richard Weinberger <richard@nod.at>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

> Agreed. How about this revised commit message
> 
> --- 8< ---
> mtd: mchp23k256: Add support for mchp23lcv1024
> 
> The mchp23lcv1024 is similar to the mchp23k256, the differences (from a 
> software point of view) are the capacity of the chip and the size of the 
> addresses used.
> 
> There is no way to detect the specific chip so we must be told via a 
> Device Tree or default to mchp23k256 when device tree is not used.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> --- >8 ---

Yes, that is good.

> Can someone fixup the commit message or should I re-send?

The less the maintainer has to do, the more likely he will do it.

But hold on a few days, and see if you get any more comments.

    Andrew

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
