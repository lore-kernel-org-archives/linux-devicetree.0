From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/5] Add Core Divider clock support for Armada 370/XP
Date: Thu, 26 Sep 2013 17:47:55 +0200
Message-ID: <20130926174755.15a65f92@skate>
References: <1380144502-24109-1-git-send-email-ezequiel.garcia@free-electrons.com>
	<20130925213730.GA19371@localhost>
	<5243E46B.2000406@free-electrons.com>
	<20130926152651.GC4583@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130926152651.GC4583@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Emilio Lopez <elopez93-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dear Ezequiel Garcia,

On Thu, 26 Sep 2013 12:26:52 -0300, Ezequiel Garcia wrote:

> 3. We hack the NAND driver to consume the NAND ECC, but use the rate
> as the half of it, and forget about the halved-rate NAND clock.
> This seems certainly hacky.

Is this really hacky? Since we can't change the rate of one without
changing the other, or gating the one without the other, we can also
see those two clocks as being an internal business of the NAND hardware
block. So instead of seeing things as:

                        -------------
 NAND ECC clk    ---->  |           | 
     ||                 |  NAND HW  |
     ||                 |   block   |
     \/                 |           |
 NAND clk        ---->  |           |
                        -------------

You can see things as follows:

                        -------------
                        |           | 
                        |  NAND HW  |
 NAND clk        ---->  |   block   |
                        |           |
                        |           |
                        -------------

and the ECC clock is actually some internal business of the NAND hw
block, and therefore handled internally by the NAND driver, as your
option (3) suggests.

Since the amount of details that we have about the exact hardware
architecture are pretty scarce, I believe this is probably the easiest
solution.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
