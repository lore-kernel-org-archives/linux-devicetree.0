From: "long.wanglong" <long.wanglong@huawei.com>
Subject: Re: [PATCH v2 1/2] Documentation: update the of_selftest.txt
Date: Wed, 11 Mar 2015 11:07:26 +0800
Message-ID: <54FFB16E.2000106@huawei.com>
References: <1425868525-113952-1-git-send-email-long.wanglong@huawei.com> <CAL_JsqLgxCQW==4YQrX193g+x22d1iL2jBGY4CSMnq7cQcSgZQ@mail.gmail.com> <CAL_JsqJiWhXQqGCik9tDqyaXEqU8+gEdw=FBVL_Fddbk_SjfwQ@mail.gmail.com> <CA+rpMb+xL4g5bzGQhUe7kFkCmpH3VwGXsVP3zypW1w6366gAkw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+rpMb+xL4g5bzGQhUe7kFkCmpH3VwGXsVP3zypW1w6366gAkw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gaurav Minocha <gaurav.minocha.os@gmail.com>
Cc: Rob Herring <robherring2@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Grant Likely <grant.likely@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Kumar Gala <galak@codeaurora.org>, peifeiyue@huawei.com
List-Id: devicetree@vger.kernel.org

On 2015/3/10 23:16, Gaurav Minocha wrote:
> Hi Rob,
> 
> On Mar 10, 2015 7:51 AM, "Rob Herring" <robherring2@gmail.com <mailto:robherring2@gmail.com>> wrote:
>>
>> On Tue, Mar 10, 2015 at 9:44 AM, Rob Herring <robherring2@gmail.com <mailto:robherring2@gmail.com>> wrote:
>> > On Sun, Mar 8, 2015 at 9:35 PM, Wang Long <long.wanglong@huawei.com <mailto:long.wanglong@huawei.com>> wrote:
>> >> Since the directory "drivers/of/testcase-data" is renamed
>> >> to "drivers/of/unittest-data". so we should update the path
>> >> in the of_selftest.txt.
>>
>> [...]
>>
>> >> -Before executing OF selftest, it is required to attach the test data to
>> >> +Before executing OF unittest, it is required to attach the test data to
>> >>  machine's device tree (if present). So, when selftest_data_add() is called,
>> >
>> > This one too.
>>
>> Or not. The functions are all still "selftest". Not sure why Grant
>> left all those...
> 
> I will send a patch to replace the selftest with unitest also will update the document if required..
> 
Hi Gaurav, Rob

I have done the work. before replacing the selftest with unittest, i will fix some error in OF unittest.
Please review my patch, and give me some advices.

Thanks.

Best Regards
Wang Long

>>
>> Rob
> 
