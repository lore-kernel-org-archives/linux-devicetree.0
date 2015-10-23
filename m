From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/4] ARM: dts: uniphier: delete i2c aliases
Date: Fri, 23 Oct 2015 22:16:29 +0200
Message-ID: <4000897.7Un1B3qMyp@wuerfel>
References: <1445427390-22750-1-git-send-email-yamada.masahiro@socionext.com> <1445427390-22750-3-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445427390-22750-3-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, arm@kernel.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 21 October 2015 20:36:28 Masahiro Yamada wrote:
> The user space should not expect that a particular I2C channel is
> always visible through the same character device.
> No reason to fix the I2C indexes with aliases.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> 

As I said in my reply to the earlier mail, I didn't really like the
idea of having holes in the numbering for the i2c controllers, but
this new approach also doesn't look ideal.

We should have stable bus numbers on any given board, and the aliases
work well for that. I just don't think the aliases need to be stable
between different boards just because they are based on the same
SoC.

I'd suggest staying with the current slightly awkward approach though,
to avoid regressions. Please send a follow-up patch to add the same
aliases on the new boards and drop this patch, unless someone else
can come up with a better idea.

	Arnd
