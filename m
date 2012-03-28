From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V3 5/5] mtd: Move fdt partition documentation to a
 seperate file
Date: Wed, 28 Mar 2012 08:17:12 +0000
Message-ID: <201203280817.12652.arnd@arndb.de>
References: <1332885255-8304-1-git-send-email-jm@lentin.co.uk>
 <1332885255-8304-6-git-send-email-jm@lentin.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1332885255-8304-6-git-send-email-jm@lentin.co.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jamie Lentin <jm@lentin.co.uk>
Cc: devicetree-discuss@lists.ozlabs.org, Jason <jason@lakedaemon.net>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tuesday 27 March 2012, Jamie Lentin wrote:
> 
> Partitions are described in the same way for all mtd devices when using
> devicetree, move the documentation to a separate file and add references
> to it.
> 
> Signed-off-by: Jamie Lentin <jm@lentin.co.uk>

Acked-by: Arnd Bergmann <arnd@arndb.de>

> ---
>  .../devicetree/bindings/mtd/arm-versatile.txt      |    4 +-
>  .../devicetree/bindings/mtd/atmel-dataflash.txt    |    3 ++
>  .../devicetree/bindings/mtd/fsl-upm-nand.txt       |    4 ++
>  .../devicetree/bindings/mtd/gpio-control-nand.txt  |    3 ++
>  .../devicetree/bindings/mtd/mtd-physmap.txt        |   23 +-----------
>  .../devicetree/bindings/mtd/orion-nand.txt         |    3 ++
>  .../devicetree/bindings/mtd/partition.txt          |   38 ++++++++++++++++++++
>  7 files changed, 55 insertions(+), 23 deletions(-)
