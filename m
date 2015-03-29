From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 0/5] Update the OF unittest and some small fix
Date: Sun, 29 Mar 2015 18:24:35 +0100
Message-ID: <CACxGe6uZAXmoztE5u2W8iqEoS2YBrdZNNjgRMsijx80xLiggvw@mail.gmail.com>
References: <1426063014-211712-1-git-send-email-long.wanglong@huawei.com>
 <CAL_JsqJXK31amM8xJ81wZ7O0xv_A7YOHP3GPxsyAnTNU7i1jFA@mail.gmail.com> <20150328132347.84128C4093E@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150328132347.84128C4093E-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wang Long <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, peifeiyue-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Mar 28, 2015 at 1:23 PM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Tue, 24 Mar 2015 23:43:43 -0500
> , Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  wrote:
>> On Wed, Mar 11, 2015 at 3:36 AM, Wang Long <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org> wrote:
>> > This series patches do some small fixes in drivers/of/unittest.c,
>> > and update the Documenttion.
>> >
>> > At last, replace selftest with unittest in the c, dtsi
>> > and binding files.
>> >
>> > * v2 <- v1:
>> >         - According to Gaurav's advice. make the rename
>> >         file patch correctly.
>> >
>> > Wang Long (5):
>> >   of/unittest: remove the duplicate of_changeset_init
>> >   of/unittest: Fix the wrong expected value in
>> >     of_selftest_property_string
>> >   Documentation: update the of_selftest.txt
>> >   Documentation: rename of_selftest.txt to of_unittest.txt
>> >   of/unittest: replace 'selftest' with 'unittest'
>>
>> I've applied the series. Thanks.
>
> Hmmm, I neglected to update my git tree before getting on an airplane
> and merging patches. I may have pushed out conflicts to my tree. If I've
> done so, then I'll fix it up this weekend.

I think I've got it sorted out now. I've dropped the duplicates from
my tree and merged rob's tree into mine. The merge conflicts weren't
as serious as I feared they world be. It's pushed out now.

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
