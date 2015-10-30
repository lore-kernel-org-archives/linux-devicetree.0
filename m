From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] Revert "h8300: clocksource"
Date: Fri, 30 Oct 2015 12:19:08 +0100
Message-ID: <7633294.svub55eV7t@wuerfel>
References: <1446200775-23898-1-git-send-email-daniel.lezcano@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1446200775-23898-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: tglx@linutronix.de, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>
List-Id: devicetree@vger.kernel.org

On Friday 30 October 2015 11:26:08 Daniel Lezcano wrote:
> This reverts commit 618b902d8c098f2fff188119da7b3184c4bc5483.
> 
> The renesas architecture have been dropped and re-introduced two years
> after with a supposed improvement of the code.
> 
> While looking at the timer drivers, I see it did not passed a correct code
> review process. No maintainters were in Cc, not code review and no ack
> from them (Thomas and I).
> 
> Even if those drivers where already in the tree several years ago, that
> does not prevent them, when re-introduced, to be reviewed again and at
> least acked by the maintainer.
> 
> Even if the patches where on lkml@, that does not prevent the different
> sub-system maintainers to be in Cc.

Agreed.

> Instead of that, these drivers passed silently through another tree (arm-soc
> I guess).

No need to speculate when you can look it up easily (it wasn't us):

$ git log --oneline --merges --ancestry-path 618b902d8c098f2fff188119da7b3184c4bc5483.. | tail -n1
55a7d4b85ca1 Merge tag 'for-4.2' of git://git.sourceforge.jp/gitroot/uclinux-h8/linux
$ git show 55a7d4b85ca1
commit 55a7d4b85ca1f723d26b8956e8faeff730d0d240
Merge: aefbef10e3ae 07834743f42b
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu Jun 25 13:07:24 2015 -0700

    Merge tag 'for-4.2' of git://git.sourceforge.jp/gitroot/uclinux-h8/linux
    
    Pull Renesas H8/300 architecture re-introduction from Yoshinori Sato.
    
    We dropped arch/h8300 two years ago as stale and old, this is a new and
    more modern rewritten arch support for the same architecture.


I reviewed the series before it was merged, but failed to notice that you
were not on Cc, and I did not look at the clocksource drivers in much
detail (if at all).

> There is legacy code to be removed.
>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>

I found that Yoshinori Sato has always addressed all review comments very
quickly by rewriting the code in a proper manner when mistakes were
pointed out in the other drivers. Maybe you can describe now what the
problems are with the three drivers to give him a chance to fix them?

	Arnd
