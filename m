From: Amelie DELAUNAY <amelie.delaunay@st.com>
Subject: Re: [PATCH v2 1/3] rtc: stm32: rework register management to prepare
 other version of RTC
Date: Thu, 17 May 2018 10:01:49 +0000
Message-ID: <d08bcefc-7698-a968-7a35-ed9ab62bd623@st.com>
References: <1525880770-22263-1-git-send-email-amelie.delaunay@st.com>
 <1525880770-22263-2-git-send-email-amelie.delaunay@st.com>
 <20180516202552.GA24496@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180516202552.GA24496@piout.net>
Content-Language: en-US
Content-ID: <0BC83BF313F6C64AA957102629CD0575@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre TORGUE <alexandre.torgue@st.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 05/16/2018 10:25 PM, Alexandre Belloni wrote:
> Hi,
> 
> On 09/05/2018 17:46:08+0200, Amelie Delaunay wrote:
>>   static void stm32_rtc_wpr_unlock(struct stm32_rtc *rtc)
>>   {
>> -	writel_relaxed(RTC_WPR_1ST_KEY, rtc->base + STM32_RTC_WPR);
>> -	writel_relaxed(RTC_WPR_2ND_KEY, rtc->base + STM32_RTC_WPR);
>> +	struct stm32_rtc_registers regs = rtc->data->regs;
> 
> regs should probably be a pointer to ensure that no copy is made. I've
> actually checked and it doesn't make a difference because gcc is smart
> enough to not make the copy.
> 

...

>>   static irqreturn_t stm32_rtc_alarm_irq(int irq, void *dev_id)
>>   {
>>   	struct stm32_rtc *rtc = (struct stm32_rtc *)dev_id;
>> -	unsigned int isr, cr;
>> +	struct stm32_rtc_registers regs = rtc->data->regs;
>> +	struct stm32_rtc_events evts = rtc->data->events;
> 
> Ditto for evts.
>

I prepare a v3 with const struct stm32_rtc_registers *regs and const 
struct stm32_rtc_events *evts.

>> +	unsigned int status, cr;
>>   
>>   	mutex_lock(&rtc->rtc_dev->ops_lock);
>>   
>> -	isr = readl_relaxed(rtc->base + STM32_RTC_ISR);
>> -	cr = readl_relaxed(rtc->base + STM32_RTC_CR);
>> +	status = readl_relaxed(rtc->base + regs.isr);
>> +	cr = readl_relaxed(rtc->base + regs.cr);
>>   
>> -	if ((isr & STM32_RTC_ISR_ALRAF) &&
>> +	if ((status & evts.alra) &&
>>   	    (cr & STM32_RTC_CR_ALRAIE)) {
>>   		/* Alarm A flag - Alarm interrupt */
>>   		dev_dbg(&rtc->rtc_dev->dev, "Alarm occurred\n");
> 
> ...
> 
>> @@ -641,7 +710,7 @@ static int stm32_rtc_probe(struct platform_device *pdev)
>>   
>>   	/*
>>   	 * After a system reset, RTC_ISR.INITS flag can be read to check if
>> -	 * the calendar has been initalized or not. INITS flag is reset by a
>> +	 * the calendar has been initialized or not. INITS flag is reset by a
>>   	 * power-on reset (no vbat, no power-supply). It is not reset if
>>   	 * rtc_ck parent clock has changed (so RTC prescalers need to be
>>   	 * changed). That's why we cannot rely on this flag to know if RTC
>> @@ -666,7 +735,7 @@ static int stm32_rtc_probe(struct platform_device *pdev)
>>   			 "alarm won't be able to wake up the system");
>>   
>>   	rtc->rtc_dev = devm_rtc_device_register(&pdev->dev, pdev->name,
>> -			&stm32_rtc_ops, THIS_MODULE);
>> +						&stm32_rtc_ops, THIS_MODULE);
>>   	if (IS_ERR(rtc->rtc_dev)) {
>>   		ret = PTR_ERR(rtc->rtc_dev);
>>   		dev_err(&pdev->dev, "rtc device registration failed, err=%d\n",
> 
> Those two changes should go into a separate cleanup patch.
> 

OK, new patch for these two changes in v3.

Thanks for reviewing,
Amelie
