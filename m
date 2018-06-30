Return-Path: <SRS0=Ekl+=JQ=zonque.org=daniel@kernel.org>
Subject: Re: [PATCH 7/7] mmc: pxamci: let mmc core handle regulators
References: <20180629144738.446-1-daniel@zonque.org>
 <20180629144738.446-8-daniel@zonque.org> <87d0w8i9dp.fsf@belgarion.home>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <732fb482-9d42-b2ef-a1f7-658f01e3a2ab@zonque.org>
Date: Sat, 30 Jun 2018 20:08:18 +0200
MIME-Version: 1.0
In-Reply-To: <87d0w8i9dp.fsf@belgarion.home>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: ulf.hansson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Saturday, June 30, 2018 05:25 PM, Robert Jarzmik wrote:
> Daniel Mack <daniel@zonque.org> writes:
> 
>> Strip some code by letting the mmc core handle the regulators. The old
>> .gpio_power pdata handling is kept around for now.
>>
>> This also set the voltage on the regulator and handles -EPROBE_DEFER
>> correctly.
>>
>> Signed-off-by: Daniel Mack <daniel@zonque.org>
> I'll take it as it was tested, right ?

Yes, with a non-removable SDIO device.

Thanks for your reviews and Acked-bys!


Daniel
