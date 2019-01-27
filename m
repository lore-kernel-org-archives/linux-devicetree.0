Return-Path: <SRS0=WAFM=QD=martingkelly.com=martin@kernel.org>
Subject: Re: [PATCH v2 2/6] iio:bmi160: add drdy interrupt support
References: <20190122020431.5338-1-martin@martingkelly.com>
 <20190122020431.5338-2-martin@martingkelly.com>
 <20190126201756.12faa7bb@archlinux>
From: Martin Kelly <martin@martingkelly.com>
Message-ID: <e2ede2cc-527e-24e1-81de-0fe7b6b2cc4c@martingkelly.com>
Date: Sun, 27 Jan 2019 12:43:26 -0800
MIME-Version: 1.0
In-Reply-To: <20190126201756.12faa7bb@archlinux>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Daniel Baluta <daniel.baluta@gmail.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 1/26/19 12:17 PM, Jonathan Cameron wrote:
> On Mon, 21 Jan 2019 18:04:27 -0800
> Martin Kelly <martin@martingkelly.com> wrote:
> 
>> From: Martin Kelly <martin@martingkelly.com>
>>
>> Add interrupt support for the data ready signal on the BMI160, which fires
>> an interrupt whenever new accelerometer/gyroscope data is ready to read.
>>
>> Signed-off-by: Martin Kelly <martin@martingkelly.com>
[snip]

> 
> That seems unlikely.  Why on a rising trigger are we setting a flag
> that is named to imply it sets level triggering?
> 

Looking again, I see that the code is right but the names/comment were 
wrong. In v3, I renamed BMI160_LEVEL_TRIGGERED to BMI160_EDGE_TRIGGERED, 
as the default is actually level-triggered active-low. The datasheet (p 
63) has a sentence:

‘1’ (‘0’) is edge (level) triggered for INT1 pin

which I read backwards.
