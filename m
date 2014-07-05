From: Axel Lin <axel.lin@ingics.com>
Subject: Re: [PATCH v2 1/4] regulator: act8865: set correct number of
 regulators in pdata
Date: Sat, 5 Jul 2014 23:31:23 +0800
Message-ID: <CAFRkauBSgU-zUKqkpR52U3jcjd6wQc_g9rCKUfxOZwm5_BPQqg@mail.gmail.com>
References: <1404566456-9121-1-git-send-email-b.galvani@gmail.com>
	<1404566456-9121-2-git-send-email-b.galvani@gmail.com>
	<CAFRkauDmTeh0Uk9T5xtWuZ4C9LH9QZN0MdFf3Ay0_8_prkrW9g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CAFRkauDmTeh0Uk9T5xtWuZ4C9LH9QZN0MdFf3Ay0_8_prkrW9g@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Beniamino Galvani <b.galvani@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Wenyou Yang <wenyou.yang@atmel.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

2014-07-05 23:08 GMT+08:00 Axel Lin <axel.lin@ingics.com>:
> 2014-07-05 21:20 GMT+08:00 Beniamino Galvani <b.galvani@gmail.com>:
>> act8865_pdata_from_dt() populates the array pdata->regulators with all
>> the regulators and then assigns the field init_data only for the ones
>> actually found in the DT.
>>
>> The patch changes the value assigned to pdata->num_regulators to match
>> the size of the array.
>>
>> Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
>> Tested-by: Wenyou Yang <wenyou.yang@atmel.com>
>> ---
>>  drivers/regulator/act8865-regulator.c |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/regulator/act8865-regulator.c b/drivers/regulator/act8865-regulator.c
>> index f07be36..52d1b6c 100644
>> --- a/drivers/regulator/act8865-regulator.c
>> +++ b/drivers/regulator/act8865-regulator.c
>> @@ -230,7 +230,7 @@ static int act8865_pdata_from_dt(struct device *dev,
>>         if (!pdata->regulators)
>>                 return -ENOMEM;
>>
>> -       pdata->num_regulators = matched;
>> +       pdata->num_regulators = ARRAY_SIZE(act8865_matches);
>>         regulator = pdata->regulators;
>
> You can also include below change as well:
> diff --git a/drivers/regulator/act8865-regulator.c
> b/drivers/regulator/act8865-regulator.c
> index f07be36..9fcedc5 100644
> --- a/drivers/regulator/act8865-regulator.c
> +++ b/drivers/regulator/act8865-regulator.c
> @@ -226,7 +226,7 @@ static int act8865_pdata_from_dt(struct device *dev,
>
>   pdata->regulators = devm_kzalloc(dev,
>   sizeof(struct act8865_regulator_data) *
> - ARRAY_SIZE(act8865_matches), GFP_KERNEL);
> + matched, GFP_KERNEL);
>   if (!pdata->regulators)
>   return -ENOMEM;
Ah.. I misread the code, please forget above comment.
Reviewed-by: Axel Lin <axel.lin@ingics.com>

Axel
