From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v2 0/2] add ethernet nodes for UniPhier SoCs
Date: Wed, 21 Feb 2018 00:26:58 +0900
Message-ID: <CAK7LNASu-+GhZ11TPP3bjpJdTRbisSAKDJB6JJBJyQ3uZkA-bw@mail.gmail.com>
References: <1518600629-14317-1-git-send-email-hayashi.kunihiko@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1518600629-14317-1-git-send-email-hayashi.kunihiko@socionext.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

2018-02-14 18:30 GMT+09:00 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>:
> This series adds ethernet nodes for UniPhier Pro4, PXs2, LD6b, LD11, LD20 SoCs
> and the boards.
>
> Changes since v1:
> - move common descriptions to .dtsi files
> - rename labels of the ethernet nodes to "eth"
>
> Kunihiko Hayashi (2):
>   ARM: dts: uniphier: add AVE ethernet node
>   arm64: dts: uniphier: add AVE ethernet node
>

Applied to linux-uniphier. Thanks!


-- 
Best Regards
Masahiro Yamada
