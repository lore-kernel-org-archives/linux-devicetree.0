From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v3 3/7] of: address: Add parent pointer to the
 __of_translate_address args
Date: Tue, 12 Feb 2019 18:02:27 +0000
Message-ID: <fbac5719-5d76-e7f4-5e5e-2d5167783106@arm.com>
References: <cover.f2e5fbb4d21384168973fa32377a33d627768146.1549897336.git-series.maxime.ripard@bootlin.com>
 <57fa05909120919f33590fed11bd4041467a09f5.1549897336.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <57fa05909120919f33590fed11bd4041467a09f5.1549897336.git-series.maxime.ripard@bootlin.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Chen-Yu Tsai <wens@csie.org>
Cc: devicetree@vger.kernel.org, Yong Deng <yong.deng@magewell.com>, Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org, Dave Martin <dave.martin@arm.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Georgi Djakov <georgi.djakov@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 11/02/2019 15:02, Maxime Ripard wrote:
> The __of_translate_address function is used to translate the device tree
> addresses to physical addresses using the various ranges property to create
> the offset.
> 
> However, it's shared between the CPU addresses (based on the ranges
> property) and the DMA addresses (based on dma-ranges). Since we're going to
> add support for a DMA parent node that is not the DT parent node, we need
> to change the logic a bit to have an optional parent node that we should
> use.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>   drivers/of/address.c | 21 ++++++++++++---------
>   1 file changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index 2270373b30ab..4c5dc21c71ca 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -569,10 +569,10 @@ static int of_translate_one(struct device_node *parent, struct of_bus *bus,
>    * relative to that node.
>    */
>   static u64 __of_translate_address(struct device_node *dev,
> +				  struct device_node *parent,
>   				  const __be32 *in_addr, const char *rprop,
>   				  struct device_node **host)
>   {
> -	struct device_node *parent = NULL;
>   	struct of_bus *bus, *pbus;
>   	__be32 addr[OF_MAX_ADDR_CELLS];
>   	int na, ns, pna, pns;
> @@ -583,11 +583,14 @@ static u64 __of_translate_address(struct device_node *dev,
>   	/* Increase refcount at current level */
>   	of_node_get(dev);
>   
> -	*host = NULL;
> -	/* Get parent & match bus type */
> -	parent = of_get_parent(dev);
> -	if (parent == NULL)
> -		goto bail;
> +	if (!parent) {

I would have suggested having the callers make the of_get_parent() call 
themselves, but having pulled up the code for a look at the whole 
function, there's a bigger issue at play. The parent traversal happens 
within the main translation loop as well, and topologies could quite 
feasibly exist where that makes a difference, e.g.:

	icc {
		#interconnect-cells = <0>;
		dma-ranges = <...>;
	};

	subsystem {
		interconnects = <&icc>;
		interconnect-names = "dma";

		intermediate-bus {
			dma-ranges;

			device {
				...
			};
		};
	};

or:

	icc2 {
		#interconnect-cells = <0>;
		dma-ranges = <...>;
	};

	icc1 {
		#interconnect-cells = <0>;
		dma-ranges = <...>;
		interconnects = <&icc2>;
		interconnect-names = "dma";
	};

	device {
		interconnects = <&icc1>;
		interconnect-names = "dma";
		...
	};

So I guess the answer is to switch this over to using a callback and 
have the callers pass of_get_parent/of_get_dma_parent in as appropriate.

Robin.

> +		*host = NULL;
> +		/* Get parent & match bus type */
> +		parent = of_get_parent(dev);
> +		if (parent == NULL)
> +			goto bail;
> +	}
> +
>   	bus = of_match_bus(parent);
>   
>   	/* Count address cells & copy address locally */
> @@ -665,7 +668,7 @@ u64 of_translate_address(struct device_node *dev, const __be32 *in_addr)
>   	struct device_node *host;
>   	u64 ret;
>   
> -	ret = __of_translate_address(dev, in_addr, "ranges", &host);
> +	ret = __of_translate_address(dev, NULL, in_addr, "ranges", &host);
>   	if (host) {
>   		of_node_put(host);
>   		return OF_BAD_ADDR;
> @@ -680,7 +683,7 @@ u64 of_translate_dma_address(struct device_node *dev, const __be32 *in_addr)
>   	struct device_node *host;
>   	u64 ret;
>   
> -	ret = __of_translate_address(dev, in_addr, "dma-ranges", &host);
> +	ret = __of_translate_address(dev, NULL, in_addr, "dma-ranges", &host);
>   
>   	if (host) {
>   		of_node_put(host);
> @@ -736,7 +739,7 @@ static u64 of_translate_ioport(struct device_node *dev, const __be32 *in_addr,
>   	unsigned long port;
>   	struct device_node *host;
>   
> -	taddr = __of_translate_address(dev, in_addr, "ranges", &host);
> +	taddr = __of_translate_address(dev, NULL, in_addr, "ranges", &host);
>   	if (host) {
>   		/* host-specific port access */
>   		port = logic_pio_trans_hwaddr(&host->fwnode, taddr, size);
> 
