From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 0/2] add ethernet nodes for UniPhier PXs3 SoC
Date: Wed, 28 Mar 2018 01:32:17 +0900
Message-ID: <CAK7LNAStR8jmOUbSUKGcxRi_mZUwJgAwCN__=c6miN8Nfyd2AQ@mail.gmail.com>
References: <1522146766-14435-1-git-send-email-hayashi.kunihiko@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1522146766-14435-1-git-send-email-hayashi.kunihiko@socionext.com>
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

2018-03-27 19:32 GMT+09:00 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>:
> This series adds ethernet nodes for UniPhier PXs3 SoC and the board,
> and adds pinctrl groups for second ethernet instances because PXs3 has two
> ethernet instances.
>
> Kunihiko Hayashi (2):
>   ARM: dts: uniphier: add pinctrl groups of ethernet for second instance
>   arm64: dts: uniphier: add ethernet node for PXs3

Applied.  Thanks.


>  arch/arm/boot/dts/uniphier-pinctrl.dtsi            | 10 ++++++
>  .../arm64/boot/dts/socionext/uniphier-pxs3-ref.dts | 22 +++++++++++++
>  arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi   | 36 ++++++++++++++++++++++
>  3 files changed, 68 insertions(+)
>
> --
> 2.7.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
