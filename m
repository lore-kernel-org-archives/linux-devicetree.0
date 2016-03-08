From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 2/5] gpio: gpiolib: Print error number if gpio hog failed
Date: Tue, 8 Mar 2016 21:02:59 +0530
Message-ID: <56DEF0AB.7090807@nvidia.com>
References: <1457438528-29054-1-git-send-email-ldewangan@nvidia.com> <1457438528-29054-3-git-send-email-ldewangan@nvidia.com> <20160308142217.GB9864@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20160308142217.GB9864@ulmo.nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Thierry Reding <treding@nvidia.com>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, swarren@wwwdotorg.org
List-Id: devicetree@vger.kernel.org


On Tuesday 08 March 2016 07:52 PM, Thierry Reding wrote:
> On Tue, Mar 08, 2016 at 05:32:05PM +0530, Laxman Dewangan wrote:
>
>> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
>> ---
>>   drivers/gpio/gpiolib.c | 9 +++++----
>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
>> index bc788b9..7575ebb 100644
>> --- a/drivers/gpio/gpiolib.c
>> +++ b/drivers/gpio/gpiolib.c
>> @@ -2621,15 +2621,16 @@ int gpiod_hog(struct gpio_desc *desc, const char *name,
>>   
>>   	local_desc = gpiochip_request_own_desc(chip, hwnum, name);
>>   	if (IS_ERR(local_desc)) {
>> -		pr_err("requesting hog GPIO %s (chip %s, offset %d) failed\n",
>> -		       name, chip->label, hwnum);
>> +		status = PTR_ERR(local_desc);
>> +		pr_err("requesting hog GPIO %s, chip %s, offset %d failed %d\n",
>> +		       name, chip->label, hwnum, status);
> I find this type of format hard to read. I prefer a semi-colon to
> separate the message from the failure reason (i.e. error code).
>
> Besides that I don't understand why you're dropping the parentheses
> around the "chip %s, offset %d", I found that easier on the eye.
>
>


I did to accommodate the  3 extra character ( %d) for string format on 
that line as it was already near to 80 column.
Just did not want to split in multiple lines.

