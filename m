From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH v2 1/2] USB: Update EHCI-platform driver to devicetree.
Date: Mon, 22 Oct 2012 10:51:19 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1210221046140.1724-100000@iolanthe.rowland.org>
References: <1350771032-11527-2-git-send-email-linux@prisktech.co.nz>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1350771032-11527-2-git-send-email-linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, 21 Oct 2012, Tony Prisk wrote:

> +static u64 ehci_dma_mask = DMA_BIT_MASK(32);

...

> +		/* Right now device-tree probed devices don't get dma_mask set.
> +		 * Since shared usb code relies on it, set it here for now.
> +		 * Once we have dma capability bindings this can go away.
> +		 */
> +		if (!dev->dev.dma_mask)
> +			dev->dev.dma_mask = &ehci_dma_mask;

Grant:

I have seen this sort of thing added to many drivers.  Why can't this 
be centralized in a way that will apply once and for all to all 
appropriate DT-based drivers?

Eventually DMA capabilities will be supported properly in DT, right?  
Then all these additions made to hundreds(?) of drivers will have to be
removed.  Why not start the ball rolling now and prevent things from
getting even worse?

Alan Stern

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
