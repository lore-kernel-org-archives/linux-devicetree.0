From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 2/9] mailbox: arm_mhu: add driver for ARM MHU controller
Date: Wed, 26 Nov 2014 16:38:07 +0000
Message-ID: <547601EF.7070307@arm.com>
References: <1416486442-25200-1-git-send-email-Vincent.Yang@tw.fujitsu.com>	<1416486872-25301-1-git-send-email-Vincent.Yang@tw.fujitsu.com>	<54749429.9080505@arm.com>	<CAJe_ZhciCP2VbmRtrq9d14WhfLhnC-xaitCCiW_6Yf1S-0sdUg@mail.gmail.com>	<5474C3DD.5060706@arm.com>	<CAJe_ZhfkcSv7oBfXdiW5=F0bZvv+9z3m90cXdy=O66VwZWCQnw@mail.gmail.com>	<5475DD19.9000107@arm.com> <CAJe_ZheKfEkdzcNE_5cpDg4qbYNLEJ=kKi+ScRf2=a8irAfnDg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJe_ZheKfEkdzcNE_5cpDg4qbYNLEJ=kKi+ScRf2=a8irAfnDg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Vincent Yang <vincent.yang.fujitsu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vincent Yang <Vincent.Yang-l16TxrwUIHTQFUHtdCDX3A@public.gmane.org>, Tetsuya Nuriya <nuriya.tetsuya-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 26/11/14 16:20, Jassi Brar wrote:
> On 26 November 2014 at 19:30, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
>> On 26/11/14 05:37, Jassi Brar wrote:
>>>
>
>>>>>     It seems you still don't get my point that the driver should manage
>>>>> all channels - S & NS. If Linux is running in NS mode on a platform,
>>>>> the DT will specify only some NS channel to be used. The controller
>>>>> driver shouldn't be crippled just because you think Linux will never
>>>>> be run in Secure mode.
>>>>>
>>>>
>>>> Ok how do you handle that, I don't see that in the DT binding. As it
>>>> stands, you can unconditionally try to access the secure channel and
>>>> cause aborts if the platform is running in non-secure mode.
>>>>
>>> No. Please look at the dtsi again ....
>>>
>>>           mhu: mailbox@2b1f0000 {
>>>                   #mbox-cells = <1>;
>>>                   compatible = "arm,mbox-mhu";
>>>                   reg = <0 0x2b1f0000 0x1000>;
>>>                   interrupts = <0 36 4>, /* LP Non-Sec */
>>>                                <0 35 4>, /* HP Non-Sec */
>>>                                <0 37 4>; /* Secure */
>>
>>
>> One possible issue I can think of(though current driver design requests
>> irq only on channel startup, it could be moved to probe for optimization
>> in which case you need a way to make sure secure channel or irq is not
>> accessed)
>>
> As you see it is fine as such.

Agreed, but assuming some driver logic. I would like to see some way of
identifying that from DT if we adding the support for secure channel in
the driver else I prefer not to add it unless there is a real user of
it(which is not the case with your current patch set). That will be
handy if there's any issue in future due to some firmware that can't be
changed or upgraded.

Regards,
Sudeep

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
