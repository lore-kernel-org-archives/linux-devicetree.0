From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v3 5/5] mtd: mchp23k256: Add support for mchp23lcv1024
Date: Tue, 23 May 2017 02:58:45 +0200
Message-ID: <20170523005845.GI13759@lunn.ch>
References: <20170523004317.16908-1-chris.packham@alliedtelesis.co.nz>
 <20170523004317.16908-6-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170523004317.16908-6-chris.packham@alliedtelesis.co.nz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Mark Rutland <mark.rutland@arm.com>, boris.brezillon@free-electrons.com, devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, May 23, 2017 at 12:43:17PM +1200, Chris Packham wrote:
> The mchp23lcv1024 is software compatible with the mchp23k256, the
> only difference (from a software point of view) is the size.

This is not really true. The size of the address is also different,
and the point of the v2 change.

> There
> is no way to detect the size so we must be told via a Device Tree.

or defaults to 256K when device tree is not used.

> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
