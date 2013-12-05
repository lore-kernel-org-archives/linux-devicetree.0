From: delicious quinoa <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v8] gpio: add a driver for the Synopsys DesignWare APB
 GPIO block
Date: Thu, 5 Dec 2013 16:56:32 -0600
Message-ID: <CANk1AXS2twLVbPUUcLRXnzjJsGO0TPk9CM+8M5cf-tOOaUexnA@mail.gmail.com>
References: <1386088876-29205-1-git-send-email-delicious.quinoa@gmail.com>
	<1386088876-29205-2-git-send-email-delicious.quinoa@gmail.com>
	<20131205165439.GB5924@maple>
	<CANk1AXRJK+Zy2FYEn5jBevUr5Dr_tNeFf9=GbOnzxgiSOw7j8w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CANk1AXRJK+Zy2FYEn5jBevUr5Dr_tNeFf9=GbOnzxgiSOw7j8w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Cc: linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Alan Tull <atull-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, Yves Vandervennet <rocket.yvanderv-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 5, 2013 at 4:53 PM, delicious quinoa
<delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Thu, Dec 5, 2013 at 10:54 AM, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org> wrote:
>> Hi Alan,
>>
>> One minor comment below, otherwise looks great!
>>
>> Signed-off-by: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
>>
>> Thanks,
>>
>> Jamie
>>
>> On Tue, Dec 03, 2013 at 10:41:16AM -0600, Alan Tull wrote:
>>> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
>>> new file mode 100644
>>> index 0000000..e6dc61f
>>> --- /dev/null
>>> +++ b/drivers/gpio/gpio-dwapb.c
>> ...
>>> +static unsigned int dwapb_gpio_nr_ports(struct device_node *of_node)
>>> +{
>>> +     unsigned int nr_ports = 0;
>>> +     struct device_node *np;
>>> +
>>> +     for_each_child_of_node(of_node, np)
>>> +             ++nr_ports;
>>> +
>>> +     return nr_ports;
>>> +}
>>
>> I notice that we now have of_get_child_count() which didn't exist when I
>> first wrote the driver, we could use that now.
>
> Thanks Jamie.
>
> I'll include that in v8.  I'll post that within a few days.
>
> Alan

er, I mean v9.

Alan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
