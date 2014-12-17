From: Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH (resend)] mailbox: Add Altera mailbox driver
Date: Wed, 17 Dec 2014 11:17:04 -0600
Message-ID: <5491BA90.9040007@gmail.com>
References: <1418378690-3466-1-git-send-email-lftan@altera.com>	<548AFDE9.6000909@gmail.com>	<548F4A99.7040409@ti.com> <CAFiDJ5-b9qsLKj8Qh2+yx8_Y1nv5CG1PHyn2Se0zzZLSHWTKNg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFiDJ5-b9qsLKj8Qh2+yx8_Y1nv5CG1PHyn2Se0zzZLSHWTKNg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ley Foon Tan <lftan-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
Cc: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 12/16/14, 12:33 AM, Ley Foon Tan wrote:
> On Tue, Dec 16, 2014 at 4:54 AM, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org> wrote:
>> Hi Ley Foon,
>>
>> On 12/12/2014 08:38 AM, Dinh Nguyen wrote:
>>>
>>>
>>> On 12/12/14, 4:04 AM, Ley Foon Tan wrote:
>>>> The Altera mailbox allows for interprocessor communication. It supports
>>>> only one channel and work as either sender or receiver.
>>
>> I have a few more comments in addition to those that Dinh provided.
>>
>>>>
>>>> Signed-off-by: Ley Foon Tan <lftan-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
>>>> ---
>>>>  .../devicetree/bindings/mailbox/altera-mailbox.txt |  49 +++
>>>>  drivers/mailbox/Kconfig                            |   6 +
>>>>  drivers/mailbox/Makefile                           |   2 +
>>>>  drivers/mailbox/mailbox-altera.c                   | 404 +++++++++++++++++++++
>>>>  4 files changed, 461 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/mailbox/altera-mailbox.txt
>>>>  create mode 100644 drivers/mailbox/mailbox-altera.c
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/mailbox/altera-mailbox.txt b/Documentation/devicetree/bindings/mailbox/altera-mailbox.txt
>>>> new file mode 100644
>>>> index 0000000..c261979
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/mailbox/altera-mailbox.txt
>>>> @@ -0,0 +1,49 @@
>>>> +Altera Mailbox Driver
>>>> +=====================
>>>> +
>>>> +Required properties:
>>>> +- compatible :      "altr,mailbox-1.0".
>>

<snip>

>>>> +static const struct of_device_id altera_mbox_match[] = {
>>>> +    { .compatible = "altr,mailbox-1.0" },
>>>> +    { /* Sentinel */ }
>>>> +};
>>>> +
>>>> +MODULE_DEVICE_TABLE(of, altera_mbox_match);
>>>> +
>>>> +static struct platform_driver altera_mbox_driver = {
>>>> +    .probe  = altera_mbox_probe,
>>>> +    .remove = altera_mbox_remove,
>>>> +    .driver = {
>>>> +            .name   = DRIVER_NAME,
>>>> +            .owner  = THIS_MODULE,
>>>> +            .of_match_table = altera_mbox_match,
>>
>> of_match_ptr(altera_mbox_match).
> Okay.

This driver is DT-only, so of_match_ptr() is not needed.

Dinh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
