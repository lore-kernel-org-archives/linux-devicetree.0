From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] Removes OF_SELFTEST dependency on OF_DYNAMIC config symbol
Date: Sat, 27 Sep 2014 23:23:59 +0100
Message-ID: <CACxGe6t7Krmtm4enS=-7yjWiR6m81Rr1A7RNKnn70bVHoEe2Bw@mail.gmail.com>
References: <1410611708-9369-1-git-send-email-gaurav.minocha.os@gmail.com> <9D65D8A3-6404-451B-A3F4-E9ED94810B7B@antoniou-consulting.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9D65D8A3-6404-451B-A3F4-E9ED94810B7B-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Cc: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 15, 2014 at 10:34 AM, Pantelis Antoniou
<panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org> wrote:
> Hi Gaurav,
>
>
> On Sep 13, 2014, at 3:35 PM, Gaurav Minocha wrote:
>
>> This patch is used to remove the selftests dependency on
>> OF_DYNAMIC config flag. Now, it selectively builds only
>> the functions required by the selftests.
>>
>> Tested with and without OF_DYNAMIC enabled.
>>
>> Signed-off-by: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>
> [snip]
>
> I'm not happy with this patch.
>
> It duplicates core functionality already present in drivers/of/dynamic.c and those
> two implementations are for sure going to get out of sync.
>
> If you require the self-tests to work without OF_DYNAMIC you can do that by including the
> tests in your dts. If you want to insert them dynamically then use OF_DYNAMIC.

I asked Gaurav to make this work. The selftest code should always be
usable, without requiring the testcase data to be directly included
into the dtb. It is important to be able to still test the code paths
on any platform when OF_DYNAMIC is not selected.

This patch doesn't do it in a very nice way, agreed, but it is
important to get working.

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
