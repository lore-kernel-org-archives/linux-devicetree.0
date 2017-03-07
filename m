From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v2 1/2] doc: bindings: Add bindings documentation for
 mtd nvmem
Date: Tue, 7 Mar 2017 22:01:07 +0100
Message-ID: <20170307220107.03436537@bbrezillon>
References: <1488875164-30440-1-git-send-email-albeu@free.fr>
 <1488875164-30440-2-git-send-email-albeu@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1488875164-30440-2-git-send-email-albeu@free.fr>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Alban <albeu@free.fr>
Cc: Mark Rutland <mark.rutland@arm.com>, Moritz Fischer <moritz.fischer@ettus.com>, devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-mtd@lists.infradead.org, Maxime Ripard <maxime.ripard@free-electrons.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Cyrille Pitchen <cyrille.pitchen@atmel.com>
List-Id: devicetree@vger.kernel.org

On Tue,  7 Mar 2017 09:26:03 +0100
Alban <albeu@free.fr> wrote:

> Config data for drivers, like MAC addresses, is often stored in MTD.
> Add a binding that define how such data storage can be represented in
> device tree.
> 
> Signed-off-by: Alban <albeu@free.fr>
> ---
> Changelog:
> v2: * Added a "Required properties" section with the nvmem-provider
>       property
> ---
>  .../devicetree/bindings/nvmem/mtd-nvmem.txt        | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt b/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
> new file mode 100644
> index 0000000..8ed25e6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
> @@ -0,0 +1,33 @@
> += NVMEM in MTD =
> +
> +Config data for drivers, like MAC addresses, is often stored in MTD.
> +This binding define how such data storage can be represented in device tree.
> +
> +An MTD can be defined as an NVMEM provider by adding the `nvmem-provider`
> +property to their node.

If everyone agrees that this is actually needed, then it should
definitely go in the nvmem binding doc, and we should patch all nvmem
providers to define this property (even if we keep supporting nodes
that are not defining it). I'm not fully convinced yet, but I might be
wrong.

I also think we should take the "nvmem under flash node without partitions"
into account now, or at least have a clear plan on how we want to represent
it.

Something like that?

	flash {
		partitions {
			part@X {
				nvmem {
					#address-cells = <1>;
					#size-cells = <1>;

					cell@Y {
					};
				};
			};
		};

		nvmem {
			#address-cells = <1>;
			#size-cells = <1>;

			cell@X {
			};
		};
	};

Note that patching nvmem core to support the subnode case should be
pretty easy (see below).

--->8---
diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 408b521ee520..507c6190505b 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -465,7 +465,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
        nvmem->priv = config->priv;
        nvmem->reg_read = config->reg_read;
        nvmem->reg_write = config->reg_write;
-       np = config->dev->of_node;
+       np = config->of_node ? : config->dev->of_node;
        nvmem->dev.of_node = np;
        dev_set_name(&nvmem->dev, "%s%d",
                     config->name ? : "nvmem", config->id);
diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
index cd93416d762e..ec2f5116d62d 100644
--- a/include/linux/nvmem-provider.h
+++ b/include/linux/nvmem-provider.h
@@ -21,6 +21,7 @@ typedef int (*nvmem_reg_write_t)(void *priv, unsigned int offset,
 
 struct nvmem_config {
        struct device           *dev;
+       struct device_node      *of_node;
        const char              *name;
        int                     id;
        struct module           *owner;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
