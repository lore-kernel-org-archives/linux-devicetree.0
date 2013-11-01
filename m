From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH RFC v5 3/5] dma: of: Add common xlate function for matching by channel id
Date: Fri, 1 Nov 2013 08:52:05 +0100
Message-ID: <201311010852.05709.arnd@arndb.de>
References: <1383290374-17484-1-git-send-email-a13xp0p0v88@gmail.com> <1383290374-17484-4-git-send-email-a13xp0p0v88@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383290374-17484-4-git-send-email-a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Popov <a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday 01 November 2013, Alexander Popov wrote:

> + * of_dma_xlate_by_chan_id - Translate dt property to DMA channel by channel id
> + * @dma_spec:	pointer to DMA specifier as found in the device tree
> + * @of_dma:	pointer to DMA controller data
> + *
> + * This function can be used as the of xlate callback for DMA driver which wants
> + * to match the channel based on the channel id. When using this xlate function
> + * the #dma-cells propety of the DMA controller dt node needs to be set to 1.
> + * The data parameter of of_dma_controller_register must be a pointer to the
> + * dma_device struct the function should match upon.
> + *
> + * Returns pointer to appropriate dma channel on success or NULL on error.
> + */
> +struct dma_chan *of_dma_xlate_by_chan_id(struct of_phandle_args *dma_spec,
> +					 struct of_dma *ofdma)
> +{
> +	struct of_dma_filter_by_chan_id_args args;
> +	dma_cap_mask_t cap;
> +
> +	args.dev = ofdma->of_dma_data;
> +	if (!args.dev)
> +		return NULL;
> +
> +	if (dma_spec->args_count != 1)
> +		return NULL;
> +
> +	dma_cap_zero(cap);
> +	dma_cap_set(DMA_SLAVE, cap);
> +
> +	args.chan_id = dma_spec->args[0];
> +
> +	return dma_request_channel(cap, of_dma_filter_by_chan_id, &args);
> +}
> +EXPORT_SYMBOL_GPL(of_dma_xlate_by_chan_id);

This seems rather clumsy, now that we have added the dma_get_slave_channel interface.
Can you try using that instead of dma_request_channel() now?

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
