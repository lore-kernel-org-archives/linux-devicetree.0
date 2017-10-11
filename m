From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: linux-next: Tree for Oct 9th (of: unittest: testcases)
Date: Wed, 11 Oct 2017 11:11:14 -0700
Message-ID: <59DE5EC2.9030306@gmail.com>
References: <20171009212122.wx4lgnecmqyzuywq@sirena.co.uk>
 <7524d1e5-137c-cb78-c24f-6a9701e46701@infradead.org>
 <CAL_JsqJgf+HOp-7DNzpExOE2UnXbraL3uaL0a01K4t8Z6fkoSA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJgf+HOp-7DNzpExOE2UnXbraL3uaL0a01K4t8Z6fkoSA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: Mark Brown <broonie@kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 10/10/17 11:26, Rob Herring wrote:
> +Frank
> 
> On Tue, Oct 10, 2017 at 12:33 PM, Randy Dunlap <rdunlap@infradead.org> wrote:
>> On 10/09/17 14:21, Mark Brown wrote:
>>> For my birthday I've gone and got myself a linux-next tree:
>>>
>>> Changes since 20170929:
>>>
>>> The net-next and drm trees lost their build failures but the rcu tree
>>> gained one.
>>
>>
>> I don't know what this is but it's new AFAIK.
>> (seen on i386 and x86_64)
> 
> Yes, new dtc version with new warnings.
> 
>>   DTC     drivers/of/unittest-data/testcases.dtb
>> drivers/of/unittest-data/testcases.dtb: Warning (interrupts_extended_property): Could not get phandle node for /__local_fixups__/testcase-data/interrupts/interrupts-extended0:interrupts-extended(cell 3)
> 
> Frank, this is in __local_fixups__, we should be able to remove that
> now as the necessary dtc changes are in place, right?

Yes, I have a patch to add "/plugin/;" to testcases.dts and remove the __local_fixups__ node,
but have not submitted it yet.

It builds and the unit tests still work.

I still need to rework all of the overlays that are hand coded in testcases.dts,
and was planning to do that before submitting the above changes.

-Frank

> 
>> drivers/of/unittest-data/testcases.dtb: Warning (interrupts_property): interrupts size is (4), expected multiple of 8 in /testcase-data/testcase-device2
> 
> This one is purposely bad data to feed the unit test. If I suppress
> it, then it is suppressed everywhere in the unit test data.
> 
> Rob
> .
> 
