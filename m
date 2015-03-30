From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 02/10] mtd: st_spi_fsm: Fetch boot device locations
 from DT match tables
Date: Mon, 30 Mar 2015 11:16:11 -0700
Message-ID: <20150330181611.GC32500@ld-irv-0074>
References: <1421853868-8262-1-git-send-email-lee.jones@linaro.org>
 <1421853868-8262-3-git-send-email-lee.jones@linaro.org>
 <20150206042744.GK18140@ld-irv-0074>
 <20150210074634.GD8020@x1>
 <20150224050452.GG18140@ld-irv-0074>
 <20150224094110.GA20969@x1>
 <20150313160601.GI12966@brian-ubuntu>
 <20150316081306.GD3383@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150316081306.GD3383@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 16, 2015 at 08:13:06AM +0000, Lee Jones wrote:
> So when you said "we have consistently agreed that we aren't going to
> work around that in Linux", who has agreed this.  Would you be kind
> enough to point me in the direction of that conversation please?

A few pointers from recent history:

http://lists.infradead.org/pipermail/linux-mtd/2014-September/055156.html

http://lists.infradead.org/pipermail/linux-mtd/2014-September/055559.html

If the question came up in other threads, though, I'm sure the answers
were the same.

BTW, there are sound solutions to this problem in Linux, and they are
supported where possible. Some flash support a separate set of opcodes
that always expect a 4-byte address. If we use these opcodes, we never
have to do any persistent mode-switching. We only found that Spansion
consistently supports these opcodes on all their flash, though.

See:

commit 87c9511fba2bd069a35e1312587a29e112fc0cd6
Author: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date:   Thu Apr 11 01:34:57 2013 -0700

    mtd: m25p80: utilize dedicated 4-byte addressing commands

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
