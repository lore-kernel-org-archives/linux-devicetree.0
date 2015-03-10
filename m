From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] Documentation: update the of_selftest.txt
Date: Tue, 10 Mar 2015 09:50:58 -0500
Message-ID: <CAL_JsqJiWhXQqGCik9tDqyaXEqU8+gEdw=FBVL_Fddbk_SjfwQ@mail.gmail.com>
References: <1425868525-113952-1-git-send-email-long.wanglong@huawei.com> <CAL_JsqLgxCQW==4YQrX193g+x22d1iL2jBGY4CSMnq7cQcSgZQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLgxCQW==4YQrX193g+x22d1iL2jBGY4CSMnq7cQcSgZQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wang Long <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, peifeiyue-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 10, 2015 at 9:44 AM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Sun, Mar 8, 2015 at 9:35 PM, Wang Long <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org> wrote:
>> Since the directory "drivers/of/testcase-data" is renamed
>> to "drivers/of/unittest-data". so we should update the path
>> in the of_selftest.txt.

[...]

>> -Before executing OF selftest, it is required to attach the test data to
>> +Before executing OF unittest, it is required to attach the test data to
>>  machine's device tree (if present). So, when selftest_data_add() is called,
>
> This one too.

Or not. The functions are all still "selftest". Not sure why Grant
left all those...

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
