Return-Path: <SRS0=y//A=QQ=martingkelly.com=martin@kernel.org>
Subject: Re: [PATCH v4 3/6] dt-bindings: fix incorrect bmi160 IRQ note
References: <20190202215601.20275-1-martin@martingkelly.com>
 <20190202215601.20275-4-martin@martingkelly.com>
 <20190209151715.676fc7df@archlinux>
From: Martin Kelly <martin@martingkelly.com>
Message-ID: <588057dd-a406-3d0a-fd6a-b25a5bf9e804@martingkelly.com>
Date: Sat, 9 Feb 2019 10:37:11 -0800
MIME-Version: 1.0
In-Reply-To: <20190209151715.676fc7df@archlinux>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Daniel Baluta <daniel.baluta@gmail.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 2/9/19 7:17 AM, Jonathan Cameron wrote:
> On Sat,  2 Feb 2019 13:55:58 -0800
> Martin Kelly <martin@martingkelly.com> wrote:
> 
>> From: Martin Kelly <martin@martingkelly.com>
>>
>> The bmi160 bindings say that the BMI160 requires level-triggered,
>> active-low interrupts, but it actually supports all interrupt types, so fix
>> the note to reflect that.
>>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> Signed-off-by: Martin Kelly <martin@martingkelly.com>
> I'm not sure why you changed the example, but it does no hard.
> 

I guess I just wanted to make it even clearer that level-low is not the 
only IRQ type available, but you're right that it's not strictly necessary.
