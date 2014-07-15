From: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/8] ARM: Add platform support for Fujitsu MB86S7X SoCs
Date: Tue, 15 Jul 2014 23:33:49 +0530
Message-ID: <CAJe_ZheGrGZMVXZN2SMtBtq4+fX7KsiMSEfAM0mVcb6f80Kckg@mail.gmail.com>
References: <1405232911-4569-1-git-send-email-mollie.wu@linaro.org>
	<CAL_JsqKvwxjEDZPVwL646PhPKr7oemBzxr6cZ+X=uJQ2u_XZ8g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKvwxjEDZPVwL646PhPKr7oemBzxr6cZ+X=uJQ2u_XZ8g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mollie Wu <mollie.wu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Andy Green <andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Linaro Patches <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tetsuya Takinishi <t.takinishi-+CUm20s59erQFUHtdCDX3A@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 15 July 2014 20:41, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

...

>> +               interrupts = <0 36 4>, /* LP Non-Sec */
>> +                            <0 35 4>, /* HP Non-Sec */
>> +                            <0 37 4>; /* Secure */
>> +       };
>> +
>> +       mhu_client: scb@0 {
>> +               compatible = "fujitsu,scb";
>> +               mbox = <&mhu 1>;
>
> Is the mailbox binding finalized?
>
I have sent a patchset for common mailbox and its bindings. You are on
CC list. Arnd seems OK with it.

....

Will address rest all of your comments.

>
> That's all I've got time and energy for reviewing for now.
>
Thanks a lot!
-Jassi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
