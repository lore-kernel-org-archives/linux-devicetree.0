From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: fix dual-edge code defect
Date: Mon, 23 May 2016 12:39:33 +0200
Message-ID: <5742DDE5.7050701@gmail.com>
References: <1463815419-11719-1-git-send-email-hongkun.cao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1463815419-11719-1-git-send-email-hongkun.cao@mediatek.com>
Sender: linux-gpio-owner@vger.kernel.org
To: hongkun.cao@mediatek.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, linus.walleij@linaro.org, erin.lo@mediatek.com
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com, hongzhou.yang@mediatek.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, inux-mediatek@lists.infradead.org, yingjoe.chen@mediatek.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On 21/05/16 09:23, hongkun.cao@mediatek.com wrote:
> From: "hongkun.cao" <hongkun.cao@mediatek.com>
>
> When a dual-edge irq is triggered, an incorrect irq will be reported on
> condition that the external signal is not stable and this incorrect irq
> has been registered.
> Correct the register offset.
>

I'm not sure what you want to say. From what I can see the without this 
fix, the the wrong IRQ will be cleared and raised. Is this what you are 
addressing?

If so:
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> Signed-off-by: hongkun.cao <hongkun.cao@mediatek.com>
> ---
>   drivers/pinctrl/mediatek/pinctrl-mtk-common.c |    5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> index 2bbe6f7..92ae49f 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> @@ -1255,9 +1255,10 @@ static void mtk_eint_irq_handler(struct irq_desc *desc)
>   	const struct mtk_desc_pin *pin;
>
>   	chained_irq_enter(chip, desc);
> -	for (eint_num = 0; eint_num < pctl->devdata->ap_num; eint_num += 32) {
> +	for (eint_num = 0;
> +	     eint_num < pctl->devdata->ap_num;
> +	     eint_num += 32, reg += 4) {
>   		status = readl(reg);
> -		reg += 4;
>   		while (status) {
>   			offset = __ffs(status);
>   			index = eint_num + offset;
>
