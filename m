From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] of: irq: don't return 0 from of_irq_get()
Date: Fri, 10 Jun 2016 15:14:40 +0300
Message-ID: <65e9eb00-ba9a-87c5-1410-8a5da6b42c8f@cogentembedded.com>
References: <20938812.efaALfQEUn@wasted.cogentembedded.com>
 <20160603121432.GB8472@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160603121432.GB8472@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: grant.likely@linaro.org, devicetree@vger.kernel.org, frowand.list@gmail.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 6/3/2016 3:14 PM, Rob Herring wrote:

>> of_irq_get() returns 0 iff irq_create_of_mapping() call fails. Returning
>> both error code  and 0 on failure is a sign of a misdesigned API. Return
>> -ENXIO instead like one of the callers, platform_get_irq(), does; fix up
>> the kernel-doc as well...
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> So I think this is done this way because of the variation in NO_IRQ
> definition across architectures.

    I remember that NO_IRQ is "considered harmful" by Linus. Actually, I'm nit 
sure what you mean, could you elaborate on that?

> But then again, of_irq_get is
> relatively new.

> Rob

MBR, Sergei
