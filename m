From: Belisko Marek <marek.belisko@gmail.com>
Subject: Re: [PATCH] power: twl4030_madc_battery: Add device tree support.
Date: Fri, 14 Feb 2014 15:49:40 +0100
Message-ID: <CAAfyv34JALq4khS39mKcBzZtrpSeGhqcn-13yCovbA7UXiOmaQ@mail.gmail.com>
References: <1392384259-14311-1-git-send-email-marek@goldelico.com>
	<20140214134349.GB17796@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20140214134349.GB17796@e106331-lin.cambridge.arm.com>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "rob@landley.net" <rob@landley.net>, "dbaryshkov@gmail.com" <dbaryshkov@gmail.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "hns@goldelico.com" <hns@goldelico.com>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 14, 2014 at 2:43 PM, Mark Rutland <mark.rutland@arm.com> wr=
ote:
> On Fri, Feb 14, 2014 at 01:24:19PM +0000, Marek Belisko wrote:
>> Signed-off-by: Marek Belisko <marek@goldelico.com>
>> ---
>>  .../bindings/power_supply/twl4030_madc_battery.txt |  15 +++
>>  drivers/power/twl4030_madc_battery.c               | 109 ++++++++++=
+++++++++++
>>  2 files changed, 124 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/power_supply/t=
wl4030_madc_battery.txt
>>
>> diff --git a/Documentation/devicetree/bindings/power_supply/twl4030_=
madc_battery.txt b/Documentation/devicetree/bindings/power_supply/twl40=
30_madc_battery.txt
>> new file mode 100644
>> index 0000000..bebc876
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/power_supply/twl4030_madc_ba=
ttery.txt
>> @@ -0,0 +1,15 @@
>> +twl4030_madc_battery
>> +
>> +Required properties:
>> + - compatible : "ti,twl4030-madc-battery"
>> + - capacity : battery capacity in uAh
>> + - charging-calibration-data : list of voltage(mV):level(%) values =
for charging calibration (see example)
>> + - discharging-calibration-data : list of voltage(mV):level(%) valu=
es for discharging calibration (see example)
>> +
>> +Example:
>> +     madc-battery {
>> +             compatible =3D "ti,twl4030-madc-battery";
>> +             capacity =3D <1200000>;
>> +             charging-calibration-data =3D <4200 100 4100 75 4000 5=
5 3900 25 3800 5 3700 2 3600 1 3300 0>;
>> +             discharging-calibration-data =3D <4200 100 4100 95 400=
0 70 3800 50 3700 10 3600 5 3300 0>;
>
> Please bracket list entries individually.
OK.
>
>> +     };
>> diff --git a/drivers/power/twl4030_madc_battery.c b/drivers/power/tw=
l4030_madc_battery.c
>> index 7ef445a..2843382 100644
>> --- a/drivers/power/twl4030_madc_battery.c
>> +++ b/drivers/power/twl4030_madc_battery.c
>> @@ -19,6 +19,7 @@
>>  #include <linux/sort.h>
>>  #include <linux/i2c/twl4030-madc.h>
>>  #include <linux/power/twl4030_madc_battery.h>
>> +#include <linux/of.h>
>>
>>  struct twl4030_madc_battery {
>>       struct power_supply psy;
>> @@ -188,6 +189,110 @@ static int twl4030_cmp(const void *a, const vo=
id *b)
>>               ((struct twl4030_madc_bat_calibration *)a)->voltage;
>>  }
>>
>> +#ifdef CONFIG_OF
>> +static struct twl4030_madc_bat_platform_data *
>> +     twl4030_madc_dt_probe(struct platform_device *pdev)
>> +{
>> +     struct twl4030_madc_bat_platform_data *pdata;
>> +     struct device_node *np =3D pdev->dev.of_node;
>> +     struct property *prop;
>> +     int ret;
>> +     int sz, i, j =3D 0;
>> +
>> +     pdata =3D devm_kzalloc(&pdev->dev,
>> +                     sizeof(struct twl4030_madc_bat_platform_data),
>> +                     GFP_KERNEL);
>> +     if (!pdata)
>> +             return ERR_PTR(-ENOMEM);
>> +
>> +     ret =3D of_property_read_u32(np, "capacity", &pdata->capacity)=
;
>> +     if (ret !=3D 0)
>> +             return ERR_PTR(-EINVAL);
>> +
>> +     /* parse and prepare charging data */
>> +     prop =3D of_find_property(np, "charging-calibration-data", &sz=
);
>> +     if (!prop)
>> +             return ERR_PTR(-EINVAL);
>> +
>> +     if (sz % 2) {
>> +             dev_warn(&pdev->dev, "Count of charging-calibration-da=
ta must be even!\n");
>> +             return ERR_PTR(-EINVAL);
>> +     }
>
> As sz is in bytes this checks that the property is a multiple of 2
> bytes, not that it has an even number of u32 elements.
>
> Heiko St=C3=BCbner recently added of_property_count_u32_elems [1,2]. =
Use that
> instead.
OK I'll convert it to that approach. Then seems code will be much
easier. Thanks for pointing to it.
>
>> +
>> +     sz /=3D sizeof(u32);
>> +
>> +     {
>> +             u32 data[sz];
>> +
>> +             ret =3D of_property_read_u32_array(np,
>> +                             "charging-calibration-data", &data[0],=
 sz);
>> +             if (ret)
>> +                     return ERR_PTR(ret);
>
> Why not just allocate then try to read, possibly having to free if th=
e
> read fails?
>
> Otherwise we're trying to put an arbitrarily large value onto the sta=
ck
> for no good reason.
>
>> +
>> +             pdata->charging =3D devm_kzalloc(&pdev->dev,
>> +                             sizeof(struct twl4030_madc_bat_calibra=
tion) * (sz / 2),
>> +                             GFP_KERNEL);
>> +
>> +             for (i =3D 0; i < sz; i +=3D 2) {
>> +                     pdata->charging[j].voltage =3D data[i];
>> +                     pdata->charging[j].level =3D data[i+1];
>> +                     j++;
>
> Why not have (i =3D 0; i < sz/2; i++), and get rid of j?
>
>> +             }
>> +
>> +             pdata->charging_size =3D sz / 2;
>> +     }
>> +
>> +     /* parse and prepare discharging data */
>> +     prop =3D of_find_property(np, "discharging-calibration-data", =
&sz);
>> +     if (!prop)
>> +             return ERR_PTR(-EINVAL);
>> +
>> +     if (sz % 2) {
>> +             dev_warn(&pdev->dev, "Count of discharging-calibration=
-data must be even!\n");
>> +             return ERR_PTR(-EINVAL);
>> +     }
>
> This has the same issues as with charging-calibration-data.
>
> Thanks,
> Mark.
>
> [1] http://www.spinics.net/lists/devicetree/msg21358.html
> [2] http://www.spinics.net/lists/devicetree/msg21502.html

BR,

marek

--=20
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
=46reelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
