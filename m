From: Josh Wu <josh.wu@atmel.com>
Subject: Re: [PATCH 6/6] mtd: ofpart: add compatible check for child nodes
Date: Mon, 5 Aug 2013 19:33:36 +0800
Message-ID: <51FF8D90.2060308@atmel.com>
References: <1375701279-11495-1-git-send-email-josh.wu@atmel.com>
 <1375701279-11495-7-git-send-email-josh.wu@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1375701279-11495-7-git-send-email-josh.wu@atmel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Josh Wu <josh.wu@atmel.com>
Cc: devicetree@vger.kernel.org, sergei.shtylyov@cogentembedded.com, dedekind1@gmail.com, devicetree-discuss@lists.ozlabs.org, nicolas.ferre@atmel.com, linux-mtd@lists.infradead.org, computersforpeace@gmail.com, plagnioj@jcrosoft.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add device tree mail list to CC.

On 8/5/2013 7:14 PM, Josh Wu wrote:
> In case that the nand device will support some features like Nand Flash
> Controller, we want to make the sub feature as a sub node of nand device.
>
> Use such organization it is easy to enable/disable feature, also it is back
> compatible and more readable.
>
> If the sub-node has a compatible property then it is a driver not partition.
>
> Signed-off-by: Josh Wu <josh.wu@atmel.com>
> Acked-by: Brian Norris <computersforpeace@gmail.com>
> Acked-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
> ---
> v3 --> v4:
>    - remove the 'len' parameter, just use NULL.
>    - refine the commit message.
>    - also add a NOTE in devicetree/bindings/mtd/partition.txt.
>
>   .../devicetree/bindings/mtd/partition.txt          |    1 +
>   drivers/mtd/ofpart.c                               |   13 ++++++++++++-
>   2 files changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mtd/partition.txt b/Documentation/devicetree/bindings/mtd/partition.txt
> index 9315ac9..8e5557d 100644
> --- a/Documentation/devicetree/bindings/mtd/partition.txt
> +++ b/Documentation/devicetree/bindings/mtd/partition.txt
> @@ -4,6 +4,7 @@ Partitions can be represented by sub-nodes of an mtd device. This can be used
>   on platforms which have strong conventions about which portions of a flash are
>   used for what purposes, but which don't use an on-flash partition table such
>   as RedBoot.
> +NOTE: if the sub-node has a compatible string, then it is not a partition.
>   
>   #address-cells & #size-cells must both be present in the mtd device. There are
>   two valid values for both:
> diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
> index 553d6d6..30fcea1 100644
> --- a/drivers/mtd/ofpart.c
> +++ b/drivers/mtd/ofpart.c
> @@ -20,6 +20,10 @@
>   #include <linux/slab.h>
>   #include <linux/mtd/partitions.h>
>   
> +static bool node_has_compatible(struct device_node *pp)
> +{
> +	return of_get_property(pp, "compatible", NULL);
> +}
>   static int parse_ofpart_partitions(struct mtd_info *master,
>   				   struct mtd_partition **pparts,
>   				   struct mtd_part_parser_data *data)
> @@ -40,8 +44,12 @@ static int parse_ofpart_partitions(struct mtd_info *master,
>   	/* First count the subnodes */
>   	pp = NULL;
>   	nr_parts = 0;
> -	while ((pp = of_get_next_child(node, pp)))
> +	while ((pp = of_get_next_child(node, pp))) {
> +		if (node_has_compatible(pp))
> +			continue;
> +
>   		nr_parts++;
> +	}
>   
>   	if (nr_parts == 0)
>   		return 0;
> @@ -57,6 +65,9 @@ static int parse_ofpart_partitions(struct mtd_info *master,
>   		int len;
>   		int a_cells, s_cells;
>   
> +		if (node_has_compatible(pp))
> +			continue;
> +
>   		reg = of_get_property(pp, "reg", &len);
>   		if (!reg) {
>   			nr_parts--;


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
