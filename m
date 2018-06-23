From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 1/2] arm64: dts: uniphier: add headphone detect gpio for
 LD20 global board
Date: Sat, 23 Jun 2018 12:47:04 +0900
Message-ID: <CAK7LNATB-oa+K47z+egfV2iSKoD3x2tyMNXQp1ukS2f1Yek54g@mail.gmail.com>
References: <20180619041153.6668-1-suzuki.katsuhiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180619041153.6668-1-suzuki.katsuhiro@socionext.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>
Cc: DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Jassi Brar <jaswinder.singh@linaro.org>
List-Id: devicetree@vger.kernel.org

2018-06-19 13:11 GMT+09:00 Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>:
> This patch adds GPIO for headphone detection on LD20 global board.
>
> Signed-off-by: Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>
> ---
>  arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts b/arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts
> index 6a074a20c924..38b75998e2dd 100644
> --- a/arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts
> +++ b/arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts
> @@ -60,6 +60,7 @@
>                         &i2s_port4
>                         &spdif_port0
>                         &comp_spdif_port0>;
> +               hp-det-gpio = <&gpio UNIPHIER_GPIO_PORT(15, 0) GPIO_ACTIVE_LOW>;


When you use irq-capable gpio pin (XIRQ0),
please write like follows for consistency.


             hp-det-gpio = <&gpio UNIPHIER_GPIO_IRQ(0) GPIO_ACTIVE_LOW>;


See uniphier-ld20-ref.dts for example.



>         };
>
>         spdif-out {
> --
> 2.17.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
