From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/4] DT platform device name collision fixes
Date: Wed, 07 May 2014 19:54:30 -0700
Message-ID: <536AF1E6.2010709@gmail.com>
References: <1399499298-8830-1-git-send-email-robherring2@gmail.com> <536AB91F.3010302@gmail.com>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <536AB91F.3010302-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>, Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Courtney Cavin <courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 5/7/2014 3:52 PM, Frank Rowand wrote:
> On 5/7/2014 2:48 PM, Rob Herring wrote:
>> From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>
>> This series fixes the device naming collisions that can occur with 
>> nultiple devices having the same name and non-translatable unit 
>> addresses. This issue was raised in this thread[1]. I intend to merge 
>> this regardless of whether or not some hierarchy in sysfs is created. 
>> That is really a separate issue independent of these fixes.
>>
>> I found and fix a couple of other issues in the process of testing the 
>> fix.
>>
>> Rob
>>
>> [1] https://lkml.org/lkml/2014/4/23/312
>>
>> Rob Herring (4):
>>   of/selftest: add testcase for nodes with same name and address
>>   of/platform: return error on of_platform_device_create_pdata failure
>>   of/platform: fix device naming for non-translatable addresses
>>   of: kill off of_can_translate_address
> 
> My opinion is that this approach is not a good approach to solving the
> problem.  It is papering over a symptom, instead of dealing with the
> root cause.
> 
> But despite my opinion, you can add to patches 2-4 (I did not test
> the self-test added in patch 1):
> 
>    Tested-by: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
> 
> The patches resolve the name conflict originally reported for the
> qcomm PMIC, tested on 3.15-rc1, with a bunch of out of tree
> patches.

And you can add to the 4 patches:

  Reviewed-by: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>

-Frank

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
