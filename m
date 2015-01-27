From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v3 2/4] ARM: digicolor: add low level debug support
Date: Tue, 27 Jan 2015 15:02:18 -0800
Message-ID: <20150127230218.GC11263@quad.lixom.net>
References: <cover.1421219953.git.baruch@tkos.co.il>
 <5b6342c716e2e56da34d7a518b49817967de948a.1421219953.git.baruch@tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5b6342c716e2e56da34d7a518b49817967de948a.1421219953.git.baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 14, 2015 at 10:40:31AM +0200, Baruch Siach wrote:
> Use the USART peripheral as UART for low level debug. Only the UA0 port is
> currently supported.
> 
> Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Signed-off-by: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
> ---
>  arch/arm/Kconfig.debug             | 12 ++++++++++--
>  arch/arm/include/debug/digicolor.S | 35 +++++++++++++++++++++++++++++++++++
>  2 files changed, 45 insertions(+), 2 deletions(-)
>  create mode 100644 arch/arm/include/debug/digicolor.S

Applied, thanks.

-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
