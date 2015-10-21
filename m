From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 0/8] arm: dts: lpc32xx: updates to LPC32xx SoC and boards
Date: Wed, 21 Oct 2015 16:45 +0200
Message-ID: <3973745.SoYxz6UFdV@wuerfel>
References: <1445117757-8073-1-git-send-email-vz@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445117757-8073-1-git-send-email-vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>, Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sunday 18 October 2015 00:35:49 Vladimir Zapolskiy wrote:
> The change improves description of NXP LPC32xx hardware, among
> important changes it adds standard timers and external memory
> controller nodes, splits PWM device node into two,
> 
> Changes from v1 to v2:
> - removed v1 2/5 "arm: dts: lpc32xx: fix improper usage of ranges property"
> - v1 4/5 "arm: dts: lpc32xx: remove unneeded cell settings from cpus"
>   is replaced by v2 3/8 "arm: dts: lpc32xx: add reg property to cpu device node"
> - new change, sets physical memory offset for EA3250 and PHY3250 v5/8
> - new change, added EMC device node v2 6/8
> - new change, added standard timer nodes v2 7/8
> - new change, grouped USB subdevices together v2 8/8

Looks ok to me. Who should pick them up? I haven't seen pull requests from
Roland in a while. If he's still interested in the port, I think it would be
best if he could create a branch here.

If not, we can pick them up directly this time into arm-soc, but then we
should find a new maintainer.

	Arnd 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
