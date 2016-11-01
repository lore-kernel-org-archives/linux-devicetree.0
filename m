From: Akinobu Mita <akinobu.mita@gmail.com>
Subject: Re: [PATCH] clk: cdce925: add support for CDCE913, CDCE937, and CDCE949
Date: Tue, 1 Nov 2016 22:52:54 +0900
Message-ID: <CAC5umyiVcV_KEL+g=mRL-mGQfJrCU5XrEVNzX=CFFXWNuTMBGQ@mail.gmail.com>
References: <1477848637-5151-1-git-send-email-akinobu.mita@gmail.com> <20161031181509.GS16026@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20161031181509.GS16026@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, Mike Looijmans <mike.looijmans@topic.nl>, Michael Turquette <mturquette@linaro.org>
List-Id: devicetree@vger.kernel.org

2016-11-01 3:15 GMT+09:00 Stephen Boyd <sboyd@codeaurora.org>:
> On 10/31, Akinobu Mita wrote:
>> @@ -582,13 +615,19 @@ static int cdce925_probe(struct i2c_client *client,
>>       struct clk_cdce925_chip *data;
>>       struct device_node *node = client->dev.of_node;
>>       const char *parent_name;
>> -     const char *pll_clk_name[NUMBER_OF_PLLS] = {NULL,};
>> +     const char *pll_clk_name[MAX_NUMBER_OF_PLLS] = {NULL,};
>>       struct clk_init_data init;
>>       u32 value;
>>       int i;
>>       int err;
>>       struct device_node *np_output;
>>       char child_name[6];
>> +     struct regmap_config cdce925_regmap_config = {
>
> Maybe just call this config because it's a local variable now.

Sounds good.

>> +             .name = "configuration0",
>> +             .reg_bits = 8,
>> +             .val_bits = 8,
>> +             .cache_type = REGCACHE_RBTREE,
>> +     };
>>
>>       dev_dbg(&client->dev, "%s\n", __func__);
>>       data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
>> @@ -596,6 +635,9 @@ static int cdce925_probe(struct i2c_client *client,
>>               return -ENOMEM;
>>
>>       data->i2c_client = client;
>> +     data->chip_info = &clk_cdce925_chip_info_tbl[id->driver_data];
>> +     cdce925_regmap_config.max_register = CDCE925_OFFSET_PLL +
>> +             data->chip_info->num_plls * 0x10 - 1;
>>       data->regmap = devm_regmap_init(&client->dev, &regmap_cdce925_bus,
>>                       &client->dev, &cdce925_regmap_config);
>>       if (IS_ERR(data->regmap)) {
>> @@ -728,13 +780,19 @@ static int cdce925_probe(struct i2c_client *client,
>>  }
>>
>>  static const struct i2c_device_id cdce925_id[] = {
>> -     { "cdce925", 0 },
>> +     { "cdce913", CDCE913 },
>> +     { "cdce925", CDCE925 },
>> +     { "cdce937", CDCE937 },
>> +     { "cdce949", CDCE949 },
>>       { }
>>  };
>>  MODULE_DEVICE_TABLE(i2c, cdce925_id);
>>
>>  static const struct of_device_id clk_cdce925_of_match[] = {
>> +     { .compatible = "ti,cdce913" },
>>       { .compatible = "ti,cdce925" },
>> +     { .compatible = "ti,cdce937" },
>> +     { .compatible = "ti,cdce949" },
>
> Doesn't this need to be updated to point to the correct enum
> values?

I think it isn't needed. Because the data field in struct of_device_id
for this driver is not used even if the device is registered from
device tree.  But the driver_data in i2c_device_id is used instead.
