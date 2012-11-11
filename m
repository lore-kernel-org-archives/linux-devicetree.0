From: Rob Herring <robherring2@gmail.com>
Subject: Re: [RFC] dt/platform: Use cell-index for device naming if available
Date: Sat, 10 Nov 2012 20:32:54 -0600
Message-ID: <509F0E56.6080806@gmail.com>
References: <1352508532-19241-1-git-send-email-stepanm@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1352508532-19241-1-git-send-email-stepanm@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stepan Moskovchenko <stepanm@codeaurora.org>
Cc: Grant Likely <grant.likely@secretlab.ca>, devicetree-discuss@lists.ozlabs.org, David Brown <davidb@codeaurora.org>, Daniel Walker <dwalker@fifo99.com>, Bryan Huntsman <bryanh@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 11/09/2012 06:48 PM, Stepan Moskovchenko wrote:
> Use the cell-index property to construct names for platform
> devices, falling back on the existing scheme of using the
> device register address if cell-index is not specified.
> 
> The cell-index property is a more useful device identifier,
> especially in systems containing several numbered instances
> of a particular hardware block, since it more easily
> illustrates how devices relate to each other.
> 
> Additionally, userspace software may rely on the classic
> <name>.<id> naming scheme to access device attributes in
> sysfs, without having to know the physical addresses of
> that device on every platform the userspace software may
> support. Using cell-index for device naming allows the
> device addresses to be hidden from userspace and to be
> exposed by logical device number without having to rely on
> auxdata to perform name overrides. This allows userspace to
> make assumptions about which sysfs nodes map to which
> logical instance of a specific hardware block.
> 
> Signed-off-by: Stepan Moskovchenko <stepanm@codeaurora.org>
> ---
> I had also considered using something like the linux,label property to allow
> custom names for platform devices without resorting to auxdata, but the
> cell-index approach seems more in line with what cell-index was intended for
> and with what the pre-DT platform device naming scheme used to be. Please let
> me know if you think there is a better way to accomplish this.
> 
> This is just being sent out as an RFC for now. If there are no objections, I
> will send this out as an official patch, along with (or combined with) a patch
> to fix up the device names in things like clock tables of any affected
> platforms.

cell-index is basically deprecated. This has been discussed multiple
times in the past. You can use auxdata if you really need to have the
old name.

Rob

> 
>  drivers/of/platform.c |   13 ++++++++++++-
>  1 files changed, 12 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index 343ad29..472e374 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -77,8 +77,9 @@ void of_device_make_bus_id(struct device *dev)
>  	static atomic_t bus_no_reg_magic;
>  	struct device_node *node = dev->of_node;
>  	const u32 *reg;
> +	u32 cell_index;
>  	u64 addr;
> -	int magic;
> +	int magic, ret;
> 
>  #ifdef CONFIG_PPC_DCR
>  	/*
> @@ -101,6 +102,16 @@ void of_device_make_bus_id(struct device *dev)
>  #endif /* CONFIG_PPC_DCR */
> 
>  	/*
> +	 * For devices with a specified cell-index, use the traditional
> +	 * naming scheme of <name>.<id>
> +	 */
> +	ret = of_property_read_u32(node, "cell-index", &cell_index);
> +	if (ret == 0) {
> +		dev_set_name(dev, "%s.%d", node->name, cell_index);
> +		return;
> +	}
> +
> +	/*
>  	 * For MMIO, get the physical address
>  	 */
>  	reg = of_get_property(node, "reg", NULL);
> --
> The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> hosted by The Linux Foundation
> 
