From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v4 3/6] ARM: at91/dt: define sama5d3 clocks
Date: Mon, 9 Dec 2013 22:05:08 +0100
Message-ID: <201312092205.08933.arnd@arndb.de>
References: <1385650171-8756-1-git-send-email-b.brezillon@overkiz.com> <201312091748.58386.arnd@arndb.de> <52A5F79D.9070408@overkiz.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52A5F79D.9070408-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: boris brezillon <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday 09 December 2013, boris brezillon wrote:
> Are you talking about drivers or clk binding documentation ?
> In either cases they're not defined :-), but I'd like to know which 
> file(s) I should update.

I mean bindings for the devices using these clocks. Each of them should
list among its properties something like

|Mandatory properties:
|  clocks:	One phandle and clock specifier for xxxx
|  clock-names:	The name of this clock, must be "xxxx"

Of course if we decide to make it an anonymous clock, we still need to
document the fact that the clock is required.

> I'd rather not change the static clock lookup tables, but if you prefer this
> approach (and Nicolas agrees), I'll propose a series modifying the drivers
> and clk lookup table.
> 
> Whatever solution is choosen, I guess I'll have to update the drivers dt
> binding documentation anyway ;-).

Ok. FWIW, I think the best way to stage the clock updates (if the decision
is to make them anonymous) would be to duplicate all the clocks in question
in a first patch, and then submit changes for each driver to the respective
subsystem maintainers with a patch based on the first changeset.

Once all the drivers are converted (i.e. the following merge window), we can
remove the obsolete entries.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
