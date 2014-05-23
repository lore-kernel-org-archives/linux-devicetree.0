From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v4 0/5] Add platform support for LSI AXM55xx
Date: Fri, 23 May 2014 22:08:56 +0200
Message-ID: <201405232208.56676.arnd@arndb.de>
References: <cover.1400834521.git.anders.berg@avagotech.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1400834521.git.anders.berg-1wcpHE2jlwO1Z/+hSey0Gg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anders Berg <anders.berg-1wcpHE2jlwO1Z/+hSey0Gg@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday 23 May 2014, Anders Berg wrote:
> Hi,
> 
> Here is version 4 of platform support for AXM5516 SoC.
> 
> The clk driver is now applied to clk-next. The rest should be ready for
> arm-soc. Haven't got any response from the power/reset maintainers... I hope
> this driver can be taken via arm-soc as well.

I've merged it all into the next/soc branch now, thanks!

In the future when submitting patches for inclusion, please add the arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
alias to Cc to ensure we don't miss it.

	ARnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
