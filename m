From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH v4 05/31] mtd: nand: pxa3xx: devicetree binding update
Date: Thu, 7 Nov 2013 10:32:10 -0500
Message-ID: <20131107153210.GK8308@titan.lakedaemon.net>
References: <1383837455-30721-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1383837455-30721-6-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1383837455-30721-6-git-send-email-ezequiel.garcia@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>, devicetree@vger.kernel.org, Tawfik Bayouk <tawfik@marvell.com>, Willy Tarreau <w@1wt.eu>, Huang Shijie <b32955@freescale.com>, Daniel Mack <zonque@gmail.com>, linux-mtd@lists.infradead.org, Gregory Clement <gregory.clement@free-electrons.com>, Brian Norris <computersforpeace@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 07, 2013 at 12:17:09PM -0300, Ezequiel Garcia wrote:
> Since the driver supports the new compatible string, the binding
> documentation must be updated to reflect it.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> ---
>  Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Thanks for adding this, but please remember to update the Subject
string in the future.  Both this patch and the next one are changing the
Documentation/ portion of the tree, not drivers/.

And,

Acked-by: Jason Cooper <jason@lakedaemon.net>

thx,

Jason.

> diff --git a/Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt b/Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt
> index f1421e2..bed8390 100644
> --- a/Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt
> @@ -2,7 +2,9 @@ PXA3xx NAND DT bindings
>  
>  Required properties:
>  
> - - compatible:		Should be "marvell,pxa3xx-nand"
> + - compatible:		Should be set to one of the following:
> +			marvell,pxa3xx-nand
> +			marvell,armada370-nand
>   - reg: 		The register base for the controller
>   - interrupts:		The interrupt to map
>   - #address-cells:	Set to <1> if the node includes partitions
> -- 
> 1.8.1.5
> 
