From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 5/5] power: supply: max17040: Send uevent in SOC and
 status change
Date: Wed, 29 May 2019 17:00:06 +0200
Message-ID: <CAJKOXPdCtbsPaAgYp5iVBhkAsjXzOYWwttQBptgiUgzhbKi09w@mail.gmail.com>
References: <CAJKOXPf=nPrmw6Vzi_=LmO=dVsV4Gvoc-q75XP2FBEgm9Gxv0A@mail.gmail.com>
 <20190527022258.32748-1-matheus@castello.eng.br> <20190527022258.32748-6-matheus@castello.eng.br>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190527022258.32748-6-matheus@castello.eng.br>
Sender: linux-kernel-owner@vger.kernel.org
To: Matheus Castello <matheus@castello.eng.br>
Cc: sre@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, Chanwoo Choi <cw00.choi@samsung.com>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, lee.jones@linaro.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 27 May 2019 at 04:23, Matheus Castello <matheus@castello.eng.br> wrote:
>
> Notify core through power_supply_changed() in case of changes in state
> of charge and power supply status. This is useful for user-space to
> efficiently update current battery level.
>
> Signed-off-by: Matheus Castello <matheus@castello.eng.br>
> ---
>  drivers/power/supply/max17040_battery.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/power/supply/max17040_battery.c b/drivers/power/supply/max17040_battery.c
> index 61e6fcfea8a1..34278845cfe5 100644
> --- a/drivers/power/supply/max17040_battery.c
> +++ b/drivers/power/supply/max17040_battery.c
> @@ -176,6 +176,9 @@ static void max17040_get_online(struct i2c_client *client)
>  static void max17040_get_status(struct i2c_client *client)
>  {
>         struct max17040_chip *chip = i2c_get_clientdata(client);
> +       int last_status;
> +
> +       last_status = chip->status;
>
>         if (!chip->pdata || !chip->pdata->charger_online
>                         || !chip->pdata->charger_enable) {
> @@ -194,6 +197,9 @@ static void max17040_get_status(struct i2c_client *client)
>
>         if (chip->soc > MAX17040_BATTERY_FULL)
>                 chip->status = POWER_SUPPLY_STATUS_FULL;
> +
> +       if (last_status != chip->status)
> +               power_supply_changed(chip->battery);

Why splitting it from max17040_work()? It seems logical to check soc
and status at the same time.

Best regards,
Krzysztof

>  }
>
>  static void max17040_get_of_data(struct max17040_chip *chip)
> @@ -217,10 +223,18 @@ static void max17040_check_changes(struct i2c_client *client)
>  static void max17040_work(struct work_struct *work)
>  {
>         struct max17040_chip *chip;
> +       int last_soc;
>
>         chip = container_of(work, struct max17040_chip, work.work);
> +
> +       /* store SOC for check change */
> +       last_soc = chip->soc;
>         max17040_check_changes(chip->client);
>
> +       /* check changes and send uevent */
> +       if (chip->soc >= 0 && last_soc != chip->soc)
> +               power_supply_changed(chip->battery);
> +
>         queue_delayed_work(system_power_efficient_wq, &chip->work,
>                            MAX17040_DELAY);
>  }
> --
> 2.20.1
>
