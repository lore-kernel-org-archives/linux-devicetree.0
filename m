From: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 03/13] RTC: ds1307: Add DS1341 specific
 power-saving options
Date: Sun, 19 Jun 2016 11:12:55 -0700
Message-ID: <CAHQ1cqFfFpLmMMr9itinha9rotG7Btr9UmWbO2_0VWxX_HeG1g@mail.gmail.com>
References: <1465970379-14703-1-git-send-email-andrew.smirnov@gmail.com>
 <1465970379-14703-4-git-send-email-andrew.smirnov@gmail.com> <20160619142934.GA8522@rob-hp-laptop>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <rtc-linux+bncBDKOBWPM5ABRBKGBTO5QKGQEUWXTPTA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20160619142934.GA8522@rob-hp-laptop>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Jun 19, 2016 at 7:29 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Tue, Jun 14, 2016 at 10:59:29PM -0700, Andrey Smirnov wrote:
>> Add DS1341 specific power-saving options that allow to disable certain
>> functional aspects of the chip in order to minimize its power
>> consumption.
>
> This description doesn't match that you are adding a new binding. It is
> preferred that bindings are a separate patch.

OK, will split this patch into two in v2.

>
>>
>> Signed-off-by: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  .../devicetree/bindings/rtc/dallas,ds1341.txt      | 23 ++++++++++++++++++
>>  drivers/rtc/rtc-ds1307.c                           | 28 ++++++++++++++++++++++
>>  2 files changed, 51 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/rtc/dallas,ds1341.txt
>>
>> diff --git a/Documentation/devicetree/bindings/rtc/dallas,ds1341.txt b/Documentation/devicetree/bindings/rtc/dallas,ds1341.txt
>> new file mode 100644
>> index 0000000..b8be7a4
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/rtc/dallas,ds1341.txt
>> @@ -0,0 +1,23 @@
>> +* Dallas DS1341              I2C Serial Real-Time Clock
>> +
>> +Required properties:
>> +
>> +- compatible: Should contain "dallas,ds1341".
>> +
>> +- reg: I2C address for chip
>> +
>> +Optional properties:
>> +
>> +- disable-oscillator-stop-flag : Configure chip to disable oscillator
>> +  fault detection circuitry
>> +
>> +- enable-glitch-filter : Configure chip to enable crystal oscillator
>> +  output glitch filtering
>
> What determines setting these properties or not?

Setting those properties allows drastically reduce RTC's power
consumption at the expense of reliability and quality of service. In
my use case, DS1341 is powered by a supercap and enabling those two
setting allows to increase holdup from less than a day do 2+ weeks.

>
> They should have vendor prefix and be explicit that they are boolean.

I was trying to be consistent with ds1339 and ds1390 bindings which do
not have vendor prefixes. Will fix in v2.

Thank you,
Andrey Smirnov

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
