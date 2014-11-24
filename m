From: Aaron Sierra <asierra@xes-inc.com>
Subject: Re: [PATCH v2] mtd: fsl_upm: Support NAND ECC DTS properties
Date: Mon, 24 Nov 2014 09:22:33 -0600 (CST)
Message-ID: <737777710.57195.1416842553156.JavaMail.zimbra@xes-inc.com>
References: <1854666513.5578.1415473916534.JavaMail.zimbra@xes-inc.com>
 <5471308E.908@vanguardiasur.com.ar>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <5471308E.908@vanguardiasur.com.ar>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: David Woodhouse <dwmw2@infradead.org>, devicetree@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, Jordan Friendshuh <jfriendshuh@xes-inc.com>
List-Id: devicetree@vger.kernel.org

----- Original Message -----
> From: "Ezequiel Garcia" <ezequiel@vanguardiasur.com.ar>
> Sent: Saturday, November 22, 2014 6:55:42 PM
> 
> On 11/08/2014 04:11 PM, Aaron Sierra wrote:
> > From: Jordan Friendshuh <jfriendshuh@xes-inc.com>
> > 
> > Support the generic nand-ecc-mode and nand-ecc-strength device-tree
> > properties with the Freescale UPM NAND driver.
> > 
> > This patch preserves the default software ECC mode while adding the
> > ability to use BCH ECC for larger NAND devices.
> > 
> > Signed-off-by: Jordan Friendshuh <jfriendshuh@xes-inc.com>
> > Signed-off-by: Aaron Sierra <asierra@xes-inc.com>
> > ---
> > v2:
> >     * Now using ECC mode and strength helpers from of_mtd.h
> >     * ECC mode and strength checking is more robust
> > 
> >  .../devicetree/bindings/mtd/fsl-upm-nand.txt       |  2 +
> >  drivers/mtd/nand/Kconfig                           |  1 +
> >  drivers/mtd/nand/fsl_upm.c                         | 51
> >  +++++++++++++++++++---
> >  3 files changed, 49 insertions(+), 5 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/mtd/fsl-upm-nand.txt
> > b/Documentation/devicetree/bindings/mtd/fsl-upm-nand.txt
> > index fce4894..a9906f6 100644
> > --- a/Documentation/devicetree/bindings/mtd/fsl-upm-nand.txt
> > +++ b/Documentation/devicetree/bindings/mtd/fsl-upm-nand.txt
> > @@ -18,6 +18,8 @@ Optional properties:
> >  - chip-delay : chip dependent delay for transferring data from array to
> >  	read registers (tR). Required if property "gpios" is not used
> >  	(R/B# pins not connected).
> > +- nand-ecc-mode : as defined by nand.txt ("soft" and "soft_bch", only).
> > +- nand-ecc-strength : as defined by nand.txt.
> >  
> 
> The nand.txt recommends that each binding documents the way these
> properties are interpreted.

Ezequiel,
I assume you are referring to this statement, "implementations are
encouraged to further specify the value(s) they support."

That is the only statement I found requesting documentation. I believe
that request is satisfied, since I listed all of the modes that the driver
would support with my patch applied. I used mxc-nand.txt as a reference.

> Moreover, there's no nand-ecc-step usage? Are you assuming a 512-byte size?

The ecc.bytes value is currently left to be calculated by the
NAND_ECC_SOFT_BCH case in nand_base.c. That calculation assumes a 512-byte
step size.

-Aaron

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
