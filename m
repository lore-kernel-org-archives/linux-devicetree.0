From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: BCM5301X: Specify serial console parameters
Date: Tue, 14 Mar 2017 13:51:39 +0100
Message-ID: <20170314125139.GW15842@lunn.ch>
References: <20170314075830.2247-1-zajec5@gmail.com>
 <20170314122650.GV15842@lunn.ch>
 <3345fb38-fbea-141e-6ad2-a3341e2c31fe@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3345fb38-fbea-141e-6ad2-a3341e2c31fe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rafa?? Mi??ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Rafa?? Mi??ecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

> >The alias is fine. But putting the stdout-path here is unusual. Which
> >serial port is used for console is board specific, where as
> >bcm5301x.dtsi is very generic, it describes the SoC, not a board.  If
> >you look at other .dtsi files, those that specify stdout-path contain
> >properties which are common to a range of similar boards.
> 
> So far I've never seen any board using other uart. Also uart0 is disabled by
> default and we enable it per board family (BCM4708 / BCM47081 / BCM4709 /
> BCM47094). I think it's just more practical to have simple DTS that covers
> 99,9% boards by default and handled that margin of devices separately.
> 
> We already got a lot of duplicated code for enabling uart0, see:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7b790d3b2943bf8e7e7bafe184008bd6451fe0bd
> 
> Jon Mason from Broadcom who knows this hardware and designs very well confirmed
> it's a sane/safe assumption.

I don't disagree with you, it does make sense. But it is just
different to every other SoC .dtsi file Linux has. And we try to avoid
things being different.

It is down to Florian to decide, as maintainer.

   Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
