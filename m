From: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/9] mailbox: arm_mhu: add driver for ARM MHU controller
Date: Wed, 26 Nov 2014 21:50:49 +0530
Message-ID: <CAJe_ZheKfEkdzcNE_5cpDg4qbYNLEJ=kKi+ScRf2=a8irAfnDg@mail.gmail.com>
References: <1416486442-25200-1-git-send-email-Vincent.Yang@tw.fujitsu.com>
	<1416486872-25301-1-git-send-email-Vincent.Yang@tw.fujitsu.com>
	<54749429.9080505@arm.com>
	<CAJe_ZhciCP2VbmRtrq9d14WhfLhnC-xaitCCiW_6Yf1S-0sdUg@mail.gmail.com>
	<5474C3DD.5060706@arm.com>
	<CAJe_ZhfkcSv7oBfXdiW5=F0bZvv+9z3m90cXdy=O66VwZWCQnw@mail.gmail.com>
	<5475DD19.9000107@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5475DD19.9000107-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: Vincent Yang <vincent.yang.fujitsu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vincent Yang <Vincent.Yang-l16TxrwUIHTQFUHtdCDX3A@public.gmane.org>, Tetsuya Nuriya <nuriya.tetsuya-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 26 November 2014 at 19:30, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
> On 26/11/14 05:37, Jassi Brar wrote:
>>

>>>>    It seems you still don't get my point that the driver should manage
>>>> all channels - S & NS. If Linux is running in NS mode on a platform,
>>>> the DT will specify only some NS channel to be used. The controller
>>>> driver shouldn't be crippled just because you think Linux will never
>>>> be run in Secure mode.
>>>>
>>>
>>> Ok how do you handle that, I don't see that in the DT binding. As it
>>> stands, you can unconditionally try to access the secure channel and
>>> cause aborts if the platform is running in non-secure mode.
>>>
>> No. Please look at the dtsi again ....
>>
>>          mhu: mailbox@2b1f0000 {
>>                  #mbox-cells = <1>;
>>                  compatible = "arm,mbox-mhu";
>>                  reg = <0 0x2b1f0000 0x1000>;
>>                  interrupts = <0 36 4>, /* LP Non-Sec */
>>                               <0 35 4>, /* HP Non-Sec */
>>                               <0 37 4>; /* Secure */
>
>
> One possible issue I can think of(though current driver design requests
> irq only on channel startup, it could be moved to probe for optimization
> in which case you need a way to make sure secure channel or irq is not
> accessed)
>
As you see it is fine as such.
I don't think acquiring all irqs during probe is a good idea.
mbox_request_channel() is when we should actually be reserving
resources.

>>          };
>>
>>          mhu_client: scb@2e000000 {
>>                  compatible = "fujitsu,mb86s70-scb-1.0";
>>                  reg = <0 0x2e000000 0x4000>; /* SHM for IPC */
>>                  mboxes = <&mhu 1>;
>>          };
>>
>> See the DT for mbox client specifies that it uses channel-1 which is
>> High-Priority_Non-Secure channel.
>>
>
> Yes I noticed that, but still a wrong entry of another mhu_client with
> secure channel might end up crashing MHU driver or even whole system.
> Not sure but still probably one could try to play around with DT
> overlays in future, just a thought. So you need to ensure that's handled
> properly in the MHU driver.
>
You worry too much ;)  what if some 'wrong entry' in DT specifies
memory where there is none or some voltage that could toast the board?

-Jassi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
