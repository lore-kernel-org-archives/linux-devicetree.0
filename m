From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH V3 5/5] mtd: Move fdt partition documentation to a
 seperate file
Date: Wed, 28 Mar 2012 10:41:55 -0400
Message-ID: <20120328144155.GA32333@titan.lakedaemon.net>
References: <1332885255-8304-1-git-send-email-jm@lentin.co.uk>
 <1332885255-8304-6-git-send-email-jm@lentin.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1332885255-8304-6-git-send-email-jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 27, 2012 at 10:54:15PM +0100, Jamie Lentin wrote:
> Partitions are described in the same way for all mtd devices when using
> devicetree, move the documentation to a separate file and add references
> to it.
> 
> Signed-off-by: Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>

Acked-by: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>

> ---
>  .../devicetree/bindings/mtd/arm-versatile.txt      |    4 +-
>  .../devicetree/bindings/mtd/atmel-dataflash.txt    |    3 ++
>  .../devicetree/bindings/mtd/fsl-upm-nand.txt       |    4 ++
>  .../devicetree/bindings/mtd/gpio-control-nand.txt  |    3 ++
>  .../devicetree/bindings/mtd/mtd-physmap.txt        |   23 +-----------
>  .../devicetree/bindings/mtd/orion-nand.txt         |    3 ++
>  .../devicetree/bindings/mtd/partition.txt          |   38 ++++++++++++++++++++
>  7 files changed, 55 insertions(+), 23 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/partition.txt
