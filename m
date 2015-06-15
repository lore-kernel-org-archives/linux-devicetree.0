From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RESEND PATCH 1/2] pinctrl: change function behavior for per
 pin muxing controllers
Date: Mon, 15 Jun 2015 09:58:05 -0600
Message-ID: <557EF60D.8020007@wwwdotorg.org>
References: <1433948699-19800-1-git-send-email-ludovic.desroches@atmel.com> <1433948699-19800-2-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433948699-19800-2-git-send-email-ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/10/2015 09:04 AM, Ludovic Desroches wrote:
> When having a controller which allows per pin muxing, declaring with
> which groups a function can be used is a useless constraint since groups
> are something virtual.

This isn't true.

Irrespective of whether a particular piece of pinmux HW can control the 
mux function for each pin individually, or only in groups, it's quite 
likely that each function can only be selected onto a subset of those 
pins or groups. Requiring the pinctrl driver to inform the core which 
set of pins/groups particular functions can be selected onto seems quite 
reasonable.

In my opinion at least, for HW that can select the mux function at the 
per-pin level, the only sensible set of groups is one group per pin with 
each group containing a single pin. Any other use of groups is a 
SW/user-level construct, and is something unrelated to why the pinctrl 
subsystem supports groups. If we want to represent those groups in 
pinctrl, there should be two separate sets of groups; one to represent 
the actual HW capabilities, and one to represent the SW/user-level 
convenience abstractions.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
