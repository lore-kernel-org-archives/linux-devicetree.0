From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: Re: [PATCH 4/8] gpio-mm-lantiq: Use of_propery_read_u16
Date: Mon, 19 Jan 2015 12:28:04 +0100
Message-ID: <CAPybu_12eBQCA_gtTPi9o+taSS6nnTRkLS6qGG5APDS9S7JOvA@mail.gmail.com>
References: <1421581173-28416-1-git-send-email-ricardo.ribalda@gmail.com>
 <1421581173-28416-5-git-send-email-ricardo.ribalda@gmail.com> <20150119105753.GC21553@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150119105753.GC21553@leverpostej>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, John Crispin <blogic@openwrt.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hello Mark

Thanks for noticing. I have just sent the v2 of the patch.

Regards!

On Mon, Jan 19, 2015 at 11:57 AM, Mark Rutland <mark.rutland@arm.com> wrote:
> On Sun, Jan 18, 2015 at 11:39:29AM +0000, Ricardo Ribalda Delgado wrote:
>> Instead of parsing manually the shadow content, use the much simpler
>> helper of_property_read_u16.
>>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: Alexandre Courbot <gnurou@gmail.com>
>> Cc: Grant Likely <grant.likely@linaro.org>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: John Crispin <blogic@openwrt.org>
>> Cc: devicetree@vger.kernel.org
>> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
>> ---
>>  drivers/gpio/gpio-mm-lantiq.c | 6 ++----
>>  1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpio/gpio-mm-lantiq.c b/drivers/gpio/gpio-mm-lantiq.c
>> index 7d55161..b511a6b 100644
>> --- a/drivers/gpio/gpio-mm-lantiq.c
>> +++ b/drivers/gpio/gpio-mm-lantiq.c
>> @@ -105,7 +105,6 @@ static void ltq_mm_save_regs(struct of_mm_gpio_chip *mm_gc)
>>  static int ltq_mm_probe(struct platform_device *pdev)
>>  {
>>       struct ltq_mm *chip;
>> -     const __be32 *shadow;
>>
>>       chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
>>       if (!chip)
>> @@ -117,9 +116,8 @@ static int ltq_mm_probe(struct platform_device *pdev)
>>       chip->mmchip.save_regs = ltq_mm_save_regs;
>>
>>       /* store the shadow value if one was passed by the devicetree */
>> -     shadow = of_get_property(pdev->dev.of_node, "lantiq,shadow", NULL);
>> -     if (shadow)
>> -             chip->shadow = be32_to_cpu(*shadow);
>> +     of_property_read_u16(pdev->dev.of_node, "lantiq,shadow",
>> +                          &chip->shadow);
>
> The old code and new code aren't equivalent:
>
> The binding doesn't specify the use of /bits/ 16 <...>, nor does the
> only in-tree dts use it:
>
> arch/mips/boot/dts/easy50712.dts:               lantiq,shadow = <0xfff>;
>
> So in the DTB, lantiq-shadow will be stored as a be32 value. The byte
> stream will look like: [00 00 0f ff].
>
> The existing code reads all 4 bytes, and converts them as required,
> reading the expected value of 0xfff. If you use of_property_read_u16,
> this will only take the first 2 bytes, and will incorrectly read 0.
>
> You can instead use of_property_read_u32, which will function
> equivalently to the existing code.
>
> Thanks,
> Mark.



-- 
Ricardo Ribalda
