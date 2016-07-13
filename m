From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: at91-sama5d4ek.dts, lcd_bus node?
Date: Wed, 13 Jul 2016 15:08:00 +0200
Message-ID: <20160713130800.GA898@piout.net>
References: <alpine.DEB.2.02.1607131228320.10743@pmeerw.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.02.1607131228320.10743-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
Cc: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 13/07/2016 at 12:33:36 +0200, Peter Meerwald-Stadler wrote :
> Hello,
> 
> is the lcd_bus stuff still needed in at91-sama5d4ek.dts?
> 

It is not, I just prepared a patch yesterday regarding this issue that I
didn't send yet (part of the dtc warnings cleanup).

> the sama5d4_xplained*.dts don't seem to have it and I don't see any 
> reference to it
> 
> thanks, regards, p.
> 
> -- 
> 
> Peter Meerwald-Stadler
> +43-664-2444418 (mobile)

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
