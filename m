From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v1 1/1] of: unittest: unflatten device tree on UML when
 testing
Date: Thu, 14 Feb 2019 18:48:35 -0800
Message-ID: <bfa00740-9b67-58f9-6273-3de98de952f6@gmail.com>
References: <20190212185305.112847-1-brendanhiggins@google.com>
 <20190212185305.112847-2-brendanhiggins@google.com>
 <4cb7ca12-ce60-7516-b7eb-aef08f607acc@gmail.com>
 <CAFd5g441+6ATUKcNz7OstAB6Qd2BqeDh77SNnGUpZGBNvgysmg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFd5g441+6ATUKcNz7OstAB6Qd2BqeDh77SNnGUpZGBNvgysmg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Brendan Higgins <brendanhiggins@google.com>
Cc: Rob Herring <robh+dt@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 2/14/19 5:26 PM, Brendan Higgins wrote:
> On Thu, Feb 14, 2019 at 4:10 PM Frank Rowand <frowand.list@gmail.com> wrote:
>>
>> On 2/12/19 10:53 AM, Brendan Higgins wrote:
>>> UML supports enabling OF, and is useful for running the device tree
>>> tests, so add support for unflattening device tree blobs so we can
>>> actually use it.
>>>
>>> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
>>> ---
>>>  drivers/of/unittest.c | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
>>> index 84427384654d5..effa4e2b9d992 100644
>>> --- a/drivers/of/unittest.c
>>> +++ b/drivers/of/unittest.c
>>> @@ -2527,6 +2527,9 @@ static int __init of_unittest(void)
>>>       }
>>>       of_node_put(np);
>>>
>>> +     if (IS_ENABLED(CONFIG_UML))
>>> +             unflatten_device_tree();
>>> +
>>>       pr_info("start of unittest - you will see error messages\n");
>>>       of_unittest_check_tree_linkage();
>>>       of_unittest_check_phandles();
>>>
>>
>> (Insert my usual disclaimer that I am clueless about UML, I still need to learn
>> about it...)
>>
>> This does not look correct to me.
>>
>> A few lines earlier in of_unittest(), the live devicetree needs to exist for
>> unittest_data_data() and a few of_*() functions to succeed.  So it seems
>> that the unflatten_device_tree() for uml should be at the beginning of
>> of_unittest().
> 
> It is true that other functions ahead of it depend on the presence of
> a device tree, but an unflattened tree does get linked in somewhere
> else. Despite that, this is needed for overlay_base_root. I got
> similar behavior if you don't link in a flattened device tree on x86.
> Thus, the order in which you call them doesn't actually seem to
> matter. I found no difference from changing the order in UML myself.
> 
> Without my patch we get the following error,
> ### dt-test ### FAIL of_unittest_overlay_high_level():2372
> overlay_base_root not initialized
> ### dt-test ### end of unittest - 219 passed, 1 failed
> 
> With my patch we get:
> ### dt-test ### end of unittest - 224 passed, 0 failed

Thanks for reporting both the failure and the success cases,
that helps me understand a little bit better.

If instead of the above patch, if you add the following (untested,
not even compile tested) to the beginning of of_unittest():

	if (IS_ENABLED(CONFIG_UML))
		unittest_unflatten_overlay_base();

does that also result in a good test result of:

	### dt-test ### end of unittest - 224 passed, 0 failed

I think I need to find some time to build and boot a UML kernel soon.

My current _guess_ is that the original problem was not a failure to
unflatten any present devicetree in UML but instead that the UML
kernel does not call unflatten_device_tree() and thus fails to
indirectly call unittest_unflatten_overlay_base(), which is
called by unflatten_device_tree().

unittest_unflatten_overlay_base() is an unfortunate wart that I
added, but I don't have a better alternative yet.

-Frank

> 
> I used the following .config for these results:
> CONFIG_OF=y
> CONFIG_OF_UNITTEST=y
> CONFIG_OF_OVERLAY=y
> CONFIG_I2C=y
> CONFIG_I2C_MUX=y
> 
>>
>> Rob, if I am correct please revert this patch.
>>
> 
> Cheers
> 
