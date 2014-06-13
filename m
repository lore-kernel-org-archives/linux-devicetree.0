From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH V2 00/19] irqchip: crossbar: driver fixes
Date: Fri, 13 Jun 2014 09:14:34 -0700
Message-ID: <1402676074.12385.40.camel@joe-AO725>
References: <1402574007-13987-1-git-send-email-r.sricharan@ti.com>
	 <20140613150122.GP8664@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <20140613150122.GP8664@titan.lakedaemon.net>
Sender: linux-omap-owner@vger.kernel.org
To: Jason Cooper <jason@lakedaemon.net>
Cc: Sricharan R <r.sricharan@ti.com>, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tony@atomide.com, santosh.shilimkar@ti.com, nm@ti.com, rnayak@ti.com, linux@arm.linux.org.uk, tglx@linutronix.de
List-Id: devicetree@vger.kernel.org

On Fri, 2014-06-13 at 11:01 -0400, Jason Cooper wrote:
> Please format the subject lines like so:
> 
>   irqchip: crossbar: Set cb pointer ...
>                      ^
>                      |
>                      \-- note the capitalization

I suggest you don't make this a rule and focus
on more important stuff instead.

Nobody is going to write tools that parse the
changelogs by "git log --format=%s" for case
sensitivity.

As is, it's about half/half.

$ git log --format=%s --no-merges drivers/irqchip/ | \
  grep "^irqchip:" | cut -f3- -d":"

