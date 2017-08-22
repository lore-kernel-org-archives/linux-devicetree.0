From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3] mfd: max77693: Add muic of_compatible in mfd_cell
Date: Tue, 22 Aug 2017 14:01:13 +0200
Message-ID: <CAJKOXPeJeMOgQB32ajWT15TLHw6h8cxnf5UFT-dturCfarxv0g@mail.gmail.com>
References: <CGME20170822073921eucas1p19bfd5837c4788b9be3ab811c26391364@eucas1p1.samsung.com>
 <1503387537-18342-1-git-send-email-m.purski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1503387537-18342-1-git-send-email-m.purski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maciej Purski <m.purski@samsung.com>
Cc: linux-kernel@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, lee.jones@linaro.org, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 22, 2017 at 9:38 AM, Maciej Purski <m.purski@samsung.com> wrote:
> This patch adds muic of_compatible in order to use the muic device
> driver in device tree.
>
> v2:
> - added muic to documentation

Change log should not go to commit message. Put it after separator ---.

+cc devicetree - scripts/get_maintainer.pl should point you that list.

With the change in commit msg:
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

>
> v3:
> - removed duplication
>
> Signed-off-by: Maciej Purski <m.purski@samsung.com>
> ---
>  Documentation/devicetree/bindings/mfd/max77693.txt | 6 ++++++
>  drivers/mfd/max77693.c                             | 5 ++++-
>  2 files changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mfd/max77693.txt b/Documentation/devicetree/bindings/mfd/max77693.txt
> index 6a1ae3a..e675497 100644
> --- a/Documentation/devicetree/bindings/mfd/max77693.txt
> +++ b/Documentation/devicetree/bindings/mfd/max77693.txt
> @@ -127,6 +127,12 @@ Required properties for the LED child node:
>  Optional properties for the LED child node:
>  - label : see Documentation/devicetree/bindings/leds/common.txt
>
> +Optional nodes:
> +- max77693-muic :
> +       Node used only by extcon consumers.
> +       Required properties:
> +               - compatible : "maxim,max77693-muic"
> +
>  Example:
>  #include <dt-bindings/leds/common.h>
>
> diff --git a/drivers/mfd/max77693.c b/drivers/mfd/max77693.c
> index 662ae0d..1c05ea0 100644
> --- a/drivers/mfd/max77693.c
> +++ b/drivers/mfd/max77693.c
> @@ -48,7 +48,10 @@ static const struct mfd_cell max77693_devs[] = {
>                 .name = "max77693-charger",
>                 .of_compatible = "maxim,max77693-charger",
>         },
> -       { .name = "max77693-muic", },
> +       {
> +               .name = "max77693-muic",
> +               .of_compatible = "maxim,max77693-muic",
> +       },
>         {
>                 .name = "max77693-haptic",
>                 .of_compatible = "maxim,max77693-haptic",
> --
> 2.7.4
>
