From: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v6 0/2]  Introduce AEMIF driver for Davinci/Keystone archs
Date: Fri, 28 Feb 2014 10:43:36 -0500
Message-ID: <5310AEA8.1070804@ti.com>
References: <1393262772-24442-1-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393262772-24442-1-git-send-email-ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>, galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, grygorii.strashko-l0cyMroinI0@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

Greg,

On Monday 24 February 2014 12:26 PM, Ivan Khoronzhuk wrote:
> These patches introduce Async External Memory Interface (EMIF16/AEMIF)
> controller driver for Davinci/Keystone archs.
> 
> For more informations see documentation:
> Davinci DM646x - http://www.ti.com/lit/ug/sprueq7c/sprueq7c.pdf
> OMAP-L138 - http://www.ti.com/lit/ug/spruh77a/spruh77a.pdf
> Kestone - http://www.ti.com/lit/ug/sprugz3a/sprugz3a.pdf
> 
[..]

> 
> v5..v6:
> - memory: ti-aemif: introduce AEMIF driver
> - memory: ti-aemif: add bindings for AEMIF driver
> 	changed opaque names for cs node properties
> 
Can you please pick these two patches ? 

Regards,
Santosh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
