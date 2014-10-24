From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 12/17] ARM: mvebu: Armada XP GP specific suspend/resume
 code
Date: Fri, 24 Oct 2014 16:28:24 +0200
Message-ID: <20141024162824.67f9ce3d@free-electrons.com>
References: <1414151970-6626-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<1414151970-6626-13-git-send-email-thomas.petazzoni@free-electrons.com>
	<20141024142044.GB3142@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141024142044.GB3142-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dear Andrew Lunn,

On Fri, 24 Oct 2014 16:20:44 +0200, Andrew Lunn wrote:

> Does Marvell mandate this PIC and gpio interface? Or is a board
> designer free to implement it some other way? It seems to me, this
> should be considered specific to the Marvell reference design.

They don't mandate this interface, it's really a board-specific
decision, which is why I've split my implementation between:

 * SoC-specific code, in mach-mvebu/pm.c.

 * Board-specific code, in mach-mvebu/pm-board.c.

> I'm wondering if this code should be a power driver, living in
> drivers/power/reset/.

I'm fine with that, but have you seen the *very* tight interaction
between the SoC-specific code and the board-specific code? The problem
is that the board-specific code needs to put the SDRAM into
self-refresh *right* before shutting down the SoC, and all that while
making sure the code doing both of these operations remains in the
I-Cache, and does not touch any other location in memory (which has
become inaccessible due to being in self-refresh mode).

Look at the mvebu_armada_xp_gp_pm_enter() function: it takes two
arguments, received from the SoC-level code. How to handle this thing
with a driver in drivers/power/reset/ ?

> A few kirkwood boards have a PIC controlling the power. QNAP devices
> use a serial port to talk to it. Others use a single gpio line. Is
> there something to stop a designer doing this for XP?

Nothing stops that. I think Marvell told me they wanted to standardize
this GPIO interface with a PIC, but that's only for their own
development boards. Since it remains something outside the SoC, it is
by nature board-specific, and designers can do pretty much what they
want.

> It seems like you would have a more generic solution by allowing DT to
> specify a power off driver to use.

Sure, but see above. If you have some suggestion, I'm surely interested.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
