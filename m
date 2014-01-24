From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] ARM: moxart: DT fixups
Date: Thu, 23 Jan 2014 18:11:32 -0800
Message-ID: <20140124021132.GB17877@quad.lixom.net>
References: <1390317973-24110-1-git-send-email-jonas.jensen@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1390317973-24110-1-git-send-email-jonas.jensen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonas Jensen <jonas.jensen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 21, 2014 at 04:26:13PM +0100, Jonas Jensen wrote:
> Change DT files to remain coherent with changes in
> accompanying drivers.
> 
> 1. replace "sdhci" with "mmc"
> 2. add bus-width property to mmc node
> 3. drop device_type property
> 4. replace "mac@" with "ethernet@"
> 5. replace CONFIG_MMC_SDHCI_MOXART with CONFIG_MMC_MOXART
> 
> Signed-off-by: Jonas Jensen <jonas.jensen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> 
> Notes:
>     Applies on top of:
>     
>     "[PATCH] ARM: moxart: move fixed rate clock child node to board level dts"
>     http://lists.infradead.org/pipermail/linux-arm-kernel/2014-January/226141.html
>     
>     Applies to next-20140121

Since the prereqs for this patch are in different branches right now, I'll have
to apply it after the merges have been done by Linus. I'll include it in
a batch of fixes later on -- remind me if we forget.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
