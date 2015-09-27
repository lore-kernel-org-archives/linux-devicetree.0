From: Chanwoo Choi <cwchoi00@gmail.com>
Subject: Re: [PATCH 4/6] extcon: arizona: Add device binding for second jack
 detect pin on GPIO5
Date: Sun, 27 Sep 2015 13:50:57 +0900
Message-ID: <CAGTfZH13KbQqjSLaussyqYBTHWAdcGpyq4099TF=zf76xXpSEg@mail.gmail.com>
References: <1442397404-7579-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
	<1442397404-7579-5-git-send-email-ckeepax@opensource.wolfsonmicro.com>
	<56049B42.7030509@samsung.com>
	<20150925091042.GD5432@ck-lbox>
Reply-To: cw00.choi@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150925091042.GD5432@ck-lbox>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "myungjoo.ham@samsung.com" <myungjoo.ham@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 25, 2015 at 6:10 PM, Charles Keepax
<ckeepax@opensource.wolfsonmicro.com> wrote:
> On Fri, Sep 25, 2015 at 09:54:26AM +0900, Chanwoo Choi wrote:
>> Hi Charles,
>>
>> I have one comment.
>> I think current extcon-arizona.c has the many platform data
>> so, extcon-arizona.c use the too much if statement to support each feature
>> for different wolfsonmicro codec. I think it cause the complicated code.
>>
>> For example,
>> You may use 'struct of_device_id' as following. You used already this method
>> on drivers/mfd/arizona-core.c. If you separate the function of each wmXXXX arizona,
>> it makes improved readability for extcon-arizona.c and some user will use extcon-arizora
>> more easily.
>>
>> struct arizona_extcon_data {
>>       void (*init)(...);
>>       void (*irq_handler)(...);
>>       ...
>> };
>>
>> struct arizona_extcon_data wm8994_data {
>>       .init = wm8994_extcon_init,
>>       .irq_handler = wm8994_extcon_irq_handler;
>>       ...
>> };
>>
>> static const struct of_device_id arizona_extcon_dt_match[] = {
>>       {
>>               .compatible = "wm8994-arizona-extcon",
>>               .data = (void *)wm8994_data;
>>       }, {
>>               .compatible = "wmXXXX-arizona-extcon",
>>               .data = (void *)wmXXXX_data;
>>       },
>> };
>>
>> I expect that you will revise the arizona-extcon.c driver on next time.
>
> I will have an investigation to see what ideas I can come up with
> here and send through some patches.
>
> But I am slightly worried you think the gains will be better than
> they actually will be. Most of the platform data is just that
> platform data, and needs to be configured based on the system not
> based on the CODEC.

I agree. As you mentioned, platform data will be configured based on the system.
But, I mean that there are many platform datas for extcon-arizona in
"struct arizona_pdata" (in include/linux/mfd/arizona/pdata.h).

There are four sound code using the extcon-arizona driver as
following: I check the following list
in drivers/mfd/arizona-core.c.
- wm5102
- wm5110
- wm8997
- wm8998

If upper four sound codec include the same headset detection IP
(extcon-arizona.c)
without any difference about detection IP in sound codec, you don't
need to revise
the extcon-arizona.c driver.

But, If some field of  "struct arizona_pdata" (in
include/linux/mfd/arizona/pdata.h)
are used for only specific sound codec (wmXXX series), I think we need
to revise it.

I'm positive about your patches of extcon-arizona. Just I think that
you can make it
more easier and improved readability.

Thanks,
Chanwoo Choi
