From: Alexander Popov <a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH RFC v5 3/5] dma: of: Add common xlate function for
 matching by channel id
Date: Thu, 7 Nov 2013 15:33:10 +0400
Message-ID: <CAF0T0X5Qxa5yGVrL2U2DfAuXcYx23WObA2BArG74+ZBFbwKb6g@mail.gmail.com>
References: <1383290374-17484-1-git-send-email-a13xp0p0v88@gmail.com>
	<1383290374-17484-4-git-send-email-a13xp0p0v88@gmail.com>
	<201311010852.05709.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201311010852.05709.arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexander Popov <a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2013/11/1 Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>:
> On Friday 01 November 2013, Alexander Popov wrote:
>> + * of_dma_xlate_by_chan_id - Translate dt property to DMA channel by channel id
>> + * @dma_spec:        pointer to DMA specifier as found in the device tree
>> + * @of_dma:  pointer to DMA controller data
>
> This seems rather clumsy, now that we have added the dma_get_slave_channel interface.
> Can you try using that instead of dma_request_channel() now?
>

Thanks, Arnd.
I'll return with the fixed version.

Best regards,
Alexander.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
