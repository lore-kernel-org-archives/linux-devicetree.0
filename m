From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] mtd: rawnand: sunxi: Remove support for GPIO-based
 Ready/Busy polling
Date: Mon, 9 Apr 2018 13:38:56 -0500
Message-ID: <20180409183856.sq3qk5lqkquutrem@rob-hp-laptop>
References: <20180327070614.3288-1-boris.brezillon@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180327070614.3288-1-boris.brezillon@bootlin.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Marek Vasut <marek.vasut@gmail.com>, Kumar Gala <galak@codeaurora.org>, linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 27, 2018 at 09:06:14AM +0200, Boris Brezillon wrote:
> None of the existing platforms connect the R/B pin to a GPIO (they all
> use one of the dedicated R/B pin).
> Anyway, if we ever get short of native R/B pins, it's probably better
> to fallback to STATUS reg polling than trying to poll a GPIO.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
>  .../devicetree/bindings/mtd/sunxi-nand.txt         |  2 -

Reviewed-by: Rob Herring <robh@kernel.org>

>  drivers/mtd/nand/raw/sunxi_nand.c                  | 91 ++++------------------
>  2 files changed, 15 insertions(+), 78 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
