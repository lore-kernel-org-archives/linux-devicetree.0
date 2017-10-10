From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: linux-next: Tree for Oct 9th (of: unittest: testcases)
Date: Tue, 10 Oct 2017 13:26:54 -0500
Message-ID: <CAL_JsqJgf+HOp-7DNzpExOE2UnXbraL3uaL0a01K4t8Z6fkoSA@mail.gmail.com>
References: <20171009212122.wx4lgnecmqyzuywq@sirena.co.uk> <7524d1e5-137c-cb78-c24f-6a9701e46701@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7524d1e5-137c-cb78-c24f-6a9701e46701-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux-Next Mailing List <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

+Frank

On Tue, Oct 10, 2017 at 12:33 PM, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org> wrote:
> On 10/09/17 14:21, Mark Brown wrote:
>> For my birthday I've gone and got myself a linux-next tree:
>>
>> Changes since 20170929:
>>
>> The net-next and drm trees lost their build failures but the rcu tree
>> gained one.
>
>
> I don't know what this is but it's new AFAIK.
> (seen on i386 and x86_64)

Yes, new dtc version with new warnings.

>   DTC     drivers/of/unittest-data/testcases.dtb
> drivers/of/unittest-data/testcases.dtb: Warning (interrupts_extended_property): Could not get phandle node for /__local_fixups__/testcase-data/interrupts/interrupts-extended0:interrupts-extended(cell 3)

Frank, this is in __local_fixups__, we should be able to remove that
now as the necessary dtc changes are in place, right?

> drivers/of/unittest-data/testcases.dtb: Warning (interrupts_property): interrupts size is (4), expected multiple of 8 in /testcase-data/testcase-device2

This one is purposely bad data to feed the unit test. If I suppress
it, then it is suppressed everywhere in the unit test data.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
