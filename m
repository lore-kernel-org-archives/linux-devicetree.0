From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] arm64: dts: uniphier: stabilize ethernet of LD20
 reference boar
Date: Fri, 27 Apr 2018 13:27:35 +0900
Message-ID: <CAK7LNAS6gc1CwvzQTUu+eC9vPO4R1tKtoEzOT-1anHAPEt=cmg@mail.gmail.com>
References: <1524803118-32570-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1524803118-32570-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

2018-04-27 13:25 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> Currently, the ethernet RGMII mode on the LD20 reference board is
> unstable.
>
> The default drive-strength of ethernet TX pins is too strong because
> there is no dumping resistor on the TX lines on the board.
>
> Weaken the drive-strength to make the ethernet more stable.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---


To myself:

Fix the typo in the subject

  boar  ->  board




-- 
Best Regards
Masahiro Yamada
