From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH V3 2/5] mtd: Add orion_nand devicetree bindings
Date: Wed, 28 Mar 2012 17:04:26 -0600
Message-ID: <20120328230426.CF3A43E104C@localhost>
References: <1332885255-8304-1-git-send-email-jm@lentin.co.uk>
 <1332885255-8304-3-git-send-email-jm@lentin.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1332885255-8304-3-git-send-email-jm@lentin.co.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>, Jason <jason@lakedaemon.net>
Cc: devicetree-discuss@lists.ozlabs.org, Jamie Lentin <jm@lentin.co.uk>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, 27 Mar 2012 22:54:12 +0100, Jamie Lentin <jm@lentin.co.uk> wrote:
> Allow a NAND chip using the orion_nand driver to be described using devicetree.
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Jamie Lentin <jm@lentin.co.uk>
> ---
>  .../devicetree/bindings/mtd/orion-nand.txt         |   46 ++++++++++++++++++++
>  drivers/mtd/nand/orion_nand.c                      |   35 ++++++++++++++-
>  2 files changed, 79 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/orion-nand.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/orion-nand.txt b/Documentation/devicetree/bindings/mtd/orion-nand.txt
> new file mode 100644
> index 0000000..22c7438
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/orion-nand.txt
> @@ -0,0 +1,46 @@
> +NAND support for Marvell Orion SoC platforms
> +
> +Required properties:
> +- compatible : "mrvl,orion-nand".
> +- reg : Base physical address of the NAND and length of memory mapped
> +	region
> +
> +Optional properties:
> +- cle :
> +- ale :
> +- bank-width :
> +- chip-delay :

Please state what data these properties contain.  :-)
