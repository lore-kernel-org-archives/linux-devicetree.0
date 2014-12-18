From: Ley Foon Tan <lftan-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH (resend)] mailbox: Add Altera mailbox driver
Date: Thu, 18 Dec 2014 10:08:21 +0800
Message-ID: <CAFiDJ59FCE1JRHaSRmE06_VWETyONj55dCbFWehV4LoCi4ZLJg@mail.gmail.com>
References: <1418378690-3466-1-git-send-email-lftan@altera.com>
	<548AFDE9.6000909@gmail.com>
	<548F4A99.7040409@ti.com>
	<CAFiDJ5-b9qsLKj8Qh2+yx8_Y1nv5CG1PHyn2Se0zzZLSHWTKNg@mail.gmail.com>
	<5491BA90.9040007@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5491BA90.9040007-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 18, 2014 at 1:17 AM, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>>> +MODULE_DEVICE_TABLE(of, altera_mbox_match);
>>>>> +
>>>>> +static struct platform_driver altera_mbox_driver = {
>>>>> +    .probe  = altera_mbox_probe,
>>>>> +    .remove = altera_mbox_remove,
>>>>> +    .driver = {
>>>>> +            .name   = DRIVER_NAME,
>>>>> +            .owner  = THIS_MODULE,
>>>>> +            .of_match_table = altera_mbox_match,
>>>
>>> of_match_ptr(altera_mbox_match).
>> Okay.
>
> This driver is DT-only, so of_match_ptr() is not needed.
>
Yes, this driver is DT-only. Okay, we don't need of_match_ptr.

Ley Foon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
