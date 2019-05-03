From: Ludovic BARRE <ludovic.barre@st.com>
Subject: Re: [PATCH V2 1/3] watchdog: stm32: update to
 devm_watchdog_register_device
Date: Fri, 3 May 2019 09:58:31 +0200
Message-ID: <f649441e-b3fe-134d-9dea-ac7140fb2d9d@st.com>
References: <1556806126-15890-1-git-send-email-ludovic.Barre@st.com>
 <1556806126-15890-2-git-send-email-ludovic.Barre@st.com>
 <20190502202122.GA27894@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190502202122.GA27894@roeck-us.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

hi Guenter

On 5/2/19 10:21 PM, Guenter Roeck wrote:
> On Thu, May 02, 2019 at 04:08:44PM +0200, Ludovic Barre wrote:
>> From: Ludovic Barre <ludovic.barre@st.com>
>>
>> This patch updates to devm_watchdog_register_device interface
>>
> Not that easy. See below.
> 
> A more complete solution is at
> https://patchwork.kernel.org/patch/10894355
> 
> I have a total of three patches for this driver pending for
> the next kernel release. Maybe it would make sense to (re-)
> start this series from there after the next commit window
> closes.
> 

I used the repository defined in MAINTAINERS file
git://www.linux-watchdog.org/linux-watchdog.git
but there is no next branch.

Today, I see your kernel.org repository
https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/

And I see your next branch, so I will use it.

Regards,
Ludo

> Guenter
> 
>> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
>> ---
>>   drivers/watchdog/stm32_iwdg.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
>> index e00e3b3..e191bd8 100644
>> --- a/drivers/watchdog/stm32_iwdg.c
>> +++ b/drivers/watchdog/stm32_iwdg.c
>> @@ -243,7 +243,7 @@ static int stm32_iwdg_probe(struct platform_device *pdev)
>>   		dev_warn(&pdev->dev,
>>   			 "unable to set timeout value, using default\n");
>>   
>> -	ret = watchdog_register_device(wdd);
>> +	ret = devm_watchdog_register_device(&pdev->dev, wdd);
>>   	if (ret) {
>>   		dev_err(&pdev->dev, "failed to register watchdog device\n");
>>   		goto err;
>> @@ -263,7 +263,6 @@ static int stm32_iwdg_remove(struct platform_device *pdev)
>>   {
>>   	struct stm32_iwdg *wdt = platform_get_drvdata(pdev);
>>   
>> -	watchdog_unregister_device(&wdt->wdd);
>>   	clk_disable_unprepare(wdt->clk_lsi);
>>   	clk_disable_unprepare(wdt->clk_pclk);
> 
> This disables the clock while the watchdog is still registered
> and running. That is not a good idea.
> 
>>   
>> -- 
>> 2.7.4
>>
