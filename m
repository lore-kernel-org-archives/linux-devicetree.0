Return-Path: <SRS0=pAuD=GY=gmail.com=ykaneko0929@kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdX7t9eZQ+3rhzZBKBjETqC7EUgZ4D+dxwhrwiMxvF3Wdw@mail.gmail.com>
References: <1522379583-4503-1-git-send-email-ykaneko0929@gmail.com>
 <1522379583-4503-2-git-send-email-ykaneko0929@gmail.com> <CAMuHMdX7t9eZQ+3rhzZBKBjETqC7EUgZ4D+dxwhrwiMxvF3Wdw@mail.gmail.com>
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Date: Tue, 3 Apr 2018 20:17:01 +0900
Message-ID: <CAH1o70JGht863MYjRQzyhXyjm60LL_xGO19iSqZas3Fiu6Z6CQ@mail.gmail.com>
Subject: Re: [PATCH/RFT v2 1/3] thermal: rcar_thermal: add r8a77995 support
Content-Type: text/plain; charset="UTF-8"
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Geert-san,

2018-03-30 18:25 GMT+09:00 Geert Uytterhoeven <geert@linux-m68k.org>:
> Hi Kaneko-san,
>
> On Fri, Mar 30, 2018 at 5:13 AM, Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
>> Add support for R-Car D3 (r8a77995) thermal sensor.
>>
>> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
>
> Thanks for your patch!
>
>> --- a/drivers/thermal/rcar_thermal.c
>> +++ b/drivers/thermal/rcar_thermal.c
>> @@ -58,10 +58,35 @@ struct rcar_thermal_common {
>>         spinlock_t lock;
>>  };
>>
>> +enum rcar_thermal_type {
>> +       RCAR_THERMAL,
>> +       RCAR_GEN2_THERMAL,
>> +       RCAR_GEN3_THERMAL,
>> +};
>> +
>> +struct rcar_thermal_chip {
>> +       int use_of_thermal;
>
> This can be a single bit:
>
>     unsigned int use_of_thermal : 1;
>
>> +       enum rcar_thermal_type type;
>
> If you would add feature bits, you can get rid of rcar_thermal_type:
>
>     unsigned int has_filonoff : 1;
>     unsigned int has_enr : 1;
>     unsigned int needs_suspend_resume : 1;
>
> The number of interrupts can be stored here, too.

It's nice!

>
>> +};
>> +
>> +static const struct rcar_thermal_chip rcar_thermal = {
>> +       .use_of_thermal = 0,
>> +       .type = RCAR_THERMAL,
>
> .has_filonoff = 1,
> .has_enr = 0,
> ...
> .nirqs = 1,
>
>> @@ -190,7 +222,8 @@ static int rcar_thermal_update_temp(struct rcar_thermal_priv *priv)
>>          * enable IRQ
>>          */
>>         if (rcar_has_irq_support(priv)) {
>> -               rcar_thermal_write(priv, FILONOFF, 0);
>> +               if (priv->chip->type != RCAR_GEN3_THERMAL)
>
> if (priv->chip->has_filonoff)
>
>> @@ -438,6 +471,9 @@ static int rcar_thermal_probe(struct platform_device *pdev)
>>         struct rcar_thermal_priv *priv;
>>         struct device *dev = &pdev->dev;
>>         struct resource *res, *irq;
>> +       struct rcar_thermal_chip *chip = ((struct rcar_thermal_chip *)
>
> I don't think the cast is needed.

I will make 'chip' a const variable.

>
>> @@ -457,19 +493,35 @@ static int rcar_thermal_probe(struct platform_device *pdev)
>>         pm_runtime_enable(dev);
>>         pm_runtime_get_sync(dev);
>>
>> -       irq = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
>> -       if (irq) {
>> -               /*
>> -                * platform has IRQ support.
>> -                * Then, driver uses common registers
>> -                * rcar_has_irq_support() will be enabled
>> -                */
>> -               res = platform_get_resource(pdev, IORESOURCE_MEM, mres++);
>> -               common->base = devm_ioremap_resource(dev, res);
>> -               if (IS_ERR(common->base))
>> -                       return PTR_ERR(common->base);
>> +       for (i = 0; i < nirq; i++) {
>
> for (i = 0; i < priv->nirqs; i++) {


Best regards,
Kaneko

>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
