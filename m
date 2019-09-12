From: "Shenhar, Talel" <talel@amazon.com>
Subject: Re: [UNVERIFIED SENDER] Re: [PATCH v2 3/3] soc: amazon: al-pos: cast
 to u64 before left shifting
Date: Thu, 12 Sep 2019 09:51:09 +0300
Message-ID: <57d36339-d1e6-ac60-1ec2-4fb6bebf6d2f@amazon.com>
References: <1568142310-17622-1-git-send-email-talel@amazon.com>
 <1568142310-17622-4-git-send-email-talel@amazon.com>
 <86blvqsyq0.wl-maz@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <86blvqsyq0.wl-maz@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <maz@kernel.org>
Cc: robh+dt@kernel.org, tglx@linutronix.de, jason@lakedaemon.net, mark.rutland@arm.com, nicolas.ferre@microchip.com, mchehab+samsung@kernel.org, shawn.lin@rock-chips.com, gregkh@linuxfoundation.org, dwmw@amazon.co.uk, benh@kernel.crashing.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On 9/11/2019 5:18 PM, Marc Zyngier wrote:
> On Tue, 10 Sep 2019 20:05:10 +0100,
> Talel Shenhar <talel@amazon.com> wrote:
>> Fix wrap around for pos errors on addresses above 32 bit.
>>
>> Reported-by: kbuild test robot <lkp@intel.com>
>> Signed-off-by: Talel Shenhar <talel@amazon.com>
>> ---
>>   drivers/soc/amazon/al_pos.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/soc/amazon/al_pos.c b/drivers/soc/amazon/al_pos.c
>> index a865111..e95e1fc 100644
>> --- a/drivers/soc/amazon/al_pos.c
>> +++ b/drivers/soc/amazon/al_pos.c
>> @@ -49,7 +49,7 @@ static irqreturn_t al_pos_irq_handler(int irq, void *info)
>>   	writel(0, pos->mmio_base + AL_POS_ERROR_LOG_1);
>>   
>>   	addr = FIELD_GET(AL_POS_ERROR_LOG_0_ADDR_LOW, log0);
>> -	addr |= (FIELD_GET(AL_POS_ERROR_LOG_1_ADDR_HIGH, log1) << 32);
>> +	addr |= (((u64)FIELD_GET(AL_POS_ERROR_LOG_1_ADDR_HIGH, log1)) << 32);
>>   	request_id = FIELD_GET(AL_POS_ERROR_LOG_1_REQUEST_ID, log1);
>>   	bresp = FIELD_GET(AL_POS_ERROR_LOG_1_BRESP, log1);
>>   
>> -- 
>> 2.7.4
>>
> This fix should be squashed into the previous patch.
Sure, Shall be part of v3.
>
> Thanks,
>
> 	M.
>
