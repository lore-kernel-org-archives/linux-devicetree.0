From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v4 2/2] ARM: digicolor: select syscon and timer
Date: Thu, 29 Jan 2015 13:52:14 -0800
Message-ID: <20150129215214.GA20785@quad.lixom.net>
References: <8b74c50aebadc781a5aa8061f7639c9164433e84.1422481097.git.baruch@tkos.co.il>
 <2d0359c67f731aab3befa4b3f059cc9fdbcf2ff6.1422481097.git.baruch@tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2d0359c67f731aab3befa4b3f059cc9fdbcf2ff6.1422481097.git.baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 29, 2015 at 12:04:11AM +0200, Baruch Siach wrote:
> The digicolor interrupt controller driver now needs syscon.
> 
> Also, as per clocksource maintainer request, we now have a separate config
> symbol, CONFIG_DIGICOLOR_TIMER, for the digicolor timer.
> 
> Signed-off-by: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>

Thanks, applied 1-2.

-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
