From: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH_V3 0/2] watchdog: jz4740: Add DT support
Date: Tue, 3 Feb 2015 20:04:50 +0100
Message-ID: <20150203190449.GF2875@spo001.leaseweb.nl>
References: <1422959148-38075-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1422959148-38075-1-git-send-email-Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Zubair,

> Here are two simple patches that add DT support to the jz4740 watchdog driver.
> 
> Patches are based on 3.19-rc7. Quite disjoint and stay within jz4740
> so should apply easily on other trees.
> 
> If you would like to have them rebased to a different tree, please tell.
> 
> V3 Changed
> Added Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> 
> Typo in commit message.
> Rebased to rc7
> 
> V2 Changes
> Renamed binding to jz4740 instead of jz47xx
> Removed clk bindings. They can be added later when the clock tree is fixed.
> Rather than add bindings now and change later.
> 
> Added MODULE_DEVICE_TABLE()
> 
> Thank-you
> 
> ZubairLK
> 
> Zubair Lutfullah Kakakhel (2):
>   dt: watchdog: Add DT binding documentation for jz4740 watchdog timer
>   watchdog: jz4740: Add DT support
> 
>  .../devicetree/bindings/watchdog/ingenic,jz4740-wdt.txt      | 12 ++++++++++++
>  drivers/watchdog/jz4740_wdt.c                                | 10 ++++++++++
>  2 files changed, 22 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/ingenic,jz4740-wdt.txt

Both patches have been added to linux-watchdog-next.

Kind regards,
Wim.

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
