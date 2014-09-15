From: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] Removes OF_SELFTEST dependency on OF_DYNAMIC config symbol
Date: Mon, 15 Sep 2014 12:16:39 -0700
Message-ID: <CA+rpMb+35yUPy+yzbxH_22E+G67+kVYhorGu5aNnDOyBBy_1eg@mail.gmail.com>
References: <1410611708-9369-1-git-send-email-gaurav.minocha.os@gmail.com>
	<9D65D8A3-6404-451B-A3F4-E9ED94810B7B@antoniou-consulting.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9D65D8A3-6404-451B-A3F4-E9ED94810B7B-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 15, 2014 at 2:34 AM, Pantelis Antoniou
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

I understand your point, but I did this after discussing with Grant.

>
> If you require the self-tests to work without OF_DYNAMIC you can do that by including the
> tests in your dts. If you want to insert them dynamically then use OF_DYNAMIC.

So, according to above, selftest should not attach test data
dynamically if the OF_DYNAMIC
symbol is disabled. Correct me if wrong.

I will discuss and update the patch as appropriate. Thanks!

>
> Regards
>
> -- Pantelis
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
