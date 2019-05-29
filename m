From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 4/5] power: supply: max17040: Clear ALRT bit when the
 SOC are above threshold
Date: Wed, 29 May 2019 16:54:47 +0200
Message-ID: <CAJKOXPcFPwBJ26V2rOS7t5H221B0H-MsDmC4Xb7gGHRX_ETxtQ@mail.gmail.com>
References: <CAJKOXPf=nPrmw6Vzi_=LmO=dVsV4Gvoc-q75XP2FBEgm9Gxv0A@mail.gmail.com>
 <20190527022258.32748-1-matheus@castello.eng.br> <20190527022258.32748-5-matheus@castello.eng.br>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190527022258.32748-5-matheus@castello.eng.br>
Sender: linux-kernel-owner@vger.kernel.org
To: Matheus Castello <matheus@castello.eng.br>
Cc: sre@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, Chanwoo Choi <cw00.choi@samsung.com>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, lee.jones@linaro.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 27 May 2019 at 04:45, Matheus Castello <matheus@castello.eng.br> wrote:
>
> In order to not generate duplicate interrupts we clear the ALRT bit when
> the SOC is in a state that shows that the battery is charged above the set
> threshold for the SOC low level alert.

I think interrupt/alert bit should be cleared while handling
interrupt, not later because:
1. It is logical to clear it when servicing it,
2. It is simpler - no need for "chip->alert_bit",
3. The alert threshold is understood as alert/warning so every
interrupt should generate uevent. I understand you wanted to remove
"duplicate interrupts" but in fact there are no duplicates. Every next
interrupt comes from change of SoC while being below the critical
level. Therefore on each such change user-space should be woken up and
notified (e.g. to show the message to the user).

I also think this should be squashed with previous patch as it does
not make sense as standalone commit.

>
> Signed-off-by: Matheus Castello <matheus@castello.eng.br>
> ---
>  drivers/power/supply/max17040_battery.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/power/supply/max17040_battery.c b/drivers/power/supply/max17040_battery.c
> index 2f4851608cfe..61e6fcfea8a1 100644
> --- a/drivers/power/supply/max17040_battery.c
> +++ b/drivers/power/supply/max17040_battery.c
> @@ -48,6 +48,7 @@ struct max17040_chip {
>         int status;
>         /* Low alert threshold from 32% to 1% of the State of Charge */
>         u32 low_soc_alert_threshold;
> +       int alert_bit;
>  };
>
>  static int max17040_get_property(struct power_supply *psy,
> @@ -107,6 +108,7 @@ static void max17040_reset(struct i2c_client *client)
>  static int max17040_set_low_soc_threshold_alert(struct i2c_client *client,
>         u32 level)
>  {
> +       struct max17040_chip *chip = i2c_get_clientdata(client);
>         int ret;
>         u16 data;
>
> @@ -118,6 +120,7 @@ static int max17040_set_low_soc_threshold_alert(struct i2c_client *client,
>                 data &= MAX17040_ATHD_MASK;
>                 data |= level;
>                 max17040_write_reg(client, MAX17040_RCOMP, data);
> +               chip->alert_bit = 0;
>                 ret = 0;
>         } else {
>                 ret = -EINVAL;
> @@ -144,6 +147,11 @@ static void max17040_get_soc(struct i2c_client *client)
>         soc = max17040_read_reg(client, MAX17040_SOC);
>
>         chip->soc = (soc >> 8);
> +
> +       /* check SOC level to clear ALRT bit */
> +       if (chip->soc > chip->low_soc_alert_threshold && chip->alert_bit)
> +               max17040_set_low_soc_threshold_alert(client,
> +                       chip->low_soc_alert_threshold);
>  }
>
>  static void max17040_get_version(struct i2c_client *client)
> @@ -229,6 +237,9 @@ static irqreturn_t max17040_thread_handler(int id, void *dev)
>         /* send uevent */
>         power_supply_changed(chip->battery);
>
> +       /* ALRT bit is seted */

s/seted/set/

Best regards,
Krzysztof

> +       chip->alert_bit = 1;
> +
>         return IRQ_HANDLED;
>  }
>
> --
> 2.20.1
>
