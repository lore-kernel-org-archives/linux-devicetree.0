From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] arm64: dts: uniphier: add fixed regulators for audio codec
Date: Tue, 6 Mar 2018 10:33:45 +0900
Message-ID: <CAK7LNASTRCy=MOVVAJhobnZ4SLvdWoy+wR=tovb-bLJLRhxs9Q@mail.gmail.com>
References: <20180228093247.29648-1-suzuki.katsuhiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180228093247.29648-1-suzuki.katsuhiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

2018-02-28 18:32 GMT+09:00 Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>:
> This patch adds regulators that have fixed voltage for audio codec
> on UniPhier LD11/20 Global boards. This patch fixes warnings about
> TAS57xx audio codec such as "tas571x 0-001b: 0-001b supply AVDD
> not found, using dummy regulator".
>
> Signed-off-by: Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>

Applied to linux-uniphier.  Thanks!



-- 
Best Regards
Masahiro Yamada
