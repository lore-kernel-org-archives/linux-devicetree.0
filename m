From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 00/10] Revamp Semtech SX150x driver
Date: Fri, 21 Oct 2016 11:17:50 +0200
Message-ID: <c5e42986-5b7f-a95f-da63-ab10dc84ddee@baylibre.com>
References: <1476885846-16469-1-git-send-email-andrew.smirnov@gmail.com>
 <CACRpkdbW=fdDn2uOchNHRYvhorGseNDyV_Kx11oeCTS+X9XHcQ@mail.gmail.com>
 <CAHQ1cqH-fyPV_Z1ARwiAVHX2LO9yd_vGXcX_uMWg2ToXfsqB2g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHQ1cqH-fyPV_Z1ARwiAVHX2LO9yd_vGXcX_uMWg2ToXfsqB2g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Healy <cphealy@gmail.com>
List-Id: devicetree@vger.kernel.org

On 10/20/2016 09:34 PM, Andrey Smirnov wrote:
> On Thu, Oct 20, 2016 at 12:08 PM, Linus Walleij
> <linus.walleij@linaro.org> wrote:
>> On Wed, Oct 19, 2016 at 4:03 PM, Andrey Smirnov
>> <andrew.smirnov@gmail.com> wrote:
>>
>>> Hello everyone,
>>>
>>> This is the second version of the patchset originally submitted here:
>>>
>>> http://www.spinics.net/lists/devicetree/msg146176.html
>>
>> I'm sorry about your efforts, and sorry for not having had time to
>> comment earlier, but this driver will be removed and replaced by
>> a pin control driver by Neil Armstrong:
>> http://marc.info/?l=linux-gpio&m=147499137422454&w=2
>>
>> As you can see it arrived some weeks before.
>>
>> Can you please review Neils patch and make sure it satisfies
>> your usecases?
> 
> Sure, I'll grab those patches and provide comments, Tested-by's, etc.
> 
> Thanks,
> Andrey Smirnov
> 

Hi Andrey,

Please find the v3 patch at https://marc.info/?l=linux-gpio&m=147704101505236&w=2

Maybe it could better to actually add the 1503 support even if it's using the sx1506q_device_data.

Could you try out this driver and report a Tested-by if successful ?

Neil
