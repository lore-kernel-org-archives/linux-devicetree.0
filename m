From: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/9] mailbox: arm_mhu: add driver for ARM MHU controller
Date: Tue, 25 Nov 2014 22:21:01 +0530
Message-ID: <CAJe_ZhciCP2VbmRtrq9d14WhfLhnC-xaitCCiW_6Yf1S-0sdUg@mail.gmail.com>
References: <1416486442-25200-1-git-send-email-Vincent.Yang@tw.fujitsu.com>
	<1416486872-25301-1-git-send-email-Vincent.Yang@tw.fujitsu.com>
	<54749429.9080505@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54749429.9080505-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: Vincent Yang <vincent.yang.fujitsu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vincent Yang <Vincent.Yang-l16TxrwUIHTQFUHtdCDX3A@public.gmane.org>, Tetsuya Nuriya <nuriya.tetsuya-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 25 November 2014 at 20:07, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
>
>
> On 20/11/14 12:34, Vincent Yang wrote:
>>
>> Add driver for the ARM Message-Handling-Unit (MHU).
>>
>> Signed-off-by: Andy Green <andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Signed-off-by: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Signed-off-by: Vincent Yang <Vincent.Yang-l16TxrwUIHTQFUHtdCDX3A@public.gmane.org>
>> Signed-off-by: Tetsuya Nuriya <nuriya.tetsuya-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
>> ---
>>   .../devicetree/bindings/mailbox/arm-mhu.txt        |  33 ++++
>>   drivers/mailbox/Kconfig                            |   7 +
>>   drivers/mailbox/Makefile                           |   2 +
>>   drivers/mailbox/arm_mhu.c                          | 196
>> +++++++++++++++++++++
>>   4 files changed, 238 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mailbox/arm-mhu.txt
>>   create mode 100644 drivers/mailbox/arm_mhu.c
>>
>> diff --git a/Documentation/devicetree/bindings/mailbox/arm-mhu.txt
>> b/Documentation/devicetree/bindings/mailbox/arm-mhu.txt
>> new file mode 100644
>> index 0000000..b1b9888
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mailbox/arm-mhu.txt
>> @@ -0,0 +1,33 @@
>> +ARM MHU Mailbox Driver
>> +======================
>> +
>> +The ARM's Message-Handling-Unit (MHU) is a mailbox controller that has
>> +3 independent channels/links to communicate with remote processor(s).
>
>
> I had reviewed this before and I see not all the comments are addressed.
> I had mentioned that you can't add support to _SECURE_ channel in Linux
> as you need to assume Linux runs in non-secure privilege(and I gather
> that's the case even on this platform from other email in the thread)
>
Please revisit the old thread. After some discussion you had
graciously allowed me to keep the secure channel ;)
[
... Even though I don't like you have secure channel access in Linux, you
have valid reasons. In case you decide to support it ....
]
 It seems you still don't get my point that the driver should manage
all channels - S & NS. If Linux is running in NS mode on a platform,
the DT will specify only some NS channel to be used. The controller
driver shouldn't be crippled just because you think Linux will never
be run in Secure mode.

Though I did forget to add .remove() function in case the driver is
used as a module. Will add that.

>> + MHU links are hardwired on a platform. A link raises interrupt for any
>> +received data. However, there is no specified way of knowing if the sent
>> +data has been read by the remote. This driver assumes the sender polls
>> +STAT register and the remote clears it after having read the data.
>
>
> That could be design, interrupt support could be present on some
> systems. The bindings should be flexible to add that support in future
> if needed along with necessary code.
>
We are the only 2 users of MHU atm and neither have that feature. I
even doubt if that is a configurable option. I stand corrected if you
share some spec telling otherwise because all I have is a few
snapshot'ed pages of MHU spec in a Japanese manual.  So please lets
keep things simple until we see real need for it.

Thanks
Jassi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
