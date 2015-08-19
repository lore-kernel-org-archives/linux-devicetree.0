From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] ARM: dts: UniPhier: fix PPI interrupt CPU mask of timer nodes
Date: Wed, 19 Aug 2015 14:50:25 +0900
Message-ID: <CAK7LNATCmyO=Ys_cVJ3sox7Dn+qfKAMyxnBAEXVgZN58ApkDEQ@mail.gmail.com>
References: <1439963147-2592-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1439963147-2592-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: arm@kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

2015-08-19 14:45 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> This SoC is integrated with 4 Cortex-A9 cores.  The GIC bindings
> says that the bits[15:8] of the 3rd cell of the interrupts property
> represents PPI interrupt CPU mask.  Because the timer interrupts are
> wired to all of the 4 cores, bits[15:8] should be set to 0xf.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

This has been superseded by v2.

-- 
Best Regards
Masahiro Yamada
