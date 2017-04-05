From: Alexey Firago <alexey_firago-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 1/3] clk: vc5: Add structure to describe particular
 chip features
Date: Wed, 5 Apr 2017 15:36:16 +0300
Message-ID: <de978809-5bec-d675-1ea3-cc61804e2c61@mentor.com>
References: <1491392819-698-1-git-send-email-alexey_firago@mentor.com>
 <1491392819-698-2-git-send-email-alexey_firago@mentor.com>
 <CAMuHMdXEa=1__WMtsRphKbN6h+jVkP7szudENsM3hvGSzDfbwg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdXEa=1__WMtsRphKbN6h+jVkP7szudENsM3hvGSzDfbwg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Geert,

On 05.04.2017 15:15, Geert Uytterhoeven wrote:
> Hi Alexey,
>
> On Wed, Apr 5, 2017 at 1:46 PM, Alexey Firago <alexey_firago-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org> wrote:
>> Introduce vc5_chip_info structure to describe features of a particular
>> VC5 chip (id, number of FODs, number of outputs, flags).
>> For now flags are only used to indicate if chip has internal XTAL.
>> vc5_chip_info is set on probe from the matched of_device_id->data.
>>
>> Also add defines to specify maximum number of FODs and clock outputs
>> supported by the driver.
>>
>> With these changes it should be easier to extend driver to support
>> more VC5 models.
>>
>> Signed-off-by: Alexey Firago <alexey_firago-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
>
> Thanks for your patch!
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
>
>> --- a/drivers/clk/clk-versaclock5.c
>> +++ b/drivers/clk/clk-versaclock5.c
>> @@ -113,12 +113,30 @@
>>  #define VC5_MUX_IN_XIN         BIT(0)
>>  #define VC5_MUX_IN_CLKIN       BIT(1)
>>
>> +/* Maximum number of clk_out supported by this driver */
>> +#define VC5_MAX_CLK_OUT_NUM    3
>> +
>> +/* Maximum number of FODs supported by this driver */
>> +#define VC5_MAX_FOD_NUM        2
>> +
>> +/* flags to describe chip features */
>> +/* chip has built-in oscilator */
>> +#define VC5_HAS_INTERNAL_XTAL  BIT(0)
>
> VC5_HAS_INTERNAL_OSC?

I'm fine with renaming it, but shouldn't it be consistent with the rest 
of the driver (see "internal-xtal", VC5_XTAL*, etc) and IDT datasheet?

>
>> +
>>  /* Supported IDT VC5 models. */
>>  enum vc5_model {
>>         IDT_VC5_5P49V5923,
>>         IDT_VC5_5P49V5933,
>>  };
>>
>> +/* Structure to describe features of a particular VC5 model */
>> +struct vc5_chip_info {
>> +       const enum vc5_model    model;
>> +       const int               clk_fod_cnt;
>> +       const int               clk_out_cnt;
>
> const unsigned int (both)

Will fix.

>
>> +       u32                     flags;
>> +};
>> +
>>  struct vc5_driver_data;
>>
>>  struct vc5_hw_data {
>> @@ -132,15 +150,15 @@ struct vc5_hw_data {
>>  struct vc5_driver_data {
>>         struct i2c_client       *client;
>>         struct regmap           *regmap;
>> -       enum vc5_model          model;
>> +       struct vc5_chip_info    *chip_info;
>
> const struct vc5_chip_info    *chip_info;
>
>> @@ -591,7 +609,7 @@ static int vc5_probe(struct i2c_client *client,
>>         struct vc5_driver_data *vc5;
>>         struct clk_init_data init;
>>         const char *parent_names[2];
>> -       unsigned int n, idx;
>> +       unsigned int n, idx = 0;
>>         int ret;
>>
>>         vc5 = devm_kzalloc(&client->dev, sizeof(*vc5), GFP_KERNEL);
>> @@ -600,7 +618,12 @@ static int vc5_probe(struct i2c_client *client,
>>
>>         i2c_set_clientdata(client, vc5);
>>         vc5->client = client;
>> -       vc5->model = (enum vc5_model)of_id->data;
>> +
>> +       vc5->chip_info = (struct vc5_chip_info *)of_id->data;
>
> I think the cast is no longer needed when chip_info becomes const.
>
> BTW, of_id is not really needed if you write it like:
>
>         vc5->chip_info = of_device_get_match_data(&client->dev);
>
>> +       if (!vc5->chip_info) {
>
> This can't really happen, can it?

Ok. Will rework.

>
>> +               dev_err(&client->dev, "No device match found\n");
>> +               return -ENODEV;
>> +       }
>>
>>         vc5->pin_xin = devm_clk_get(&client->dev, "xin");
>>         if (PTR_ERR(vc5->pin_xin) == -EPROBE_DEFER)
>> @@ -622,8 +645,8 @@ static int vc5_probe(struct i2c_client *client,
>>         if (!IS_ERR(vc5->pin_xin)) {
>>                 vc5->clk_mux_ins |= VC5_MUX_IN_XIN;
>>                 parent_names[init.num_parents++] = __clk_get_name(vc5->pin_xin);
>> -       } else if (vc5->model == IDT_VC5_5P49V5933) {
>> -               /* IDT VC5 5P49V5933 has built-in oscilator. */
>> +       } else if (vc5->chip_info->flags & VC5_HAS_INTERNAL_XTAL) {
>> +               /* chip has built-in oscilator. */
>
> The comment is no longer needed when the bit is named VC5_HAS_INTERNAL_OSC :-)

Ok. Will kill it.

Thanks for your review!

Regards,
Alexey

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
