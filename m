From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 1/3] dt-bindings: clk: g12a: New binding for Meson-G12A SoC
Date: Mon, 9 Jul 2018 23:57:49 +0200
Message-ID: <CAFBinCBJp1xzo-CNW1HU-Odhrug31yQ7c3khB+XwvsNXp5-gTA@mail.gmail.com>
References: <1531134767-29927-1-git-send-email-jian.hu@amlogic.com> <1531134767-29927-2-git-send-email-jian.hu@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1531134767-29927-2-git-send-email-jian.hu@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jian.hu@amlogic.com, robh@kernel.org
Cc: jbrunet@baylibre.com, Neil Armstrong <narmstrong@baylibre.com>, qianggui.song@amlogic.com, devicetree@vger.kernel.org, sboyd@kernel.org, khilman@baylibre.com, mturquette@baylibre.com, yixun.lan@amlogic.com, linux-kernel@vger.kernel.org, bo.yang@amlogic.com, qiufang.dai@amlogic.com, linux-arm-kernel@lists.infradead.org, carlo@caione.org, linux-amlogic@lists.infradead.org, sunny.luo@amlogic.com, linux-clk@vger.kernel.org, xingyu.chen@amlogic.com
List-Id: devicetree@vger.kernel.org

adding Rob Herring so it doesn't get lost on the devicetree mailing list

On Mon, Jul 9, 2018 at 1:13 PM Jian Hu <jian.hu@amlogic.com> wrote:
>
> Add new binding for Meson-G12A SoC Everything-Else part
>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
> index e950599..0833006 100644
> --- a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
> +++ b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
> @@ -9,6 +9,7 @@ Required Properties:
>                 "amlogic,gxbb-clkc" for GXBB SoC,
>                 "amlogic,gxl-clkc" for GXL and GXM SoC,
>                 "amlogic,axg-clkc" for AXG SoC.
> +               "amlogic,g12a-clkc" for G12A SoC.
should this be "amlogic,meson-g12a-clkc" instead?
that would make it consistent with virtually all other bindings which
use the schema "amlogic,meson<chip>-<ip-block>" (where chip is 8, 8b,
8m2, -gxbb, -gxl, ...)

see also: $ grep -R "amlogic," Documentation/devicetree/bindings/

>
>  - #clock-cells: should be 1.
>
> --
> 1.9.1
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
