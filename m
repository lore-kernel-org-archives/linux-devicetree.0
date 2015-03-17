From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: kexec fails if OF_UNITTEST=y (was: Re: [PATCH v2] Removes
 OF_UNITTEST dependency on OF_DYNAMIC config symbol)
Date: Tue, 17 Mar 2015 07:52:44 +0100
Message-ID: <CAMuHMdU+DCVNyjd0s4TLz93=3AFGoq_QWvRbg3nCej7a3mX2BA@mail.gmail.com>
References: <CAMuHMdVb47ogpLe_4iSz-NAxdcASUZ2HzTpxh+ibjcdMtiO-tQ@mail.gmail.com>
	<CAL_Jsq+y98uP_vxKzsCVVj7hoMeGQkLB1o54iqst+dNXJkcFoA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+y98uP_vxKzsCVVj7hoMeGQkLB1o54iqst+dNXJkcFoA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Tue, Mar 17, 2015 at 1:25 AM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Mon, Mar 16, 2015 at 5:58 AM, Geert Uytterhoeven
> <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> wrote:
>> On Fri, Jan 23, 2015 at 2:03 PM, Geert Uytterhoeven
>> <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> wrote:
>>> On Sun, Jan 11, 2015 at 8:19 AM, Gaurav Minocha
>>> <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>> This patch intends to remove the unittests dependency on
>>>> the functions defined in dynamic.c. So, rather than calling
>>>> of_attach_node defined in dynamic.c, minimal functionality
>>>> required to attach a new node is re-defined in unittest.c.
>>>> Also, now after executing the tests the test data is not
>>>> removed from the device tree so there is no need to call
>>>> of_detach_node.
>>>
>>> Could there be unwanted side effects of not removing the test data?
>>
>> Unfortunately I found a regression introduced by commit 3ce04b4a9fdc30b6
>> ("Removes OF_UNITTEST dependency on OF_DYNAMIC config symbol").
>>
>> If the test data is still present, kexec (kexec-tools 2.0.7 released 24
>> November 2014, 1:2.0.7-5 in Debian) fails with:
>>
>> unrecoverable error: short read
>> from"/proc/device-tree//testcase-data/large-property-PAGE_SIZEx8"
>>
>> Granted, this is a bug in kexec-tools, but I'm reporting it anyway, as it is
>> a kernel regression with existing userspace.
>>
>> I believe this bug was fixed in kexec-tools by commit d1932cd592e2a6aa
>> ("kexec/fs2dt: Use slurp_file_len to avoid partial read of files"), but I
>> haven't tested the fix yet.
>
> Is OF_UNITTEST enabled by default in Debian or this is a custom
> kernel? Perhaps we should require a command line option to actually
> populate the test data and run the tests?

It's not that bad, this is a custom kernel. I just had it still
enabled by accident.

I guess making it modular is not that easy?

> We just need more tests to slow down the boot enough people will not
> enable them by default. ;)

Apart from slowing down the boot, most tests don't have side effects.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
