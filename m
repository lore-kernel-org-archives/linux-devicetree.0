From: Francesco Lavra <francescolavra.fl@gmail.com>
Subject: Re: [Linaro-mm-sig] [RFC/PATCH v2 2/2] drivers: dma-contiguous: add
 initialization from device tree
Date: Wed, 24 Apr 2013 12:30:49 +0200
Message-ID: <5177B459.1080009@gmail.com>
References: <1365679330-2514-1-git-send-email-m.szyprowski@samsung.com>
 <1365679330-2514-3-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1365679330-2514-3-git-send-email-m.szyprowski@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Sascha Hauer <s.hauer@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>, Tomasz Figa <t.figa@samsung.com>, Michal Nazarewicz <mina86@mina86.com>, linaro-mm-sig@lists.linaro.org, Kyungmin Park <kyungmin.park@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Olof Johansson <olof@lixom.net>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 04/11/2013 01:22 PM, Marek Szyprowski wrote:
> diff --git a/drivers/base/dma-contiguous.c b/drivers/base/dma-contiguous.c
> index 01fe743..6a8abab 100644
> --- a/drivers/base/dma-contiguous.c
> +++ b/drivers/base/dma-contiguous.c
[...]
> +void scan_cma_nodes(void)

Should be declared static.

> +{
> +	struct device_node *parent = of_find_node_by_path("/chosen/contiguous-memory");
> +	struct device_node *child;
> +
> +	if (!parent)
> +		return;
> +
> +	for_each_child_of_node(parent, child) {
> +		struct cma *cma = NULL;
> +		int i;
> +
> +		for (i=0; i<cma_area_count; i++)
> +			if (strstr(child->full_name, cma_areas[i].full_name))
> +				cma = &cma_areas[i];
> +		if (!cma)
> +			continue;
> +
> +		for (i=0;; i++) {
> +			struct device_node *node;
> +			node = of_parse_phandle(child, "device", i);
> +			if (!node)
> +				break;
> +
> +			cma_maps[cma_map_count].cma = cma;
> +			cma_maps[cma_map_count].node = node;
> +			cma_map_count++;
> +		}

of_parse_phandle() requires of_node_put() to be called when done with
the device node.
Also, of_node_put() should be called on the parent node as well.

> +	}
> +}

--
Francesco
