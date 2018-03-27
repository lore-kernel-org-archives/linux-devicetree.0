From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v3 1/2] of_net: Implement of_get_nvmem_mac_address helper
Date: Tue, 27 Mar 2018 15:50:27 -0700
Message-ID: <8623d20b-5a01-b2bd-39f2-900177f96595@gmail.com>
References: <1522144346-32367-1-git-send-email-mike.looijmans@topic.nl>
 <1522144346-32367-2-git-send-email-mike.looijmans@topic.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1522144346-32367-2-git-send-email-mike.looijmans@topic.nl>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Looijmans <mike.looijmans@topic.nl>, netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, andrew@lunn.ch, robh+dt@kernel.org, frowand.list@gmail.com
List-Id: devicetree@vger.kernel.org

On 03/27/2018 02:52 AM, Mike Looijmans wrote:
> It's common practice to store MAC addresses for network interfaces into
> nvmem devices. However the code to actually do this in the kernel lacks,
> so this patch adds of_get_nvmem_mac_address() for drivers to obtain the
> address from an nvmem cell provider.
> 
> This is particulary useful on devices where the ethernet interface cannot
> be configured by the bootloader, for example because it's in an FPGA.
> 
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
>  Documentation/devicetree/bindings/net/ethernet.txt |  2 ++
>  drivers/of/of_net.c                                | 40 ++++++++++++++++++++++
>  include/linux/of_net.h                             |  6 ++++
>  3 files changed, 48 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/ethernet.txt b/Documentation/devicetree/bindings/net/ethernet.txt
> index 2974e63..cfc376b 100644
> --- a/Documentation/devicetree/bindings/net/ethernet.txt
> +++ b/Documentation/devicetree/bindings/net/ethernet.txt
> @@ -10,6 +10,8 @@ Documentation/devicetree/bindings/phy/phy-bindings.txt.
>    the boot program; should be used in cases where the MAC address assigned to
>    the device by the boot program is different from the "local-mac-address"
>    property;
> +- nvmem-cells: phandle, reference to an nvmem node for the MAC address;
> +- nvmem-cell-names: string, should be "mac-address" if nvmem is to be used;
>  - max-speed: number, specifies maximum speed in Mbit/s supported by the device;
>  - max-frame-size: number, maximum transfer unit (IEEE defined MTU), rather than
>    the maximum frame size (there's contradiction in the Devicetree
> diff --git a/drivers/of/of_net.c b/drivers/of/of_net.c
> index d820f3e..1c5d372 100644
> --- a/drivers/of/of_net.c
> +++ b/drivers/of/of_net.c
> @@ -7,6 +7,7 @@
>   */
>  #include <linux/etherdevice.h>
>  #include <linux/kernel.h>
> +#include <linux/nvmem-consumer.h>
>  #include <linux/of_net.h>
>  #include <linux/phy.h>
>  #include <linux/export.h>
> @@ -80,3 +81,42 @@ const void *of_get_mac_address(struct device_node *np)
>  	return of_get_mac_addr(np, "address");
>  }
>  EXPORT_SYMBOL(of_get_mac_address);
> +
> +/**
> + * Obtain the MAC address from an nvmem provider named 'mac-address' through
> + * device tree.
> + * On success, copies the new address into memory pointed to by addr and
> + * returns 0. Returns a negative error code otherwise.
> + * @np:		Device tree node containing the nvmem-cells phandle
> + * @addr:	Pointer to receive the MAC address using ether_addr_copy()
> + */
> +int of_get_nvmem_mac_address(struct device_node *np, void *addr)
> +{
> +	struct nvmem_cell *cell;
> +	const void *mac;
> +	size_t len;
> +	int ret;
> +
> +	cell = of_nvmem_cell_get(np, "mac-address");
> +	if (IS_ERR(cell))
> +		return PTR_ERR(cell);
> +
> +	mac = nvmem_cell_read(cell, &len);
> +
> +	nvmem_cell_put(cell);
> +
> +	if (IS_ERR(mac))
> +		return PTR_ERR(mac);
> +
> +	if (len < 6 || !is_valid_ether_addr(mac)) {
> +		ret = -EINVAL;

Just one nit here, can you use ETH_ALEN instead of 6? With that fixed:

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
