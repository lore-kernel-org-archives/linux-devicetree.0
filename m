From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/5] Add Core Divider clock support for Armada 370/XP
Date: Thu, 26 Sep 2013 18:12:06 +0200
Message-ID: <20130926181206.70ef355b@skate>
References: <1380144502-24109-1-git-send-email-ezequiel.garcia@free-electrons.com>
	<20130925213730.GA19371@localhost>
	<5243E46B.2000406@free-electrons.com>
	<20130926152651.GC4583@localhost>
	<20130926174755.15a65f92@skate>
	<20130926160010.GD4583@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130926160010.GD4583@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Emilio Lopez <elopez93-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dear Ezequiel Garcia,

On Thu, 26 Sep 2013 13:00:11 -0300, Ezequiel Garcia wrote:

> Hm... could be. Considering the lack of hardware details (as you
> point out) maybe this is indeed the best option.
> 
> And it has the cool advantage of simplfying the clock tree, which
> is unnecessarily complex with the NAND ECC clock -> NAND clock layout.
> 
> On the other side, Emilio has just pointed out (in private) that
> there's a flag "CLK_SET_RATE_PARENT" that is meant for these cases.
> 
> Anyway, I feel inclined to your suggestion and just forget about the
> NAND ECC clock for good, which is only confusing.

Yes, I also believe it's the easiest solution.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
