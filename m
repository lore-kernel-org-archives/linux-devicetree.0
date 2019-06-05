From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 3/5] power: supply: max17040: Config alert SOC low
 level threshold from FDT
Date: Wed, 5 Jun 2019 14:05:12 +0200
Message-ID: <CAJKOXPfpSEq+eOGsZjQQociuemzb1=E4_OetfCEvLyNxVxJpmQ@mail.gmail.com>
References: <CAJKOXPf=nPrmw6Vzi_=LmO=dVsV4Gvoc-q75XP2FBEgm9Gxv0A@mail.gmail.com>
 <20190527022258.32748-1-matheus@castello.eng.br> <20190527022258.32748-4-matheus@castello.eng.br>
 <CAJKOXPd2F6iy0ZqYf+X2k=eQ=tY1zG4gVbrr68XqE9+w4HK6dw@mail.gmail.com> <69a4f003-4413-1316-6145-f8bef2171e86@castello.eng.br>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <69a4f003-4413-1316-6145-f8bef2171e86@castello.eng.br>
Sender: linux-kernel-owner@vger.kernel.org
To: Matheus Castello <matheus@castello.eng.br>
Cc: sre@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, Chanwoo Choi <cw00.choi@samsung.com>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, lee.jones@linaro.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 3 Jun 2019 at 00:42, Matheus Castello <matheus@castello.eng.br> wrote:
>
>
>
> On 5/29/19 11:46 AM, Krzysztof Kozlowski wrote:
> > On Mon, 27 May 2019 at 04:46, Matheus Castello <matheus@castello.eng.br> wrote:
> >>
> >> For configuration of fuel gauge alert for a low level state of charge
> >> interrupt we add a function to config level threshold and a device tree
> >> binding property to set it in flatned device tree node.
> >>
> >> Now we can use "maxim,alert-low-soc-level" property with the values from
> >> 1% up to 32% to configure alert interrupt threshold.
> >>
> >> Signed-off-by: Matheus Castello <matheus@castello.eng.br>
> >> ---
> >>   drivers/power/supply/max17040_battery.c | 52 +++++++++++++++++++++++--
> >>   1 file changed, 49 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/power/supply/max17040_battery.c b/drivers/power/supply/max17040_battery.c
> >> index b7433e9ca7c2..2f4851608cfe 100644
> >> --- a/drivers/power/supply/max17040_battery.c
> >> +++ b/drivers/power/supply/max17040_battery.c
> >> @@ -29,6 +29,9 @@
> >>   #define MAX17040_DELAY         1000
> >>   #define MAX17040_BATTERY_FULL  95
> >>
> >> +#define MAX17040_ATHD_MASK             0xFFC0
> >> +#define MAX17040_ATHD_DEFAULT_POWER_UP 4
> >> +
> >>   struct max17040_chip {
> >>          struct i2c_client               *client;
> >>          struct delayed_work             work;
> >> @@ -43,6 +46,8 @@ struct max17040_chip {
> >>          int soc;
> >>          /* State Of Charge */
> >>          int status;
> >> +       /* Low alert threshold from 32% to 1% of the State of Charge */
> >> +       u32 low_soc_alert_threshold;
> >>   };
> >>
> >>   static int max17040_get_property(struct power_supply *psy,
> >> @@ -99,6 +104,28 @@ static void max17040_reset(struct i2c_client *client)
> >>          max17040_write_reg(client, MAX17040_CMD, 0x0054);
> >>   }
> >>
> >> +static int max17040_set_low_soc_threshold_alert(struct i2c_client *client,
> >> +       u32 level)
> >> +{
> >> +       int ret;
> >> +       u16 data;
> >> +
> >> +       /* check if level is between 1% and 32% */
> >> +       if (level > 0 && level < 33) {
> >> +               level = 32 - level;
> >> +               data = max17040_read_reg(client, MAX17040_RCOMP);
> >> +               /* clear the alrt bit and set LSb 5 bits */
> >> +               data &= MAX17040_ATHD_MASK;
> >> +               data |= level;
> >> +               max17040_write_reg(client, MAX17040_RCOMP, data);
> >> +               ret = 0;
>
> I will put the return of max17040_write_reg on ret, instead of ret = 0.
>
> >> +       } else {
> >> +               ret = -EINVAL;
> >> +       }
> >
> > This is unusual way of handling error... when you parse DTS, you
> > accept any value for "level" (even incorrect one). You validate the
> > value later when setting it and show an error... however you ignore
> > the error of max17040_write_reg() here... This is correct but looks
> > unusual.
> >
>
> Ok, so would it be better to check the level value in
> "max17040_get_of_data" and return an error there if the input is wrong?

I think yes. It looks more natural - validate the value as early as
possible and fail the probe which gives the information about point of
failure.

Best regards,
Krzysztof
