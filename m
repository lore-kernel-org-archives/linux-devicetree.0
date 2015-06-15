From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RESEND PATCH 2/2] pinctrl: introduce complex pin description
Date: Mon, 15 Jun 2015 10:01:29 -0600
Message-ID: <557EF6D9.6050503@wwwdotorg.org>
References: <1433948699-19800-1-git-send-email-ludovic.desroches@atmel.com> <1433948699-19800-3-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433948699-19800-3-git-send-email-ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/10/2015 09:04 AM, Ludovic Desroches wrote:
> Using a string to describe a pin in the device tree can be not enough.
> Some controllers may need extra information to fully describe a pin. It
> concerns mainly controllers which have a per pin muxing approach which
> don't fit well the notions of groups and functions.
> Instead of using a pin name, a 32 bit value is used. The 16 least
> significant bits are used for the pin number. Other 16 bits can be used to
> store extra parameters.

The driver for the pin controller is supposed to provide this 
information in a table. The whole point of having a driver, rather than 
a table/list of raw register values in the DT, is so the driver can 
provide this information at a semantic level. This information is fixed 
per SoC and so make sense to put into a driver, while the board-specific 
configuration varies wildly, and hence makes sense to put into DT.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
